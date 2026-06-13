import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_better_auth/core/api/models/result/result_extension.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

import '../../../flutter_better_auth.dart';
import '../../better_auth_client.dart';
import '../../models/result/better_error.dart';
import '../../models/result/result.dart';
import '../social/social_extension.dart';
import 'models/social/sign_in_social_response.dart';
import 'models/social/social_id_token_body.dart';
import 'sign_in_better_auth.dart';

extension SignInSocialExtension on SignInBetterAuth {
  Future<Result<SignInSocialResponse>> social({
    required String provider,
    String? callbackURL,
    String? callbackUrlScheme,
    String? newUserCallbackURL,
    String? errorCallbackURL,
    bool? disableRedirect = true,
    String? scopes,
    SocialIdTokenBody? idToken,
    String? requestSignUp,
    String? loginHint,
  }) async {
    final effectiveScheme = callbackUrlScheme ?? FlutterBetterAuth.appScheme;
    final normalizedCallbackURL = _resolveMobileCallbackURL(
      callbackURL,
      callbackUrlScheme: effectiveScheme,
      provideDefault: !kIsWeb && idToken == null,
    );
    final normalizedNewUserCallbackURL = _resolveMobileCallbackURL(
      newUserCallbackURL,
      callbackUrlScheme: effectiveScheme,
    );
    final normalizedErrorCallbackURL = _resolveMobileCallbackURL(
      errorCallbackURL,
      callbackUrlScheme: effectiveScheme,
    );

    final res = await socialAuth(
      provider: provider,
      callbackURL: idToken != null ? callbackURL : normalizedCallbackURL,
      newUserCallbackURL: idToken != null
          ? newUserCallbackURL
          : normalizedNewUserCallbackURL,
      errorCallbackURL: idToken != null
          ? errorCallbackURL
          : normalizedErrorCallbackURL,
      disableRedirect: disableRedirect,
      scopes: scopes,
      idToken: idToken,
      requestSignUp: requestSignUp,
      loginHint: loginHint,
    );
    if (idToken != null) {
      return res;
    }
    final effectiveCallbackScheme =
        effectiveScheme ?? _extractSchemeFromUrl(normalizedCallbackURL);
    if (res.data != null && effectiveCallbackScheme != null) {
      try {
        final baseUri = Uri.parse(FlutterBetterAuth.baseUrl);
        final storedCookies = await FlutterBetterAuth.cookieJar.loadForRequest(
          baseUri,
        );
        final oauthState = findBetterAuthOAuthState(storedCookies);
        final proxyUrl = buildBetterAuthOAuthProxyUri(
          baseUrl: FlutterBetterAuth.baseUrl,
          authorizationUrl: res.data!.url,
          oauthState: oauthState,
        );
        final result = await FlutterWebAuth2.authenticate(
          url: proxyUrl.toString(),
          callbackUrlScheme: effectiveCallbackScheme,
        );
        final url = Uri.tryParse(result);
        final cookie = url?.queryParameters['cookie'];
        if (cookie != null && cookie.isNotEmpty) {
          final List<Cookie> cookies = [cookie]
              .map((str) => str.split(RegExp('(?<=)(,)(?=[^;]+?=)')))
              .expand((cookie) => cookie)
              .where((cookie) => cookie.isNotEmpty)
              .map((str) => Cookie.fromSetCookieValue(str))
              .toList();

          await FlutterBetterAuth.cookieJar.saveFromResponse(baseUri, cookies);
          await FlutterBetterAuth.refreshSession();
        } else {
          final code = url?.queryParameters['code'];
          final state = url?.queryParameters['state'];
          if (code != null && code.isNotEmpty) {
            await FlutterBetterAuth.client.social.callback(
              provider: provider,
              code: code,
              state: state,
            );
            await FlutterBetterAuth.refreshSession();
          }
        }
      } on PlatformException catch (e) {
        return Result.err(
          BetterError(
            code: e.code,
            message: e.message ?? "Error",
            stack: e.stacktrace,
          ),
        );
      } catch (e) {
        return Result.err(
          BetterError(
            code: "ERROR",
            message: e.toString(),
            stack: e.toString(),
          ),
        );
      }
    }
    return res;
  }
}

Uri buildBetterAuthOAuthProxyUri({
  required String baseUrl,
  required String authorizationUrl,
  String? oauthState,
}) {
  final normalizedBaseUrl = baseUrl.endsWith('/')
      ? baseUrl.substring(0, baseUrl.length - 1)
      : baseUrl;
  return Uri.parse('$normalizedBaseUrl/expo-authorization-proxy').replace(
    queryParameters: {
      'authorizationURL': authorizationUrl,
      if (oauthState != null) 'oauthState': oauthState,
    },
  );
}

String? findBetterAuthOAuthState(List<Cookie> cookies) {
  for (final cookie in cookies) {
    if (cookie.name == 'oauth_state' ||
        cookie.name.endsWith('.oauth_state') ||
        cookie.name.endsWith('-oauth_state')) {
      return cookie.value;
    }
  }
  return null;
}

extension SignInBetterAuthExtension on BetterAuthClient {
  SignInBetterAuth get signIn => SignInBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );
}

String? _resolveMobileCallbackURL(
  String? url, {
  required String? callbackUrlScheme,
  bool provideDefault = false,
}) {
  if (kIsWeb) {
    return url;
  }
  if (url == null || url.isEmpty) {
    if (provideDefault &&
        callbackUrlScheme != null &&
        callbackUrlScheme.isNotEmpty) {
      return '$callbackUrlScheme://auth-callback';
    }
    return url;
  }
  final parsed = Uri.parse(url);
  if (parsed.hasScheme ||
      callbackUrlScheme == null ||
      callbackUrlScheme.isEmpty) {
    return url;
  }
  final normalizedPath = url.startsWith('/') ? url : '/$url';
  return Uri(
    scheme: callbackUrlScheme,
    host: 'auth-callback',
    path: normalizedPath,
  ).toString();
}

String? _extractSchemeFromUrl(String? url) {
  if (url == null || url.isEmpty) {
    return null;
  }
  final parsed = Uri.tryParse(url);
  if (parsed == null || !parsed.hasScheme || parsed.scheme.isEmpty) {
    return null;
  }
  return parsed.scheme;
}

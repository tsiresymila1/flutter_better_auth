import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_better_auth/core/api/models/result/result_extension.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

import '../../../flutter_better_auth.dart';
import '../../../utils/logger.dart';
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
        logger.d('[BetterAuth] web-auth callback url: $result');
        final callback = parseOAuthCallback(result);
        logger.d(
          '[BetterAuth] callback params: ${callback.allParams.keys.toList()}',
        );
        final cookie = callback.cookie;
        if (cookie != null && cookie.isNotEmpty) {
          final cookies = cookiesFromSetCookieParam(cookie);
          await FlutterBetterAuth.cookieJar.saveFromResponse(baseUri, cookies);
          await FlutterBetterAuth.refreshSession();
        } else if (callback.code != null && callback.code!.isNotEmpty) {
          await FlutterBetterAuth.client.social.callback(
            provider: provider,
            code: callback.code,
            state: callback.state,
          );
          await FlutterBetterAuth.refreshSession();
        } else {
          logger.w(
            '[BetterAuth] callback carried no session cookie or code. '
            'params=${callback.allParams.keys.toList()} '
            'error=${callback.error}',
          );
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

/// Parsed contents of the deeplink that `flutter_web_auth_2` returns after the
/// OAuth round-trip.
///
/// Reads query parameters and, as a fallback, fragment parameters (some
/// providers/servers return data in the URL fragment instead of the query).
class OAuthCallbackResult {
  const OAuthCallbackResult({
    required this.raw,
    required this.allParams,
    this.cookie,
    this.code,
    this.state,
    this.error,
  });

  /// The raw callback URL string returned by `flutter_web_auth_2`.
  final String raw;

  /// All parameters found in the query (and fragment) of the callback URL.
  final Map<String, String> allParams;

  /// Set-Cookie value carried by the native deeplink (Better Auth Expo flow).
  final String? cookie;

  /// OAuth authorization code, when the server returns code/state instead.
  final String? code;
  final String? state;

  /// `error` / `error_description`, when the provider reports a failure.
  final String? error;
}

/// Parses the callback deeplink returned by `flutter_web_auth_2`.
OAuthCallbackResult parseOAuthCallback(String callbackUrl) {
  final uri = Uri.tryParse(callbackUrl);
  final params = <String, String>{};
  if (uri != null) {
    params.addAll(uri.queryParameters);
    if (uri.fragment.isNotEmpty) {
      try {
        Uri.splitQueryString(uri.fragment).forEach((key, value) {
          params.putIfAbsent(key, () => value);
        });
      } catch (_) {
        // Fragment was not a query string; ignore.
      }
    }
  }
  return OAuthCallbackResult(
    raw: callbackUrl,
    allParams: params,
    cookie: params['cookie'],
    code: params['code'],
    state: params['state'],
    error: params['error'] ?? params['error_description'],
  );
}

/// Splits the `cookie` deeplink parameter (a Set-Cookie header value that may
/// contain multiple comma-separated cookies) into [Cookie] objects.
List<Cookie> cookiesFromSetCookieParam(String cookieParam) {
  return [cookieParam]
      .map((str) => str.split(RegExp('(?<=)(,)(?=[^;]+?=)')))
      .expand((parts) => parts)
      .where((part) => part.trim().isNotEmpty)
      .map((str) => Cookie.fromSetCookieValue(str))
      .toList();
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

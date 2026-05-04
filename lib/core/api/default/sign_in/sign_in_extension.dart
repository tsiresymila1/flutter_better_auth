import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_better_auth/core/api/models/result/result_extension.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

import '../../../flutter_better_auth.dart';
import '../../better_auth_client.dart';
import '../../models/result/better_error.dart';
import '../../models/result/result.dart';
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

    final res = await socialAuth(
      provider: provider,
      callbackURL:
          idToken != null
              ? callbackURL
              : callbackURL != null
              ? !kIsWeb
                  ? Uri.parse(
                    callbackURL,
                  ).replace(scheme: callbackUrlScheme).toString()
                  : callbackURL
              : !kIsWeb && idToken != null
              ? "${callbackUrlScheme ?? 'https'}://auth-callback"
              : null,

      newUserCallbackURL:
          idToken != null
              ? newUserCallbackURL
              : newUserCallbackURL != null
              ? !kIsWeb
                  ? Uri.parse(
                    newUserCallbackURL,
                  ).replace(scheme: callbackUrlScheme).toString()
                  : newUserCallbackURL
              : null,

      errorCallbackURL:
          idToken != null
              ? errorCallbackURL
              : errorCallbackURL != null
              ? !kIsWeb
                  ? Uri.parse(
                    errorCallbackURL,
                  ).replace(scheme: callbackUrlScheme).toString()
                  : errorCallbackURL
              : null,
      disableRedirect: disableRedirect,
      scopes: scopes,
      idToken: idToken,
      requestSignUp: requestSignUp,
      loginHint: loginHint,
    );
    if (idToken != null) {
      return res;
    }
    if (res.data != null && callbackUrlScheme != null) {
      try {
        final newUrl = Uri.parse(res.data!.url).toString().replaceAll(FlutterBetterAuth.baseUrl, "$callbackUrlScheme://auth-callback");
        final result = await FlutterWebAuth2.authenticate(
          url: "${FlutterBetterAuth.baseUrl}/expo-authorization-proxy?authorizationURL=${Uri.encodeComponent(newUrl)}",
          callbackUrlScheme: callbackUrlScheme,
        );
        final url = Uri.tryParse(result);
        final cookie = url?.queryParameters['cookie'];
        if (cookie != null && cookie.isNotEmpty) {
          final List<Cookie> cookies =
              [cookie]
                  .map((str) => str.split(RegExp('(?<=)(,)(?=[^;]+?=)')))
                  .expand((cookie) => cookie)
                  .where((cookie) => cookie.isNotEmpty)
                  .map((str) => Cookie.fromSetCookieValue(str))
                  .toList();

          await FlutterBetterAuth.storage?.saveCookies(
            Uri.parse(FlutterBetterAuth.baseUrl).host,
            cookies,
          );
        }
      } on PlatformException catch (e) {
        return Result.err(
          BetterError(
            code: e.code,
            message: e.message?? "Error",
            stack: e.stacktrace,
          ),
        );
      } 
      catch (e) {
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

extension SignInBetterAuthExtension on BetterAuthClient {
  SignInBetterAuth get signIn => SignInBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );
}

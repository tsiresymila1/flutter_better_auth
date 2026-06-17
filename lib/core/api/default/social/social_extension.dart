import 'package:flutter/foundation.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

import '../../../flutter_better_auth.dart';
import '../../better_auth_client.dart';
import '../../models/result/result.dart';
import '../../models/result/result_extension.dart';
import '../../web_redirect.dart';
import '../sign_in/sign_in_extension.dart';
import 'models/link/social_link_response.dart';
import 'social_better_auth.dart';

extension SocialBetterAuthExtension on BetterAuthClient {
  SocialBetterAuth get social => SocialBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );
}

extension SocialLinkRedirectExtension on SocialBetterAuth {
  /// Like [link], but also drives the OAuth round-trip and links the provider
  /// to the currently signed-in user.
  ///
  /// - **Web:** full-page browser redirect to the provider, returning to
  ///   [callbackURL] (defaults to the app origin).
  /// - **Native:** opens the provider through the Better Auth authorization
  ///   proxy (so the OAuth `state` survives) and returns via the
  ///   `scheme://auth-callback` deep link, then refreshes the session.
  Future<Result<SocialLinkResponse>> linkAndRedirect({
    required String provider,
    String? callbackURL,
    List<String>? scopes,
  }) async {
    final scheme = FlutterBetterAuth.appScheme;
    final effectiveCallback =
        callbackURL ??
        (kIsWeb
            ? currentOrigin()
            : (scheme != null && scheme.isNotEmpty
                  ? '$scheme://auth-callback'
                  : null));

    final res = await link(
      provider: provider,
      callbackURL: effectiveCallback,
      scopes: scopes,
    );
    final url = res.data?.url;
    if (url == null || url.isEmpty) {
      return res;
    }

    if (kIsWeb) {
      redirectToUrl(url);
      return res;
    }

    if (scheme != null && scheme.isNotEmpty) {
      try {
        final baseUri = Uri.parse(FlutterBetterAuth.baseUrl);
        final stored = await FlutterBetterAuth.cookieJar.loadForRequest(baseUri);
        final oauthState = findBetterAuthOAuthState(stored);
        final proxyUrl = buildBetterAuthOAuthProxyUri(
          baseUrl: FlutterBetterAuth.baseUrl,
          authorizationUrl: url,
          oauthState: oauthState,
        );
        await FlutterWebAuth2.authenticate(
          url: proxyUrl.toString(),
          callbackUrlScheme: scheme,
        );
        await FlutterBetterAuth.refreshSession();
      } catch (_) {
        // Surface the original response; the caller can inspect res.data.url.
      }
    }
    return res;
  }
}

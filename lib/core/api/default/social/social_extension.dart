import 'package:flutter/foundation.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

import '../../../flutter_better_auth.dart';
import '../../better_auth_client.dart';
import '../../models/result/result.dart';
import '../../models/result/result_extension.dart';
import '../../web_redirect.dart';
import 'models/link/social_link_response.dart';
import 'social_better_auth.dart';

extension SocialBetterAuthExtension on BetterAuthClient {
  SocialBetterAuth get social => SocialBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );
}

extension SocialLinkRedirectExtension on SocialBetterAuth {
  /// Like [link], but also drives the OAuth round-trip: on web it does a
  /// full-page browser redirect to the provider (returning to [callbackURL],
  /// which defaults to the app origin); on native it opens the provider via
  /// `flutter_web_auth_2` and refreshes the session. The account is linked to
  /// the currently signed-in user.
  Future<Result<SocialLinkResponse>> linkAndRedirect({
    required String provider,
    String? callbackURL,
    List<String>? scopes,
  }) async {
    final res = await link(
      provider: provider,
      callbackURL: callbackURL ?? (kIsWeb ? currentOrigin() : null),
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
    final scheme = FlutterBetterAuth.appScheme;
    if (scheme != null && scheme.isNotEmpty) {
      try {
        await FlutterWebAuth2.authenticate(url: url, callbackUrlScheme: scheme);
        await FlutterBetterAuth.refreshSession();
      } catch (_) {
        // Surface the original response; the caller can inspect res.data.url.
      }
    }
    return res;
  }
}

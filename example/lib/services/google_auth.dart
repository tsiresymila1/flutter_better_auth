import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Wraps google_sign_in v7 to obtain a Google ID token and hand it to Better
/// Auth's native (idToken) social sign-in.
///
/// Setup required (see example/README.md):
///  - GOOGLE_SERVER_CLIENT_ID = the Google OAuth **Web** client id configured
///    on the Better Auth server's `socialProviders.google.clientId`.
///  - iOS: GOOGLE_IOS_CLIENT_ID + reversed-client-id URL scheme in Info.plist.
///  - Android: app SHA-1 registered with an Android OAuth client.
class GoogleAuthService {
  static bool _initialized = false;

  static Future<void> init({String? serverClientId, String? clientId}) async {
    if (_initialized) return;
    await GoogleSignIn.instance.initialize(
      serverClientId: serverClientId,
      clientId: clientId,
    );
    _initialized = true;
  }

  /// Triggers the native Google account picker, then exchanges the resulting
  /// ID token with Better Auth via `signIn.social(idToken:)`.
  static Future<Result<SignInSocialResponse>> signIn() async {
    if (!GoogleSignIn.instance.supportsAuthenticate()) {
      throw StateError('Google authenticate() is unsupported on this platform');
    }
    final account = await GoogleSignIn.instance.authenticate();
    final idToken = account.authentication.idToken;
    if (idToken == null || idToken.isEmpty) {
      throw StateError(
        'Google returned no ID token — check GOOGLE_SERVER_CLIENT_ID',
      );
    }
    return FlutterBetterAuth.client.signIn.social(
      provider: 'google',
      idToken: SocialIdTokenBody(token: idToken),
    );
  }

  static Future<void> signOut() => GoogleSignIn.instance.signOut();
}

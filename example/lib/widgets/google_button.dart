// A platform-adaptive Google sign-in button:
//  - Web: renders the Google Identity Services button (google_sign_in_web) and
//    exchanges the resulting ID token with Better Auth.
//  - Native: a normal button that calls GoogleSignIn.authenticate().
export 'google_button_io.dart'
    if (dart.library.js_interop) 'google_button_web.dart';

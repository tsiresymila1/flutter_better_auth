import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/web_only.dart' as web;

import '../harness/widgets.dart';

/// Web: renders the Google Identity Services button and, when the user signs
/// in, exchanges the ID token with Better Auth via `signIn.social(idToken:)`.
class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key, required this.console});
  final ConsoleController console;

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  StreamSubscription<GoogleSignInAuthenticationEvent>? _sub;

  @override
  void initState() {
    super.initState();
    _sub = GoogleSignIn.instance.authenticationEvents.listen((event) async {
      if (event is GoogleSignInAuthenticationEventSignIn) {
        final idToken = event.user.authentication.idToken;
        if (idToken == null || idToken.isEmpty) {
          widget.console.log('✗ google idToken (web) → no ID token');
          return;
        }
        await runAction(
          widget.console,
          'google idToken (web)',
          () => FlutterBetterAuth.client.signIn.social(
            provider: 'google',
            idToken: SocialIdTokenBody(token: idToken),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The GIS button must be rendered by Google; clicking it starts the flow.
    return Align(
      alignment: Alignment.centerLeft,
      child: web.renderButton(),
    );
  }
}

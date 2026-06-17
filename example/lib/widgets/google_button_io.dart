import 'package:flutter/material.dart';

import '../harness/widgets.dart';
import '../services/google_auth.dart';

/// Native: a normal button calling the native Google sign-in (idToken) flow.
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, required this.console});
  final ConsoleController console;

  @override
  Widget build(BuildContext context) {
    return Act(
      'Google (idToken)',
      () => runAction(console, 'google idToken', () => GoogleAuthService.signIn()),
    );
  }
}

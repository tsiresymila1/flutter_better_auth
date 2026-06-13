import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

import '../harness/widgets.dart';

class SessionsTab extends StatefulWidget {
  const SessionsTab({super.key});
  @override
  State<SessionsTab> createState() => _SessionsTabState();
}

class _SessionsTabState extends State<SessionsTab> {
  final _console = ConsoleController();
  final _token = TextEditingController();

  BetterAuthClient get c => FlutterBetterAuth.client;

  @override
  void dispose() {
    _console.dispose();
    _token.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HarnessTab(
      console: _console,
      children: [
        Act(
          'List sessions',
          () => runAction(_console, 'listSessions', () => c.listSessions()),
        ),
        Field('session token', _token),
        Act(
          'Revoke session',
          () => runAction(
            _console,
            'revokeSession',
            () => c.revokeSession(token: _token.text),
          ),
        ),
        Act(
          'Revoke other sessions',
          () => runAction(
            _console,
            'revokeOtherSessions',
            () => c.revokeOtherSessions(),
          ),
        ),
        Act(
          'Revoke ALL sessions',
          () => runAction(_console, 'revokeSessions', () => c.revokeSessions()),
        ),
      ],
    );
  }
}

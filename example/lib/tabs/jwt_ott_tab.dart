import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_better_auth/plugins/jwt/jwt_plugin.dart';

import '../harness/widgets.dart';

class JwtOttTab extends StatefulWidget {
  const JwtOttTab({super.key});
  @override
  State<JwtOttTab> createState() => _JwtOttTabState();
}

class _JwtOttTabState extends State<JwtOttTab> {
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
        const SectionLabel('JWT'),
        Act(
          'Get token',
          () => runAction(_console, 'jwt.token', () => c.jwt.token()),
        ),
        Act('Get JWKS', () => runAction(_console, 'jwt.jwks', () => c.jwt.jwks())),
        const SectionLabel('One-time token'),
        Act(
          'Generate OTT',
          () => runAction(
            _console,
            'oneTimeToken.generate',
            () => c.oneTimeToken.generate(),
          ),
        ),
        Field('token (verify)', _token),
        Act(
          'Verify OTT',
          () => runAction(
            _console,
            'oneTimeToken.verify',
            () => c.oneTimeToken.verify(token: _token.text),
          ),
        ),
      ],
    );
  }
}

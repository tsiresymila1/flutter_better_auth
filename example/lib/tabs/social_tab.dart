import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

import '../harness/widgets.dart';
import '../services/google_auth.dart';

class SocialTab extends StatefulWidget {
  const SocialTab({super.key});
  @override
  State<SocialTab> createState() => _SocialTabState();
}

class _SocialTabState extends State<SocialTab> {
  final _console = ConsoleController();
  final _provider = TextEditingController(text: 'github');
  final _accountId = TextEditingController();

  BetterAuthClient get c => FlutterBetterAuth.client;

  @override
  void dispose() {
    _console.dispose();
    _provider.dispose();
    _accountId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HarnessTab(
      console: _console,
      children: [
        const SectionLabel('Redirect sign-in'),
        Act(
          'GitHub (redirect)',
          () => runAction(
            _console,
            'signIn.social github',
            () => c.signIn.social(provider: 'github', callbackUrlScheme: 'myapp'),
          ),
        ),
        const SectionLabel('Native idToken sign-in'),
        Act(
          'Google (idToken)',
          () => runAction(
            _console,
            'google idToken',
            () => GoogleAuthService.signIn(),
          ),
        ),
        const SectionLabel('Account linking'),
        Field('provider', _provider),
        Field('accountId (unlink/refresh)', _accountId),
        Act(
          'Link provider (redirect)',
          () => runAction(
            _console,
            'social.link',
            () => c.social.link(provider: _provider.text, callbackURL: 'myapp://'),
          ),
        ),
        Act(
          'Unlink account',
          () => runAction(
            _console,
            'social.unlink',
            () => c.social.unlink(
              providerId: _provider.text,
              accountId: _accountId.text.isEmpty ? null : _accountId.text,
            ),
          ),
        ),
        Act(
          'List accounts',
          () => runAction(
            _console,
            'social.listAccounts',
            () => c.social.listAccounts(),
          ),
        ),
        Act(
          'Refresh token',
          () => runAction(
            _console,
            'social.refreshToken',
            () => c.social.refreshToken(providerId: _provider.text),
          ),
        ),
        Act(
          'Get access token',
          () => runAction(
            _console,
            'social.getAccessToken',
            () => c.social.getAccessToken(providerId: _provider.text),
          ),
        ),
      ],
    );
  }
}

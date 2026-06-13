import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_better_auth/plugins/passkey/passkey_extension.dart';

import '../harness/widgets.dart';

class PasskeyTab extends StatefulWidget {
  const PasskeyTab({super.key});
  @override
  State<PasskeyTab> createState() => _PasskeyTabState();
}

class _PasskeyTabState extends State<PasskeyTab> {
  final _console = ConsoleController();
  final _id = TextEditingController();
  final _name = TextEditingController(text: 'My passkey');

  BetterAuthClient get c => FlutterBetterAuth.client;

  @override
  void dispose() {
    _console.dispose();
    _id.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HarnessTab(
      console: _console,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 4),
          child: Text(
            'Partial: real WebAuthn credential creation needs a native '
            'platform authenticator package. This tab exercises the endpoints '
            'the client exposes (options, list, delete, update).',
            style: TextStyle(fontSize: 11, color: Colors.orangeAccent),
          ),
        ),
        Field('passkey id', _id),
        Field('passkey name', _name),
        Act(
          'Generate authentication options',
          () => runAction(
            _console,
            'passkey.generateAuthenticationOptions',
            () => c.passkey.generateAuthenticationOptions(),
          ),
        ),
        Act(
          'List user passkeys',
          () => runAction(
            _console,
            'passkey.listUserPasskeys',
            () => c.passkey.listUserPasskeys(),
          ),
        ),
        Act(
          'Update passkey',
          () => runAction(
            _console,
            'passkey.updatePasskey',
            () => c.passkey.updatePasskey(id: _id.text, name: _name.text),
          ),
        ),
        Act(
          'Delete passkey',
          () => runAction(
            _console,
            'passkey.deletePasskey',
            () => c.passkey.deletePasskey(id: _id.text),
          ),
        ),
      ],
    );
  }
}

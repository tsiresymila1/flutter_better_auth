import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

import '../harness/widgets.dart';

class ApiKeyTab extends StatefulWidget {
  const ApiKeyTab({super.key});
  @override
  State<ApiKeyTab> createState() => _ApiKeyTabState();
}

class _ApiKeyTabState extends State<ApiKeyTab> {
  final _console = ConsoleController();
  final _name = TextEditingController(text: 'my-key');
  final _keyId = TextEditingController();
  final _key = TextEditingController();

  BetterAuthClient get c => FlutterBetterAuth.client;

  @override
  void dispose() {
    _console.dispose();
    _name.dispose();
    _keyId.dispose();
    _key.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HarnessTab(
      console: _console,
      children: [
        Field('name', _name),
        Field('keyId', _keyId),
        Field('key (verify)', _key),
        Act(
          'Create key',
          () => runAction(
            _console,
            'apiKey.create',
            () => c.apiKey.create(name: _name.text),
          ),
        ),
        Act(
          'List keys',
          () => runAction(_console, 'apiKey.list', () => c.apiKey.list()),
        ),
        Act(
          'Fetch key',
          () => runAction(
            _console,
            'apiKey.fetch',
            () => c.apiKey.fetch(id: _keyId.text),
          ),
        ),
        Act(
          'Update key (disable)',
          () => runAction(
            _console,
            'apiKey.update',
            () => c.apiKey.update(keyId: _keyId.text, enabled: false),
          ),
        ),
        Act(
          'Verify key',
          () => runAction(
            _console,
            'apiKey.verify',
            () => c.apiKey.verify(key: _key.text),
          ),
        ),
        Act(
          'Delete key',
          () => runAction(
            _console,
            'apiKey.delete',
            () => c.apiKey.delete(keyId: _keyId.text),
          ),
        ),
        Act(
          'Delete all expired',
          () => runAction(
            _console,
            'apiKey.deleteAllExpired',
            () => c.apiKey.deleteAllExpired(),
          ),
        ),
      ],
    );
  }
}

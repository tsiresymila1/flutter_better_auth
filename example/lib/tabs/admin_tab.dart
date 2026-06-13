import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

import '../harness/widgets.dart';

class AdminTab extends StatefulWidget {
  const AdminTab({super.key});
  @override
  State<AdminTab> createState() => _AdminTabState();
}

class _AdminTabState extends State<AdminTab> {
  final _console = ConsoleController();
  final _userId = TextEditingController();
  final _email = TextEditingController(text: 'new@mail.com');
  final _password = TextEditingController(text: '12345678');
  final _name = TextEditingController(text: 'New User');
  final _role = TextEditingController(text: 'user');
  final _banReason = TextEditingController(text: 'spam');

  BetterAuthClient get c => FlutterBetterAuth.client;

  @override
  void dispose() {
    _console.dispose();
    for (final ctl in [_userId, _email, _password, _name, _role, _banReason]) {
      ctl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HarnessTab(
      console: _console,
      children: [
        Field('userId', _userId),
        Field('email', _email),
        Field('password', _password, obscure: true),
        Field('name', _name),
        Field('role', _role),
        const SectionLabel('Users'),
        Act(
          'List users',
          () => runAction(
            _console,
            'admin.listUsers',
            () => c.admin.listUsers(limit: 20),
          ),
        ),
        Act(
          'Get user',
          () => runAction(
            _console,
            'admin.getUser',
            () => c.admin.getUser(id: _userId.text),
          ),
        ),
        Act(
          'Create user',
          () => runAction(
            _console,
            'admin.createUser',
            () => c.admin.createUser(
              email: _email.text,
              password: _password.text,
              name: _name.text,
              role: _role.text,
            ),
          ),
        ),
        Act(
          'Set role',
          () => runAction(
            _console,
            'admin.setRole',
            () => c.admin.setRole(userId: _userId.text, role: _role.text),
          ),
        ),
        const SectionLabel('Moderation'),
        Act(
          'Ban user',
          () => runAction(
            _console,
            'admin.banUser',
            () => c.admin.banUser(
              userId: _userId.text,
              banReason: _banReason.text,
            ),
          ),
        ),
        Act(
          'Unban user',
          () => runAction(
            _console,
            'admin.unbanUser',
            () => c.admin.unbanUser(userId: _userId.text),
          ),
        ),
        Act(
          'List user sessions',
          () => runAction(
            _console,
            'admin.listUserSessions',
            () => c.admin.listUserSessions(userId: _userId.text),
          ),
        ),
        Act(
          'Revoke user sessions',
          () => runAction(
            _console,
            'admin.revokeUserSessions',
            () => c.admin.revokeUserSessions(userId: _userId.text),
          ),
        ),
        const SectionLabel('Impersonation'),
        Act(
          'Impersonate user',
          () => runAction(
            _console,
            'admin.impersonateUser',
            () => c.admin.impersonateUser(userId: _userId.text),
          ),
        ),
        Act(
          'Stop impersonating',
          () => runAction(
            _console,
            'admin.stopImpersonating',
            () => c.admin.stopImpersonating(),
          ),
        ),
        Act(
          'Remove user',
          () => runAction(
            _console,
            'admin.removeUser',
            () => c.admin.removeUser(userId: _userId.text),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_better_auth/plugins/anonymous/anonymous_plugin.dart';

import '../harness/widgets.dart';

class AuthTab extends StatefulWidget {
  const AuthTab({super.key});
  @override
  State<AuthTab> createState() => _AuthTabState();
}

class _AuthTabState extends State<AuthTab> {
  final _console = ConsoleController();
  final _name = TextEditingController(text: 'Test User');
  final _email = TextEditingController(text: 'test@mail.com');
  final _password = TextEditingController(text: '12345678');
  final _username = TextEditingController(text: 'testuser');
  final _newPassword = TextEditingController(text: '87654321');
  final _resetToken = TextEditingController();
  final _image = TextEditingController();

  BetterAuthClient get c => FlutterBetterAuth.client;

  @override
  void dispose() {
    _console.dispose();
    for (final ctl in [
      _name,
      _email,
      _password,
      _username,
      _newPassword,
      _resetToken,
      _image,
    ]) {
      ctl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HarnessTab(
      console: _console,
      children: [
        const SectionLabel('Credentials'),
        Field('name', _name),
        Field('email', _email),
        Field('password', _password, obscure: true),
        Field('username', _username),
        const SectionLabel('Sign up / in'),
        Act(
          'Sign up (email)',
          () => runAction(
            _console,
            'signUp.email',
            () => c.signUp.email(
              name: _name.text,
              email: _email.text,
              password: _password.text,
            ),
          ),
        ),
        Act(
          'Sign in (email)',
          () => runAction(
            _console,
            'signIn.email',
            () => c.signIn.email(email: _email.text, password: _password.text),
          ),
        ),
        Act(
          'Sign in (username)',
          () => runAction(
            _console,
            'signIn.username',
            () => c.signIn.username(
              username: _username.text,
              password: _password.text,
            ),
          ),
        ),
        Act(
          'Sign in (anonymous)',
          () => runAction(_console, 'signIn.anonymous', () => c.signIn.anonymous()),
        ),
        const SectionLabel('Session'),
        Act(
          'Get session',
          () => runAction(_console, 'getSession', () => c.getSession()),
        ),
        Act('Sign out', () => runAction(_console, 'signOut', () => c.signOut())),
        const SectionLabel('Account'),
        Field('image url', _image),
        Act(
          'Update user',
          () => runAction(
            _console,
            'updateUser',
            () => c.updateUser(
              name: _name.text,
              image: _image.text.isEmpty ? null : _image.text,
            ),
          ),
        ),
        Field('new password', _newPassword, obscure: true),
        Act(
          'Change password',
          () => runAction(
            _console,
            'changePassword',
            () => c.changePassword(
              newPassword: _newPassword.text,
              currentPassword: _password.text,
            ),
          ),
        ),
        Act(
          'Forgot password',
          () => runAction(
            _console,
            'forgotPassword',
            () => c.forgotPassword(email: _email.text),
          ),
        ),
        Field('reset token', _resetToken),
        Act(
          'Reset password',
          () => runAction(
            _console,
            'resetPassword',
            () => c.resetPassword(
              newPassword: _newPassword.text,
              token: _resetToken.text,
            ),
          ),
        ),
        Act(
          'Send verification email',
          () => runAction(
            _console,
            'sendVerificationEmail',
            () => c.sendVerificationEmail(email: _email.text),
          ),
        ),
        const SectionLabel('Danger'),
        Act(
          'Delete user',
          () => runAction(
            _console,
            'deleteUser',
            () => c.deleteUser(password: _password.text),
          ),
        ),
        Act(
          'Delete anonymous user',
          () => runAction(
            _console,
            'anonymous.deleteAnonymousUser',
            () => c.anonymous.deleteAnonymousUser(),
          ),
        ),
      ],
    );
  }
}

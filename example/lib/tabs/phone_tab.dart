import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_better_auth/plugins/phone/phone_plugin.dart';

import '../harness/widgets.dart';

class PhoneTab extends StatefulWidget {
  const PhoneTab({super.key});
  @override
  State<PhoneTab> createState() => _PhoneTabState();
}

class _PhoneTabState extends State<PhoneTab> {
  final _console = ConsoleController();
  final _phone = TextEditingController(text: '+15555550123');
  final _password = TextEditingController(text: '12345678');
  final _code = TextEditingController();
  final _otp = TextEditingController();
  final _newPassword = TextEditingController(text: '87654321');

  BetterAuthClient get c => FlutterBetterAuth.client;

  @override
  void dispose() {
    _console.dispose();
    for (final ctl in [_phone, _password, _code, _otp, _newPassword]) {
      ctl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HarnessTab(
      console: _console,
      children: [
        Field('phone number', _phone),
        Field('password', _password, obscure: true),
        Field('code (verify)', _code),
        const SectionLabel('Sign in / verify'),
        Act(
          'Sign in (phone)',
          () => runAction(
            _console,
            'phone.signIn',
            () => c.phone.signIn(
              phoneNumber: _phone.text,
              password: _password.text,
            ),
          ),
        ),
        Act(
          'Send OTP',
          () => runAction(
            _console,
            'phone.sendOtp',
            () => c.phone.sendOtp(phoneNumber: _phone.text),
          ),
        ),
        Act(
          'Verify',
          () => runAction(
            _console,
            'phone.verify',
            () => c.phone.verify(phoneNumber: _phone.text, code: _code.text),
          ),
        ),
        const SectionLabel('Password reset'),
        Field('otp', _otp),
        Field('new password', _newPassword, obscure: true),
        Act(
          'Request password reset OTP',
          () => runAction(
            _console,
            'phone.requestPasswordResetOTP',
            () => c.phone.requestPasswordResetOTP(phoneNumber: _phone.text),
          ),
        ),
        Act(
          'Reset password',
          () => runAction(
            _console,
            'phone.restPassword',
            () => c.phone.restPassword(
              otp: _otp.text,
              phoneNumber: _phone.text,
              newPassword: _newPassword.text,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_better_auth/plugins/email_otp/email_otp_extension.dart';

import '../harness/widgets.dart';

class EmailOtpTab extends StatefulWidget {
  const EmailOtpTab({super.key});
  @override
  State<EmailOtpTab> createState() => _EmailOtpTabState();
}

class _EmailOtpTabState extends State<EmailOtpTab> {
  final _console = ConsoleController();
  final _email = TextEditingController(text: 'test@mail.com');
  final _otp = TextEditingController();
  final _password = TextEditingController(text: '87654321');

  BetterAuthClient get c => FlutterBetterAuth.client;

  @override
  void dispose() {
    _console.dispose();
    _email.dispose();
    _otp.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HarnessTab(
      console: _console,
      children: [
        Field('email', _email),
        Field('otp', _otp),
        Field('new password', _password, obscure: true),
        const SectionLabel('Send'),
        Act(
          'Send verification OTP (sign-in)',
          () => runAction(
            _console,
            'emailOtp.sendVerification',
            () => c.emailOtp.sendVerification(
              email: _email.text,
              type: 'sign-in',
            ),
          ),
        ),
        const SectionLabel('Verify / sign in'),
        Act(
          'Sign in (email OTP)',
          () => runAction(
            _console,
            'emailOtp.signIn',
            () => c.emailOtp.signIn(email: _email.text, otp: _otp.text),
          ),
        ),
        Act(
          'Verify email',
          () => runAction(
            _console,
            'emailOtp.verifyEmail',
            () => c.emailOtp.verifyEmail(email: _email.text, otp: _otp.text),
          ),
        ),
        const SectionLabel('Password reset'),
        Act(
          'Forgot password (OTP)',
          () => runAction(
            _console,
            'emailOtp.forgotPassword',
            () => c.emailOtp.forgotPassword(email: _email.text),
          ),
        ),
        Act(
          'Reset password (OTP)',
          () => runAction(
            _console,
            'emailOtp.resetPassword',
            () => c.emailOtp.resetPassword(
              email: _email.text,
              otp: _otp.text,
              password: _password.text,
            ),
          ),
        ),
      ],
    );
  }
}

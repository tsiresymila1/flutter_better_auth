import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

import '../harness/widgets.dart';

class TwoFactorTab extends StatefulWidget {
  const TwoFactorTab({super.key});
  @override
  State<TwoFactorTab> createState() => _TwoFactorTabState();
}

class _TwoFactorTabState extends State<TwoFactorTab> {
  final _console = ConsoleController();
  final _password = TextEditingController(text: '12345678');
  final _code = TextEditingController();
  final _userId = TextEditingController();

  BetterAuthClient get c => FlutterBetterAuth.client;

  @override
  void dispose() {
    _console.dispose();
    _password.dispose();
    _code.dispose();
    _userId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HarnessTab(
      console: _console,
      children: [
        Field('password', _password, obscure: true),
        Field('code (totp/otp/backup)', _code),
        Field('userId (view backup codes)', _userId),
        const SectionLabel('Enrollment'),
        Act(
          'Enable 2FA',
          () => runAction(
            _console,
            'twoFactor.enable',
            () => c.twoFactor.enable(password: _password.text),
          ),
        ),
        Act(
          'Disable 2FA',
          () => runAction(
            _console,
            'twoFactor.disable',
            () => c.twoFactor.disable(password: _password.text),
          ),
        ),
        Act(
          'Get TOTP URI',
          () => runAction(
            _console,
            'twoFactor.getTotpUri',
            () => c.twoFactor.getTotpUri(password: _password.text),
          ),
        ),
        const SectionLabel('Verify'),
        Act(
          'Verify TOTP',
          () => runAction(
            _console,
            'twoFactor.verifyTotp',
            () => c.twoFactor.verifyTotp(code: _code.text),
          ),
        ),
        Act(
          'Send OTP',
          () => runAction(
            _console,
            'twoFactor.sendOtp',
            () => c.twoFactor.sendOtp(),
          ),
        ),
        Act(
          'Verify OTP',
          () => runAction(
            _console,
            'twoFactor.verifyOtp',
            () => c.twoFactor.verifyOtp(code: _code.text),
          ),
        ),
        Act(
          'Verify backup code',
          () => runAction(
            _console,
            'twoFactor.verifyBackupCode',
            () => c.twoFactor.verifyBackupCode(code: _code.text),
          ),
        ),
        const SectionLabel('Backup codes'),
        Act(
          'Generate backup codes',
          () => runAction(
            _console,
            'twoFactor.generateBackupCodes',
            () => c.twoFactor.generateBackupCodes(password: _password.text),
          ),
        ),
        Act(
          'View backup codes',
          () => runAction(
            _console,
            'twoFactor.viewBackupCodes',
            () => c.twoFactor.viewBackupCodes(userId: _userId.text),
          ),
        ),
      ],
    );
  }
}

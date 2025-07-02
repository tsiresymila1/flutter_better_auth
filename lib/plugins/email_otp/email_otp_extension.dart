
import '../../core/api/better_auth_client.dart';
import '../../core/flutter_better_auth.dart';
import 'email_otp_better_auth.dart';

extension EmailAuthBetterAuthExtension on BetterAuthClient {
  EmailOtpBetterAuth get emailOtp => EmailOtpBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );
}

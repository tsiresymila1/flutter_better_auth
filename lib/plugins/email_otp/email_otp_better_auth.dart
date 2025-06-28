import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/api/adapter.dart';
import '../../core/api/default/sign_up/models/sign_up_response/sign_up_response.dart';
import '../../core/api/models/result/result.dart';
import '../../core/api/models/result/success_response.dart';
import 'models/reset_password/password_otp.dart';
import 'models/verification_otp/otp_body.dart';
import 'models/verify_otp/verify_otp_body.dart';
import 'models/verification_otp/email_otp_body.dart';

part 'email_otp_better_auth.g.dart';

@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class EmailOtpBetterAuth {
  factory EmailOtpBetterAuth(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _EmailOtpBetterAuth;

  @POST('/email-otp/send-verification-otp')
  Future<Result<SuccessResponse>> sendVerification({
    @Body() required EmailOtpBody body,
  });

  @POST('/email-otp/verify-email')
  Future<Result<SignUpResponse>> verifyEmail({
    @Body() required VerifyOtpBody body,
  });

  @POST('/sign-in/email-otp')
  Future<Result<SignUpResponse>> signIn({@Body() required VerifyOtpBody body});

  @POST('/forget-password/email-otp')
  Future<Result<SuccessResponse>> forgotPassword({
    @Body() required OtpBody body,
  });

  @POST('/email-otp/reset-password')
  Future<Result<SuccessResponse>> resetPassword({
    @Body() required PasswordOtpBody body,
  });
}

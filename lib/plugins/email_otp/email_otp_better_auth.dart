import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/api/adapter.dart';
import '../../core/api/default/sign_up/models/sign_up_response/sign_up_response.dart';
import '../../core/api/models/result/result.dart';
import '../../core/api/models/result/success_response.dart';

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
    @BodyExtra('email') required String email,
    @BodyExtra('type') required String type,
  });

  @POST('/email-otp/verify-email')
  Future<Result<SignUpResponse>> verifyEmail({
    @BodyExtra('email') required String email,
    @BodyExtra('otp') required String otp,
  });

  @POST('/sign-in/email-otp')
  Future<Result<SignUpResponse>> signIn({
    @BodyExtra('email') required String email,
    @BodyExtra('otp') required String otp,
  });

  @POST('/forget-password/email-otp')
  Future<Result<SuccessResponse>> forgotPassword({
    @BodyExtra('email') required String email,
  });

  /// Requests a password reset OTP sent to the specified [email].
  @POST('/email-otp/request-password-reset')
  Future<Result<SuccessResponse>> requestPasswordReset({
    @BodyExtra('email') required String email,
  });

  @POST('/email-otp/reset-password')
  Future<Result<SuccessResponse>> resetPassword({
    @BodyExtra('email') required String email,
    @BodyExtra('otp') required String otp,
    @BodyExtra('password') required String password,
  });

  /// Verifies an OTP without consuming it.
  @POST('/email-otp/check-verification-otp')
  Future<Result<SuccessResponse>> checkVerificationOtp({
    @BodyExtra('email') required String email,
    @BodyExtra('type') required String type,
    @BodyExtra('otp') required String otp,
  });

  /// Requests an email-change OTP for the authenticated user.
  @POST('/email-otp/request-email-change')
  Future<Result<SuccessResponse>> requestEmailChange({
    @BodyExtra('newEmail') required String newEmail,
    @BodyExtra('otp') String? otp,
  });

  /// Confirms an email change with the OTP.
  @POST('/email-otp/change-email')
  Future<Result<SuccessResponse>> changeEmail({
    @BodyExtra('newEmail') required String newEmail,
    @BodyExtra('otp') required String otp,
  });
}

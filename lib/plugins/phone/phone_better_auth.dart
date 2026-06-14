import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/api/adapter.dart';
import '../../core/api/default/sign_up/models/sign_up_response/sign_up_response.dart';
import '../../core/api/models/result/result.dart';
import '../../core/api/models/result/status_response.dart';
import 'models/send_otp/send_otp_response.dart';

part 'phone_better_auth.g.dart';

@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class PhoneBetterAuth {
  factory PhoneBetterAuth(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _PhoneBetterAuth;

  @POST('/sign-in/phone-number')
  Future<Result<SignUpResponse>> signIn({
    @BodyExtra('phoneNumber') required String phoneNumber,
    @BodyExtra('password') required String password,
    @BodyExtra('rememberMe') bool? rememberMe,
  });

  @POST('/phone-number/send-otp')
  Future<Result<SendOTPResponse>> sendOtp({
    @BodyExtra('phoneNumber') required String phoneNumber,
  });

  @POST('/phone-number/verify')
  Future<Result<SignUpResponse>> verify({
    @BodyExtra('phoneNumber') required String phoneNumber,
    @BodyExtra('code') required String code,
    @BodyExtra('disableSession') bool? disableSession,
    @BodyExtra('updatePhoneNumber') String? updatePhoneNumber,
  });

  @POST('/phone-number/request-password-reset')
  Future<Result<StatusResponse>> requestPasswordResetOTP({
    @BodyExtra('phoneNumber') required String phoneNumber,
  });

  @POST('/phone-number/reset-password')
  Future<Result<StatusResponse>> restPassword({
    @BodyExtra('otp') required String otp,
    @BodyExtra('phoneNumber') required String phoneNumber,
    @BodyExtra('newPassword') required String newPassword,
  });
}

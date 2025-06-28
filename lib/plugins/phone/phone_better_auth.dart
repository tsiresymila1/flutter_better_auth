import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/api/adapter.dart';
import '../../core/api/default/sign_up/models/sign_up_response/sign_up_response.dart';
import '../../core/api/models/result/result.dart';
import '../../core/api/models/result/status_response.dart';
import 'models/phone_body.dart';
import 'models/reset/reset_phone_password_body.dart';
import 'models/sign_in_phone_body.dart';
import 'models/verify/verify_phone_body.dart';
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
    @Body(nullToAbsent: true) required SignInPhoneBody body,
  });

  @POST('/phone-number/send-otp')
  Future<Result<SendOTPResponse>> sendOtp({
    @Body(nullToAbsent: true) required PhoneBody body,
  });

  @POST('/phone-number/verify')
  Future<Result<SignUpResponse>> verify({
    @Body(nullToAbsent: true) required VerifyPhoneBody body,
  });

  @POST('/phone-number/request-password-reset')
  Future<Result<StatusResponse>> requestPasswordResetOTP({
    @Body(nullToAbsent: true) required PhoneBody body,
  });

  @POST('/phone-number/reset-password')
  Future<Result<StatusResponse>> restPassword({
    @Body(nullToAbsent: true) required ResetPhonePasswordBody body,
  });
}

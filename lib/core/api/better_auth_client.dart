import 'package:dio/dio.dart';
import 'package:flutter_better_auth/core/models/session/session.dart';
import 'package:retrofit/retrofit.dart';

import 'adapter.dart';
import 'default/sign_up/models/sign_up_response/sign_up_response.dart';
import 'models/common/change_email/change_email_body.dart';
import 'models/common/change_password/change_password_body.dart';
import 'models/common/forgot_password/forgot_password_body.dart';
import 'models/common/reset_password/reset_password_body.dart';
import 'models/common/send_verification_email/verification_email_body.dart';
import 'models/common/sign_out/sign_out_response.dart';
import 'models/common/verify_email/verify_email_response.dart';
import 'models/result/result.dart';
import 'models/result/status_response.dart';
import 'models/session/session_response.dart';
import 'models/user/delete_user/delete_user_body.dart';
import 'models/user/update_user/update_user_body.dart';
import 'models/result/success_response.dart';

part 'better_auth_client.g.dart';

@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class BetterAuthClient {
  factory BetterAuthClient(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _BetterAuthClient;

  // @POST('/sign-in/social')
  // Future<Result<SignInSocialResponse>> signInWithSocial({
  //   @Body(nullToAbsent: true) required SignInSocialBody body,
  // });

  @GET('/get-session')
  Future<Result<SessionResponse>> getSession();

  @POST('/sign-out')
  Future<Result<SignOutResponse>> signOut({
    @Body(nullToAbsent: true) Map<String, dynamic> body = const {},
  });

  // @POST('/sign-up/email')
  // Future<Result<SignUpResponse>> signUpEmail({
  //   @Body(nullToAbsent: true) required SignUpBody body,
  // });

  // @POST('/sign-in/email')
  // Future<Result<SignInEmailResponse>> signInWithEmail({
  //   @Body(nullToAbsent: true) required SignInEmailBody body,
  // });

  @POST('/forget-password')
  Future<Result<StatusResponse>> forgotPassword({
    @Body(nullToAbsent: true) required ForgotPasswordBody body,
  });

  @POST('/reset-password')
  Future<Result<StatusResponse>> resetPassword({
    @Body(nullToAbsent: true) required ResetPasswordBody body,
  });

  @GET('/verify-email')
  Future<Result<VerifyEmailResponse>> verifyEmail({
    @Query("token") required String token,
    @Query("callbackURL") String? callbackURL,
  });

  @POST('/send-verification-email')
  Future<Result<StatusResponse>> sendVerificationEmail({
    @Body(nullToAbsent: true) required VerificationEmailBody body,
  });

  @POST('/change-email')
  Future<Result<StatusResponse>> changeEmail({
    @Body(nullToAbsent: true) required ChangeEmailBody body,
  });

  @POST('/change-password')
  Future<Result<SignUpResponse>> changePassword({
    @Body(nullToAbsent: true) required ChangePasswordBody body,
  });

  @POST('/update-user')
  Future<Result<StatusResponse>> updateUser({
    @Body(nullToAbsent: true) UpdateUserBody body = const UpdateUserBody(),
  });

  @POST('/delete-user')
  Future<Result<SuccessResponse>> deleteUser({
    @Body(nullToAbsent: true) DeleteUserBody body = const DeleteUserBody(),
  });

  @GET('/list-sessions')
  Future<Result<List<Session>>> listSessions();

  @POST('/revoke-session')
  Future<Result<StatusResponse>> revokeSession({
    @Body(nullToAbsent: true) Map<String, dynamic> body = const {},
  });

  @POST('/revoke-sessions')
  Future<Result<StatusResponse>> revokeSessions({
    @Body(nullToAbsent: true) Map<String, dynamic> body = const {},
  });

  @POST('/revoke-other-sessions')
  Future<Result<StatusResponse>> revokeOtherSessions({
    @Body(nullToAbsent: true) Map<String, dynamic> body = const {},
  });
}

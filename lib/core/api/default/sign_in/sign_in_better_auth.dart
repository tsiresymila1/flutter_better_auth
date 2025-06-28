import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../adapter.dart';
import '../../models/result/result.dart';
import 'models/email/sign_in_email_body.dart';
import 'models/email/sign_in_email_response.dart';
import 'models/social/sign_in_social_body.dart';
import 'models/social/sign_in_social_response.dart';
import 'models/username/sign_in_username_body.dart';
import '../sign_up/models/sign_up_response/sign_up_response.dart';

part 'sign_in_better_auth.g.dart';

@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class SignInBetterAuth {
  factory SignInBetterAuth(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _SignInBetterAuth;

  @POST('/sign-in/social')
  Future<Result<SignInSocialResponse>> social({
    @Body(nullToAbsent: true) required SignInSocialBody body,
  });

  @POST('/sign-in/email')
  Future<Result<SignInEmailResponse>> email({
    @Body(nullToAbsent: true) required SignInEmailBody body,
  });

  @POST('/sign-in/username')
  Future<Result<SignInEmailResponse>> username({
    @Body(nullToAbsent: true) required SignInUsernameBody body,
  });

  @POST('/sign-in/anonymous')
  Future<Result<SignUpResponse>> anonymous();
}

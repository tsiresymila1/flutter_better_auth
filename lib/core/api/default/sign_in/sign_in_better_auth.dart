import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../adapter.dart';
import '../../models/result/result.dart';
import '../sign_up/models/sign_up_response/sign_up_response.dart';
import 'models/email/sign_in_email_response.dart';
import 'models/social/sign_in_social_response.dart';
import 'models/social/social_id_token_body.dart';

part 'sign_in_better_auth.g.dart';

@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class SignInBetterAuth {
  factory SignInBetterAuth(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _SignInBetterAuth;

  @POST('/sign-in/social')
  Future<Result<SignInSocialResponse>> socialAuth({
    @BodyExtra('provider') required String provider,
    @BodyExtra('callbackURL') String? callbackURL,
    @BodyExtra('newUserCallbackURL') String? newUserCallbackURL,
    @BodyExtra('errorCallbackURL') String? errorCallbackURL,
    @BodyExtra('disableRedirect') bool? disableRedirect,
    @BodyExtra('scopes') String? scopes,
    @BodyExtra('idToken') SocialIdTokenBody? idToken,
    @BodyExtra('requestSignUp') String? requestSignUp,
    @BodyExtra('loginHint') String? loginHint,
  });

  @POST('/sign-in/email')
  Future<Result<SignInEmailResponse>> email({
    @BodyExtra('email') required String email,
    @BodyExtra('password') required String password,
    @BodyExtra('callbackURL') String? callbackURL,
    @BodyExtra('rememberMe') String? rememberMe,
  });

  @POST('/sign-in/username')
  Future<Result<SignInEmailResponse>> username({
    @BodyExtra('username') required String username,
    @BodyExtra('password') required String password,
    @BodyExtra('rememberMe') String? rememberMe,
  });

  @POST('/sign-in/anonymous')
  Future<Result<SignUpResponse>> anonymous();
}

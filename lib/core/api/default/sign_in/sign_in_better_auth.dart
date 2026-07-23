import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../adapter.dart';
import '../../models/result/result.dart';
import '../sign_up/models/sign_up_response/sign_up_response.dart';
import 'models/email/sign_in_email_response.dart';
import 'models/social/sign_in_social_response.dart';
import 'models/social/social_id_token_body.dart';
import 'models/username/username_available_response.dart';

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
    @BodyExtra('scopes') List<String>? scopes,
    @BodyExtra('idToken') SocialIdTokenBody? idToken,
    @BodyExtra('requestSignUp') bool? requestSignUp,
    @BodyExtra('loginHint') String? loginHint,
  });

  /// Raw `POST /sign-in/email` body. Prefer the typed `email` extension.
  @POST('/sign-in/email')
  Future<Result<SignInEmailResponse>> emailRaw({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  /// Raw `POST /sign-in/username` body. Prefer the typed `username` extension.
  @POST('/sign-in/username')
  Future<Result<SignInEmailResponse>> usernameRaw({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  /// Better Auth [`anonymous`](https://www.better-auth.com/docs/plugins/anonymous) plugin.
  @POST('/sign-in/anonymous')
  Future<Result<SignUpResponse>> anonymous();

  /// Better Auth [`username`](https://www.better-auth.com/docs/plugins/username)
  /// plugin: checks whether [username] is free.
  @POST('/is-username-available')
  Future<Result<UsernameAvailableResponse>> isUsernameAvailable({
    @BodyExtra('username') required String username,
  });
}

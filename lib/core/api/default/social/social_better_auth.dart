import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../adapter.dart';
import '../../models/result/result.dart';
import '../../models/result/status_response.dart';
import '../../models/session/session_response.dart';
import 'models/link/social_link_response.dart';
import 'models/list_account/social_account_response.dart';
import 'models/token/token_response.dart';

part 'social_better_auth.g.dart';

@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class SocialBetterAuth {
  factory SocialBetterAuth(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _SocialBetterAuth;

  @POST('/callback/{id}')
  Future<Result<SessionResponse>> callback({
    @Path('id') required String provider,
    @BodyExtra('code') String? code,
    @BodyExtra('state') String? state,
  });

  @POST('/link-social')
  Future<Result<SocialLinkResponse>> link({
    @BodyExtra('callbackURL') String? callbackURL,
    @BodyExtra('scopes') String? scopes,
    @BodyExtra('provider') required String provider,
  });

  @GET('/list-accounts')
  Future<Result<List<SocialAccountResponse>>> listAccounts();

  @POST('/unlink-account')
  Future<Result<StatusResponse>> unlink({
    @BodyExtra('providerId') required String providerId,
    @BodyExtra('accountId') String? accountId,
  });

  @POST('/refresh-token')
  Future<Result<TokenResponse>> refreshToken({
    @BodyExtra('providerId') required String providerId,
    @BodyExtra('accountId') String? accountId,
    @BodyExtra('userId') String? userId,
  });

  @POST('/get-access-token')
  Future<Result<TokenResponse>> getAccessToken({
    @BodyExtra('providerId') required String providerId,
    @BodyExtra('accountId') String? accountId,
    @BodyExtra('userId') String? userId,
  });
}

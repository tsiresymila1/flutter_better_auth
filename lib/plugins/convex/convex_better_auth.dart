import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/api/adapter.dart';
import '../../core/api/models/result/result.dart';
import '../jwt/models/token_response/token_response.dart';

part 'convex_better_auth.g.dart';

/// Mirrors `convexClient()` from `@convex-dev/better-auth/client/plugins`.
@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class ConvexBetterAuth {
  factory ConvexBetterAuth(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _ConvexBetterAuth;

  /// Raw `GET /convex/token`.
  @GET('/convex/token')
  Future<Result<JwtTokenResponse>> token();
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../adapter.dart';
import '../../models/result/result.dart';
import 'models/sign_up_response/sign_up_response.dart';

part 'sign_up_better_auth.g.dart';

@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class SignUpBetterAuth {
  factory SignUpBetterAuth(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _SignUpBetterAuth;

  /// Raw `POST /sign-up/email` body. Prefer the typed `email` extension on
  /// [SignUpBetterAuth], which builds this map and flat-merges `additionalFields`.
  @POST('/sign-up/email')
  Future<Result<SignUpResponse>> emailRaw({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });
}

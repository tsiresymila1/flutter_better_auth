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

  @POST('/sign-up/email')
  Future<Result<SignUpResponse>> email({
    @BodyExtra('name') required String name,
    @BodyExtra('email') required String email,
    @BodyExtra('password') required String password,
    @BodyExtra('callbackURL') String? callbackURL,
  });
}

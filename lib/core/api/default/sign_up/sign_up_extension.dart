import '../../../flutter_better_auth.dart';
import '../../better_auth_client.dart';
import '../../models/result/result.dart';
import 'models/sign_up_response/sign_up_response.dart';
import 'sign_up_better_auth.dart';

extension SignUpBetterAuthExtension on BetterAuthClient {
  SignUpBetterAuth get signUp => SignUpBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );
}

/// Typed `POST /sign-up/email`. [additionalFields] are flat-merged into the
/// body — Better Auth accepts custom user fields
/// ([`additionalFields`](https://www.better-auth.com/docs/concepts/database#extending-core-schema))
/// as top-level keys alongside `name`/`email`/`password`.
extension SignUpEmailBetterAuth on SignUpBetterAuth {
  Future<Result<SignUpResponse>> email({
    required String name,
    required String email,
    required String password,
    String? callbackURL,
    Map<String, dynamic>? additionalFields,
  }) =>
      emailRaw(
        // Spread first so the typed fields below win on key collision.
        body: {
          ...?additionalFields,
          'name': name,
          'email': email,
          'password': password,
          'callbackURL': ?callbackURL,
        },
      );
}

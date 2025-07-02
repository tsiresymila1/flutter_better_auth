
import '../../../flutter_better_auth.dart';
import '../../better_auth_client.dart';
import 'sign_in_better_auth.dart';

extension SignInBetterAuthExtension on BetterAuthClient {
  SignInBetterAuth get signIn => SignInBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );
}

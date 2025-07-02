import '../../../flutter_better_auth.dart';
import '../../better_auth_client.dart';
import 'social_better_auth.dart';

extension SocialBetterAuthExtension on BetterAuthClient {
  SocialBetterAuth get social => SocialBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );
}

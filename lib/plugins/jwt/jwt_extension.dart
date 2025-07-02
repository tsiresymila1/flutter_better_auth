import '../../core/api/better_auth_client.dart';
import '../../core/flutter_better_auth.dart';
import 'jwt_better_auth.dart';

extension JwtBetterAuthExtension on BetterAuthClient {
  JwtBetterAuth get jwt => JwtBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );
}

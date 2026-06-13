import '../../../../flutter_better_auth.dart';
import 'phone_better_auth.dart';

extension PhoneBetterAuthExtension on BetterAuthClient {
  PhoneBetterAuth get phone => PhoneBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );
}

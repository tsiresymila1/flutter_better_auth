import 'better_auth_client.dart';
import 'models/common/user_wrapper/user_wrapper_response.dart';
import 'models/result/result.dart';

/// Typed `POST /update-user`. [additionalFields] are flat-merged into the body
/// — Better Auth accepts custom user fields
/// ([`additionalFields`](https://www.better-auth.com/docs/concepts/database#extending-core-schema))
/// as top-level keys alongside `name`/`image`.
extension UpdateUserBetterAuth on BetterAuthClient {
  Future<Result<UserWrapperResponse>> updateUser({
    String? name,
    String? image,
    Map<String, dynamic>? additionalFields,
  }) =>
      updateUserRaw(
        body: {
          'name': ?name,
          'image': ?image,
          ...?additionalFields,
        },
      );
}

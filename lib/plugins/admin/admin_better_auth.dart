import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/api/adapter.dart';
import '../../core/api/models/result/result.dart';
import '../../core/api/models/result/status_response.dart';
import '../../core/api/models/session/session_response.dart';
import '../../core/api/models/result/success_response.dart';
import 'models/ban/ban_body.dart';
import 'models/create_user/create_user_body.dart';
import 'models/create_user/user_response.dart';
import 'models/password/set_user_password_body.dart';
import 'models/permission/check_permission_body.dart';
import 'models/permission/check_permission_response.dart';
import 'models/role/set_role_body.dart';

part 'admin_better_auth.g.dart';

@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class AdminBetterAuth {
  factory AdminBetterAuth(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AdminBetterAuth;

  @POST('/admin/set-role')
  Future<Result<UserResponse>> setRole({
    @Body(nullToAbsent: true) required SetRoleBody body,
  });

  @POST('/admin/create-user')
  Future<Result<UserResponse>> createUser({
    @Body(nullToAbsent: true) required CreateUserBody body,
  });

  @POST('/admin/unban-user')
  Future<Result<UserResponse>> unBanUser({
    @Body(nullToAbsent: true) required BanBody body,
  });

  @POST('/admin/ban-user')
  Future<Result<UserResponse>> banUser({
    @Body(nullToAbsent: true) required BanBody body,
  });

  @POST('/admin/impersonate-user')
  Future<Result<SessionResponse>> impersonateUser({
    @Body(nullToAbsent: true) required BanBody body,
  });

  @POST('/admin/revoke-user-sessions')
  Future<Result<SuccessResponse>> removeUserSessions({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @POST('/admin/remove-user')
  Future<Result<SuccessResponse>> removeUser({
    @Body(nullToAbsent: true) required BanBody body,
  });

  @POST('/admin/set-user-password')
  Future<Result<StatusResponse>> setUserPassword({
    @Body(nullToAbsent: true) required SetUserPasswordBody body,
  });

  @POST('/admin/has-permission')
  Future<Result<CheckPermissionResponse>> hasPermission({
    @Body(nullToAbsent: true) required CheckPermissionBody body,
  });
}

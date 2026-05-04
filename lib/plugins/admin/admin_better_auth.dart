import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../core/api/adapter.dart';
import '../../core/api/models/result/result.dart';
import '../../core/api/models/result/status_response.dart';
import '../../core/api/models/session/session_response.dart';
import 'models/admin_models.dart';

part 'admin_better_auth.g.dart';

@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class AdminBetterAuth {
  factory AdminBetterAuth(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _AdminBetterAuth;

  @POST('/admin/set-role')
  Future<Result<AdminUserResponse>> setRole({
    @BodyExtra('userId') required String userId,
    @BodyExtra('role') required String role,
  });

  @GET('/admin/get-user')
  Future<Result<AdminUserResponse>> getUser({
    @Query('id') required String id,
  });

  @POST('/admin/create-user')
  Future<Result<AdminUserResponse>> createUser({
    @BodyExtra('email') required String email,
    @BodyExtra('password') required String password,
    @BodyExtra('name') required String name,
    @BodyExtra('role') String? role,
    @BodyExtra('data') Map<String, dynamic>? data,
  });

  @POST('/admin/update-user')
  Future<Result<AdminUserResponse>> updateUser({
    @BodyExtra('userId') required String userId,
    @BodyExtra('data') required Map<String, dynamic> data,
  });

  @GET('/admin/list-users')
  Future<Result<AdminUserListResponse>> listUsers({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @Query('searchValue') String? searchValue,
    @Query('sortBy') String? sortBy,
    @Query('sortDirection') String? sortDirection,
  });

  @POST('/admin/list-user-sessions')
  Future<Result<AdminSessionListResponse>> listUserSessions({
    @BodyExtra('userId') required String userId,
  });

  @POST('/admin/ban-user')
  Future<Result<AdminUserResponse>> banUser({
    @BodyExtra('userId') required String userId,
    @BodyExtra('banReason') String? banReason,
    @BodyExtra('banExpiresIn') int? banExpiresIn,
  });

  @POST('/admin/unban-user')
  Future<Result<AdminUserResponse>> unbanUser({
    @BodyExtra('userId') required String userId,
  });

  @POST('/admin/impersonate-user')
  Future<Result<SessionResponse>> impersonateUser({
    @BodyExtra('userId') required String userId,
  });
  
  @POST('/admin/stop-impersonating')
  Future<Result<StatusResponse>> stopImpersonating();

  @POST('/admin/revoke-user-session')
  Future<Result<StatusResponse>> revokeUserSession({
    @BodyExtra('sessionId') required String sessionId,
    @BodyExtra('userId') required String userId,
  });

   @POST('/admin/revoke-user-sessions')
  Future<Result<StatusResponse>> revokeUserSessions({
    @BodyExtra('userId') required String userId,
  });
  
  @POST('/admin/remove-user')
  Future<Result<StatusResponse>> removeUser({
     @BodyExtra('userId') required String userId,
  });
}

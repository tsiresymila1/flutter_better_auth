import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/models/user/user.dart';
import '../../../core/models/session/session.dart';

part 'admin_models.freezed.dart';
part 'admin_models.g.dart';

@freezed
abstract class AdminUserResponse with _$AdminUserResponse {
  const factory AdminUserResponse({
    required User user,
  }) = _AdminUserResponse;

  factory AdminUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminUserResponseFromJson(json);
}

@freezed
abstract class AdminUserListResponse with _$AdminUserListResponse {
  const factory AdminUserListResponse({
    required List<User> users,
    required double total,
  }) = _AdminUserListResponse;

  factory AdminUserListResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminUserListResponseFromJson(json);
}

@freezed
abstract class AdminSessionListResponse with _$AdminSessionListResponse {
    const factory AdminSessionListResponse({
        required List<Session> sessions,
    }) = _AdminSessionListResponse;

    factory AdminSessionListResponse.fromJson(Map<String, dynamic> json) =>
        _$AdminSessionListResponseFromJson(json);
}

@freezed
abstract class CheckPermissionResponse with _$CheckPermissionResponse {
  const factory CheckPermissionResponse({
    required bool success,
    String? error,
  }) = _CheckPermissionResponse;

  factory CheckPermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckPermissionResponseFromJson(json);
}

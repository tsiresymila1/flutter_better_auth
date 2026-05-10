// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminUserResponse _$AdminUserResponseFromJson(Map<String, dynamic> json) =>
    _AdminUserResponse(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdminUserResponseToJson(_AdminUserResponse instance) =>
    <String, dynamic>{'user': instance.user.toJson()};

_AdminUserListResponse _$AdminUserListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminUserListResponse(
  users: (json['users'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toDouble(),
);

Map<String, dynamic> _$AdminUserListResponseToJson(
  _AdminUserListResponse instance,
) => <String, dynamic>{
  'users': instance.users.map((e) => e.toJson()).toList(),
  'total': instance.total,
};

_AdminSessionListResponse _$AdminSessionListResponseFromJson(
  Map<String, dynamic> json,
) => _AdminSessionListResponse(
  sessions: (json['sessions'] as List<dynamic>)
      .map((e) => Session.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AdminSessionListResponseToJson(
  _AdminSessionListResponse instance,
) => <String, dynamic>{
  'sessions': instance.sessions.map((e) => e.toJson()).toList(),
};

_CheckPermissionResponse _$CheckPermissionResponseFromJson(
  Map<String, dynamic> json,
) => _CheckPermissionResponse(
  success: json['success'] as bool,
  error: json['error'] as String?,
);

Map<String, dynamic> _$CheckPermissionResponseToJson(
  _CheckPermissionResponse instance,
) => <String, dynamic>{'success': instance.success, 'error': instance.error};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChangeEmailResponse _$ChangeEmailResponseFromJson(Map<String, dynamic> json) =>
    _ChangeEmailResponse(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ChangeEmailResponseToJson(
  _ChangeEmailResponse instance,
) => <String, dynamic>{
  'user': instance.user?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

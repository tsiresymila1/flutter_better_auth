// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) =>
    _SessionResponse(
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      error: json['error'] as String?,
      isRegister: json['isRegister'] as bool?,
    );

Map<String, dynamic> _$SessionResponseToJson(_SessionResponse instance) =>
    <String, dynamic>{
      'session': instance.session.toJson(),
      'user': instance.user.toJson(),
      'error': instance.error,
      'isRegister': instance.isRegister,
    };

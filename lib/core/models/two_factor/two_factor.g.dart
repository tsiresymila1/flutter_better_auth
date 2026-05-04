// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TwoFactor _$TwoFactorFromJson(Map<String, dynamic> json) => _TwoFactor(
  id: json['id'] as String,
  secret: json['secret'] as String,
  backupCodes: json['backupCodes'] as String,
  userId: json['userId'] as String,
);

Map<String, dynamic> _$TwoFactorToJson(_TwoFactor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'secret': instance.secret,
      'backupCodes': instance.backupCodes,
      'userId': instance.userId,
    };

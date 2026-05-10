// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TwoFactorVerifyResponse _$TwoFactorVerifyResponseFromJson(
  Map<String, dynamic> json,
) => _TwoFactorVerifyResponse(
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  message: json['message'] as String?,
);

Map<String, dynamic> _$TwoFactorVerifyResponseToJson(
  _TwoFactorVerifyResponse instance,
) => <String, dynamic>{
  'token': instance.token,
  'user': instance.user?.toJson(),
  'message': instance.message,
};

_BackupCodesResponse _$BackupCodesResponseFromJson(Map<String, dynamic> json) =>
    _BackupCodesResponse(
      backupCodes: (json['backupCodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BackupCodesResponseToJson(
  _BackupCodesResponse instance,
) => <String, dynamic>{'backupCodes': instance.backupCodes};

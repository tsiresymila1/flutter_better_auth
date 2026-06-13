// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SocialAccountResponse _$SocialAccountResponseFromJson(
  Map<String, dynamic> json,
) => _SocialAccountResponse(
  id: json['id'] as String,
  providerId: json['providerId'] as String,
  accountId: json['accountId'] as String?,
  userId: json['userId'] as String?,
  scopes: (json['scopes'] as List<dynamic>?)?.map((e) => e as String).toList(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$SocialAccountResponseToJson(
  _SocialAccountResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'providerId': instance.providerId,
  'accountId': instance.accountId,
  'userId': instance.userId,
  'scopes': instance.scopes,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

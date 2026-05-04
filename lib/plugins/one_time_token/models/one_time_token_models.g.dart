// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_time_token_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OneTimeTokenGenerateResponse _$OneTimeTokenGenerateResponseFromJson(
  Map<String, dynamic> json,
) => _OneTimeTokenGenerateResponse(
  token: json['token'] as String,
  url: json['url'] as String?,
);

Map<String, dynamic> _$OneTimeTokenGenerateResponseToJson(
  _OneTimeTokenGenerateResponse instance,
) => <String, dynamic>{'token': instance.token, 'url': instance.url};

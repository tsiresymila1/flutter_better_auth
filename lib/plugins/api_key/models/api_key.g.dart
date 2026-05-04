// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiKey _$ApiKeyFromJson(Map<String, dynamic> json) => _ApiKey(
  id: json['id'] as String,
  name: json['name'] as String?,
  start: json['start'] as String?,
  prefix: json['prefix'] as String?,
  key: json['key'] as String?,
  userId: json['userId'] as String,
  enabled: json['enabled'] as bool? ?? true,
  expiresAt:
      json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  lastRefillAt:
      json['lastRefillAt'] == null
          ? null
          : DateTime.parse(json['lastRefillAt'] as String),
  lastRequest:
      json['lastRequest'] == null
          ? null
          : DateTime.parse(json['lastRequest'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
  rateLimitMax: (json['rateLimitMax'] as num?)?.toDouble(),
  rateLimitTimeWindow: (json['rateLimitTimeWindow'] as num?)?.toDouble(),
  remaining: (json['remaining'] as num?)?.toDouble(),
  refillAmount: (json['refillAmount'] as num?)?.toDouble(),
  refillInterval: (json['refillInterval'] as num?)?.toDouble(),
  rateLimitEnabled: json['rateLimitEnabled'] as bool?,
  requestCount: (json['requestCount'] as num?)?.toDouble(),
  permissions: json['permissions'] as String?,
);

Map<String, dynamic> _$ApiKeyToJson(_ApiKey instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'start': instance.start,
  'prefix': instance.prefix,
  'key': instance.key,
  'userId': instance.userId,
  'enabled': instance.enabled,
  'expiresAt': instance.expiresAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'lastRefillAt': instance.lastRefillAt?.toIso8601String(),
  'lastRequest': instance.lastRequest?.toIso8601String(),
  'metadata': instance.metadata,
  'rateLimitMax': instance.rateLimitMax,
  'rateLimitTimeWindow': instance.rateLimitTimeWindow,
  'remaining': instance.remaining,
  'refillAmount': instance.refillAmount,
  'refillInterval': instance.refillInterval,
  'rateLimitEnabled': instance.rateLimitEnabled,
  'requestCount': instance.requestCount,
  'permissions': instance.permissions,
};

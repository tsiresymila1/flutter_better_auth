import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_key.freezed.dart';
part 'api_key.g.dart';

@freezed
abstract class ApiKey with _$ApiKey {
  const factory ApiKey({
    required String id,
    String? name,
    String? start,
    String? prefix,
    String? key,
    required String userId,
    @Default(true) bool enabled,
    DateTime? expiresAt,
    required DateTime createdAt,
    DateTime? updatedAt,
    DateTime? lastRefillAt,
    DateTime? lastRequest,
    Map<String, dynamic>? metadata,
    double? rateLimitMax,
    double? rateLimitTimeWindow,
    double? remaining,
    double? refillAmount,
    double? refillInterval,
    bool? rateLimitEnabled,
    double? requestCount,
    String? permissions,
  }) = _ApiKey;

  factory ApiKey.fromJson(Map<String, dynamic> json) => _$ApiKeyFromJson(json);
}

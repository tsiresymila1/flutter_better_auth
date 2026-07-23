import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

part 'session.g.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required String id,
    required String token,
    required DateTime expiresAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? ipAddress,
    String? userAgent,
    required String userId,
    String? impersonatedBy,
    String? activeOrganizationId,
    /// Present when Better Auth [`organization`](https://www.better-auth.com/docs/plugins/organization)
    /// is configured with `teams.enabled`.
    String? activeTeamId,

    /// Server-defined custom fields ([`additionalFields`](https://www.better-auth.com/docs/concepts/database#extending-core-schema))
    /// that aren't part of the static [Session] shape. Populated from unmapped
    /// JSON keys by [Session.fromJson]; never serialized back out. Read via the
    /// `field` extension, e.g. `session.field<String>('theme')`.
    @JsonKey(readValue: _readSessionAdditionalFields, includeToJson: false)
    @Default(<String, dynamic>{})
    Map<String, dynamic> additionalFields,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
}

const _knownSessionKeys = <String>{
  'id',
  'token',
  'expiresAt',
  'createdAt',
  'updatedAt',
  'ipAddress',
  'userAgent',
  'userId',
  'impersonatedBy',
  'activeOrganizationId',
  'activeTeamId',
};

/// [JsonKey.readValue] for [Session.additionalFields]: returns every server key
/// the static model doesn't own — Better Auth merges `additionalFields` into
/// the session object as flat top-level keys, so this collects the remainder.
Map<String, dynamic> _readSessionAdditionalFields(
  Map<dynamic, dynamic> json,
  String _,
) {
  final extra = Map<String, dynamic>.from(json)
    ..removeWhere((key, _) => _knownSessionKeys.contains(key));
  return Map.unmodifiable(extra);
}

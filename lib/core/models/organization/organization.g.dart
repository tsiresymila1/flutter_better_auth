// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Organization _$OrganizationFromJson(Map<String, dynamic> json) =>
    _Organization(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      logo: json['logo'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      metadata: json['metadata'] as String?,
    );

Map<String, dynamic> _$OrganizationToJson(_Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.logo,
      'createdAt': instance.createdAt.toIso8601String(),
      'metadata': instance.metadata,
    };

_Member _$MemberFromJson(Map<String, dynamic> json) => _Member(
  id: json['id'] as String,
  organizationId: json['organizationId'] as String,
  userId: json['userId'] as String,
  role: json['role'] as String? ?? 'member',
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MemberToJson(_Member instance) => <String, dynamic>{
  'id': instance.id,
  'organizationId': instance.organizationId,
  'userId': instance.userId,
  'role': instance.role,
  'createdAt': instance.createdAt.toIso8601String(),
};

_Invitation _$InvitationFromJson(Map<String, dynamic> json) => _Invitation(
  id: json['id'] as String,
  organizationId: json['organizationId'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  status: json['status'] as String? ?? 'pending',
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  inviterId: json['inviterId'] as String,
);

Map<String, dynamic> _$InvitationToJson(_Invitation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organizationId': instance.organizationId,
      'email': instance.email,
      'role': instance.role,
      'status': instance.status,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'inviterId': instance.inviterId,
    };

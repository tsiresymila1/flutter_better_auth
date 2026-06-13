// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_invitation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrganizationInvitation _$OrganizationInvitationFromJson(
  Map<String, dynamic> json,
) => _OrganizationInvitation(
  id: json['id'] as String,
  email: json['email'] as String,
  role: json['role'] as String?,
  organizationId: json['organizationId'] as String,
  inviterId: json['inviterId'] as String,
  status: json['status'] as String,
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  organizationName: json['organizationName'] as String?,
  organizationSlug: json['organizationSlug'] as String?,
  inviterEmail: json['inviterEmail'] as String?,
  teamIds: (json['teamIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$OrganizationInvitationToJson(
  _OrganizationInvitation instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'role': instance.role,
  'organizationId': instance.organizationId,
  'inviterId': instance.inviterId,
  'status': instance.status,
  'expiresAt': instance.expiresAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'organizationName': instance.organizationName,
  'organizationSlug': instance.organizationSlug,
  'inviterEmail': instance.inviterEmail,
  'teamIds': instance.teamIds,
};

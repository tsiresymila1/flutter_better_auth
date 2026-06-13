import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization_invitation.freezed.dart';
part 'organization_invitation.g.dart';

@freezed
abstract class OrganizationInvitation with _$OrganizationInvitation {
  const factory OrganizationInvitation({
    required String id,
    required String email,
    String? role,
    required String organizationId,
    required String inviterId,
    required String status,
    DateTime? expiresAt,
    DateTime? createdAt,
    String? organizationName,
    String? organizationSlug,
    String? inviterEmail,
    List<String>? teamIds,
  }) = _OrganizationInvitation;

  factory OrganizationInvitation.fromJson(Map<String, dynamic> json) =>
      _$OrganizationInvitationFromJson(json);
}

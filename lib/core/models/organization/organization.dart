import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization.freezed.dart';
part 'organization.g.dart';

@freezed
abstract class Organization with _$Organization {
  const factory Organization({
    required String id,
    required String name,
    required String slug,
    String? logo,
    required DateTime createdAt,
    String? metadata,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}

@freezed
abstract class Member with _$Member {
  const factory Member({
    required String id,
    required String organizationId,
    required String userId,
    @Default('member') String role,
    required DateTime createdAt,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

@freezed
abstract class Invitation with _$Invitation {
  const factory Invitation({
    required String id,
    required String organizationId,
    required String email,
    required String role,
    @Default('pending') String status,
    required DateTime expiresAt,
    required DateTime createdAt,
    required String inviterId,
  }) = _Invitation;

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);
}

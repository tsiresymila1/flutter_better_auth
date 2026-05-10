import 'package:dio/dio.dart';
import 'package:flutter_better_auth/core/api/adapter.dart';
import 'package:flutter_better_auth/core/api/models/result/result.dart';
import 'package:flutter_better_auth/plugins/admin/models/admin_models.dart';
import 'package:retrofit/retrofit.dart';

import 'models/invitation_with_member_response.dart';
import 'models/organization_create_role_response.dart';
import 'models/organization_invitation.dart';
import 'models/organization_member.dart';
import 'models/organization_member_role_response.dart';
import 'models/organization_members_page.dart';
import 'models/organization_operation_success.dart';
import 'models/organization_payload.dart';
import 'models/organization_plain_message.dart';
import 'models/organization_role_record.dart';
import 'models/organization_slug_check_response.dart';
import 'models/organization_team.dart';
import 'models/organization_team_member.dart';
import 'models/organization_update_role_response.dart';
import 'models/wrapped_organization_member_response.dart';

part 'organization_retrofit.g.dart';

@RestApi(callAdapter: BetterAuthCallAdapter)
abstract class OrganizationRetrofit {
  factory OrganizationRetrofit(
    Dio dio, {
    String? baseUrl,
    ParseErrorLogger? errorLogger,
  }) = _OrganizationRetrofit;

  @POST('/organization/check-slug')
  Future<Result<OrganizationSlugCheckResponse>> checkSlug({
    @BodyExtra('slug') required String slug,
  });

  @POST('/organization/create')
  Future<Result<OrganizationPayload>> create({
    @BodyExtra('name') required String name,
    @BodyExtra('slug') required String slug,
    @BodyExtra('userId') String? userId,
    @BodyExtra('logo') String? logo,
    @BodyExtra('metadata') Map<String, dynamic>? metadata,
    @BodyExtra('keepCurrentActiveOrganization')
    bool? keepCurrentActiveOrganization,
  });

  /// Full JSON body — use when [`schema.organization.additionalFields`](https://www.better-auth.com/docs/plugins/organization)
  /// is customized on the server.
  @POST('/organization/create')
  Future<Result<OrganizationPayload>> createOrganizationRaw({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @POST('/organization/update')
  Future<Result<OrganizationPayload>> update({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @POST('/organization/delete')
  Future<Result<OrganizationPayload>> delete({
    @BodyExtra('organizationId') required String organizationId,
  });

  @GET('/organization/get-full-organization')
  Future<Result<OrganizationPayload?>> getFullOrganization({
    @Query('organizationId') String? organizationId,
    @Query('organizationSlug') String? organizationSlug,
    @Query('membersLimit') int? membersLimit,
  });

  @GET('/organization/list')
  Future<Result<List<OrganizationPayload>>> listOrganizations();

  @POST('/organization/add-member')
  Future<Result<OrganizationMember>> addMember({
    @BodyExtra('userId') required String userId,
    @BodyExtra('role') required Object role,
    @BodyExtra('organizationId') String? organizationId,
    @BodyExtra('teamId') String? teamId,
  });

  /// Full JSON body — use when [`schema.member.additionalFields`](https://www.better-auth.com/docs/plugins/organization)
  /// is customized on the server.
  @POST('/organization/add-member')
  Future<Result<OrganizationMember>> addMemberRaw({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @POST('/organization/remove-member')
  Future<Result<WrappedOrganizationMemberResponse>> removeMember({
    @BodyExtra('memberIdOrEmail') required String memberIdOrEmail,
    @BodyExtra('organizationId') String? organizationId,
  });

  @POST('/organization/update-member-role')
  Future<Result<OrganizationMember>> updateMemberRole({
    @BodyExtra('role') required Object role,
    @BodyExtra('memberId') required String memberId,
    @BodyExtra('organizationId') String? organizationId,
  });

  @GET('/organization/get-active-member')
  Future<Result<OrganizationMember>> getActiveMember();

  @POST('/organization/leave')
  Future<Result<OrganizationMember>> leave({
    @BodyExtra('organizationId') required String organizationId,
  });

  @GET('/organization/list-members')
  Future<Result<OrganizationMembersPage>> listMembers({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
    @Query('sortBy') String? sortBy,
    @Query('sortDirection') String? sortDirection,
    @Query('filterField') String? filterField,
    @Query('filterOperator') String? filterOperator,

    /// Server accepts string, number, boolean, or arrays; prefer [listMembersRaw]
    /// when [filterValue] is not a string.
    @Query('filterValue') String? filterValue,
    @Query('organizationId') String? organizationId,
    @Query('organizationSlug') String? organizationSlug,
  });

  /// Same as [listMembers] — use for complex `filterValue` (arrays, booleans, numbers).
  @GET('/organization/list-members')
  Future<Result<OrganizationMembersPage>> listMembersRaw({
    @Queries() required Map<String, dynamic> queries,
  });

  @GET('/organization/get-active-member-role')
  Future<Result<OrganizationMemberRoleResponse>> getActiveMemberRole({
    @Query('userId') String? userId,
    @Query('organizationId') String? organizationId,
    @Query('organizationSlug') String? organizationSlug,
  });

  @POST('/organization/invite-member')
  Future<Result<OrganizationInvitation>> inviteMember({
    @BodyExtra('email') required String email,
    @BodyExtra('role') required Object role,
    @BodyExtra('organizationId') String? organizationId,
    @BodyExtra('resend') bool? resend,
    @BodyExtra('teamId') Object? teamId,
  });

  /// Full JSON body — use when [`schema.invitation.additionalFields`](https://www.better-auth.com/docs/plugins/organization)
  /// is customized on the server.
  @POST('/organization/invite-member')
  Future<Result<OrganizationInvitation>> inviteMemberRaw({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @POST('/organization/accept-invitation')
  Future<Result<InvitationWithMemberResponse>> acceptInvitation({
    @BodyExtra('invitationId') required String invitationId,
  });

  @POST('/organization/reject-invitation')
  Future<Result<InvitationWithMemberResponse>> rejectInvitation({
    @BodyExtra('invitationId') required String invitationId,
  });

  @POST('/organization/cancel-invitation')
  Future<Result<OrganizationInvitation>> cancelInvitation({
    @BodyExtra('invitationId') required String invitationId,
  });

  @GET('/organization/get-invitation')
  Future<Result<OrganizationInvitation>> fetchInvitation({
    @Query('id') required String id,
  });

  @GET('/organization/list-invitations')
  Future<Result<List<OrganizationInvitation>>> listInvitations({
    @Query('organizationId') String? organizationId,
  });

  @GET('/organization/list-user-invitations')
  Future<Result<List<OrganizationInvitation>>> listUserInvitations({
    @Query('email') String? email,
  });

  @POST('/organization/create-role')
  Future<Result<OrganizationCreateRoleResponse>> createRole({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @POST('/organization/delete-role')
  Future<Result<OrganizationOperationSuccess>> deleteRole({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @GET('/organization/list-roles')
  Future<Result<List<OrganizationRoleRecord>>> listRoles({
    @Query('organizationId') String? organizationId,
  });

  @GET('/organization/get-role')
  Future<Result<OrganizationRoleRecord>> getRole({
    @Query('organizationId') String? organizationId,
    @Query('roleName') String? roleName,
    @Query('roleId') String? roleId,
  });

  @POST('/organization/update-role')
  Future<Result<OrganizationUpdateRoleResponse>> updateRole({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @POST('/organization/has-permission')
  Future<Result<CheckPermissionResponse>> hasPermission({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @POST('/organization/create-team')
  Future<Result<OrganizationTeam>> createTeam({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @POST('/organization/remove-team')
  Future<Result<OrganizationPlainMessage>> removeTeam({
    @BodyExtra('teamId') required String teamId,
    @BodyExtra('organizationId') String? organizationId,
  });

  @POST('/organization/update-team')
  Future<Result<OrganizationTeam>> updateTeam({
    @Body(nullToAbsent: true) required Map<String, dynamic> body,
  });

  @GET('/organization/list-teams')
  Future<Result<List<OrganizationTeam>>> listTeams({
    @Query('organizationId') String? organizationId,
  });

  @GET('/organization/list-user-teams')
  Future<Result<List<OrganizationTeam>>> listUserTeams();

  @GET('/organization/list-team-members')
  Future<Result<List<OrganizationTeamMember>>> listTeamMembers({
    @Query('teamId') String? teamId,
  });

  @POST('/organization/add-team-member')
  Future<Result<OrganizationTeamMember>> addTeamMember({
    @BodyExtra('teamId') required String teamId,
    @BodyExtra('userId') required String userId,
    @BodyExtra('organizationId') String? organizationId,
  });

  @POST('/organization/remove-team-member')
  Future<Result<OrganizationPlainMessage>> removeTeamMember({
    @BodyExtra('teamId') required String teamId,
    @BodyExtra('userId') required String userId,
    @BodyExtra('organizationId') String? organizationId,
  });
}

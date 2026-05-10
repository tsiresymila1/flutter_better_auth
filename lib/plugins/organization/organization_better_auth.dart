import 'package:dio/dio.dart';
import 'package:flutter_better_auth/core/api/models/result/better_error.dart';
import 'package:flutter_better_auth/core/api/models/result/result.dart';
import 'package:flutter_better_auth/plugins/admin/models/admin_models.dart';

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
import 'organization_retrofit.dart';

String _combineOrgPluginBaseUrls(String dioBaseUrl, String? baseUrl) {
  if (baseUrl == null || baseUrl.trim().isEmpty) {
    return dioBaseUrl;
  }
  final url = Uri.parse(baseUrl);
  if (url.isAbsolute) {
    return url.toString();
  }
  return Uri.parse(dioBaseUrl).resolveUri(url).toString();
}

Result<R> _orgResultFromDio<R>(Object e, StackTrace s, DioException? de) {
  final res = de?.response;
  final raw = res?.data;
  return Result<R>.err(
    BetterError(
      code: raw is Map && raw['code'] is String
          ? raw['code'] as String
          : 'ERROR',
      message: raw is Map && raw['message'] is String
          ? raw['message'] as String
          : (de?.message ?? e.toString()),
      stack: s.toString(),
    ),
  );
}

/// Better Auth [`organization`](https://www.better-auth.com/docs/plugins/organization)
/// plugin endpoints.
///
/// [setActiveOrganization] and [setActiveTeam] use Dio directly so literal JSON
/// `null` values are preserved (Retrofit strips null keys on other calls).
///
/// Prefer [retrofit] for strongly typed codegen when you extend this API locally.
class OrganizationBetterAuth {
  OrganizationBetterAuth(this._dio, {String? baseUrl})
    : _baseUrl = baseUrl,
      _api = OrganizationRetrofit(_dio, baseUrl: baseUrl);

  final Dio _dio;
  final String? _baseUrl;
  final OrganizationRetrofit _api;

  /// Typed Retrofit-backed client (everything except active-org / active-team helpers).
  OrganizationRetrofit get retrofit => _api;

  Future<Result<OrganizationPayload?>> setActiveOrganization({
    String? organizationId,
    String? organizationSlug,
    bool clearOrganization = false,
  }) async {
    final body = <String, dynamic>{};
    if (clearOrganization) {
      body['organizationId'] = null;
    } else if (organizationId != null) {
      body['organizationId'] = organizationId;
    }
    if (organizationSlug != null) {
      body['organizationSlug'] = organizationSlug;
    }
    try {
      final composed = _combineOrgPluginBaseUrls(
        _dio.options.baseUrl,
        _baseUrl,
      );
      final normalized = composed.endsWith('/')
          ? composed.substring(0, composed.length - 1)
          : composed;
      final response = await _dio.post<Map<String, dynamic>?>(
        '$normalized/organization/set-active',
        data: body,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: _dio.options.headers,
          validateStatus: _dio.options.validateStatus,
          responseType: ResponseType.json,
        ),
      );
      final data = response.data;
      if (data == null) {
        return Result.ok(null);
      }
      return Result.ok(OrganizationPayload.fromJson(data));
    } on DioException catch (e, s) {
      return _orgResultFromDio<OrganizationPayload?>(e, s, e);
    } catch (e, s) {
      return Result.err(
        BetterError(message: e.toString(), stack: s.toString()),
      );
    }
  }

  Future<Result<OrganizationTeam?>> setActiveTeam({
    String? teamId,
    bool clearActiveTeam = false,
  }) async {
    final body = <String, dynamic>{};
    if (clearActiveTeam) {
      body['teamId'] = null;
    } else if (teamId != null) {
      body['teamId'] = teamId;
    }
    try {
      final composed = _combineOrgPluginBaseUrls(
        _dio.options.baseUrl,
        _baseUrl,
      );
      final normalized = composed.endsWith('/')
          ? composed.substring(0, composed.length - 1)
          : composed;
      final response = await _dio.post<Map<String, dynamic>?>(
        '$normalized/organization/set-active-team',
        data: body,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: _dio.options.headers,
          validateStatus: _dio.options.validateStatus,
          responseType: ResponseType.json,
        ),
      );
      final data = response.data;
      if (data == null) {
        return Result.ok(null);
      }
      return Result.ok(OrganizationTeam.fromJson(data));
    } on DioException catch (e, s) {
      return _orgResultFromDio<OrganizationTeam?>(e, s, e);
    } catch (e, s) {
      return Result.err(
        BetterError(message: e.toString(), stack: s.toString()),
      );
    }
  }

  Future<Result<OrganizationSlugCheckResponse>> checkSlug({
    required String slug,
  }) => _api.checkSlug(slug: slug);

  Future<Result<OrganizationPayload>> create({
    required String name,
    required String slug,
    String? userId,
    String? logo,
    Map<String, dynamic>? metadata,
    bool? keepCurrentActiveOrganization,
  }) =>
      _api.create(
        name: name,
        slug: slug,
        userId: userId,
        logo: logo,
        metadata: metadata,
        keepCurrentActiveOrganization: keepCurrentActiveOrganization,
      );

  Future<Result<OrganizationPayload>> createRaw(Map<String, dynamic> body) =>
      _api.createOrganizationRaw(body: body);

  Future<Result<OrganizationPayload>> update(Map<String, dynamic> body) =>
      _api.update(body: body);

  Future<Result<OrganizationPayload>> delete({
    required String organizationId,
  }) => _api.delete(organizationId: organizationId);

  Future<Result<OrganizationPayload?>> getFullOrganization({
    String? organizationId,
    String? organizationSlug,
    int? membersLimit,
  }) => _api.getFullOrganization(
    organizationId: organizationId,
    organizationSlug: organizationSlug,
    membersLimit: membersLimit,
  );

  Future<Result<List<OrganizationPayload>>> listOrganizations() =>
      _api.listOrganizations();

  Future<Result<OrganizationMember>> addMember({
    required String userId,
    required Object role,
    String? organizationId,
    String? teamId,
  }) =>
      _api.addMember(
        userId: userId,
        role: role,
        organizationId: organizationId,
        teamId: teamId,
      );

  Future<Result<OrganizationMember>> addMemberRaw(Map<String, dynamic> body) =>
      _api.addMemberRaw(body: body);

  Future<Result<WrappedOrganizationMemberResponse>> removeMember({
    required String memberIdOrEmail,
    String? organizationId,
  }) => _api.removeMember(
    memberIdOrEmail: memberIdOrEmail,
    organizationId: organizationId,
  );

  Future<Result<OrganizationMember>> updateMemberRole({
    required Object role,
    required String memberId,
    String? organizationId,
  }) => _api.updateMemberRole(
    role: role,
    memberId: memberId,
    organizationId: organizationId,
  );

  Future<Result<OrganizationMember>> getActiveMember() =>
      _api.getActiveMember();

  Future<Result<OrganizationMember>> leave({required String organizationId}) =>
      _api.leave(organizationId: organizationId);

  Future<Result<OrganizationMembersPage>> listMembers({
    int? limit,
    int? offset,
    String? sortBy,
    String? sortDirection,
    String? filterField,
    String? filterOperator,
    String? filterValue,
    String? organizationId,
    String? organizationSlug,
  }) =>
      _api.listMembers(
        limit: limit,
        offset: offset,
        sortBy: sortBy,
        sortDirection: sortDirection,
        filterField: filterField,
        filterOperator: filterOperator,
        filterValue: filterValue,
        organizationId: organizationId,
        organizationSlug: organizationSlug,
      );

  Future<Result<OrganizationMembersPage>> listMembersRaw(
    Map<String, dynamic> queries,
  ) =>
      _api.listMembersRaw(queries: queries);

  Future<Result<OrganizationMemberRoleResponse>> getActiveMemberRole({
    String? userId,
    String? organizationId,
    String? organizationSlug,
  }) => _api.getActiveMemberRole(
    userId: userId,
    organizationId: organizationId,
    organizationSlug: organizationSlug,
  );

  Future<Result<OrganizationInvitation>> inviteMember({
    required String email,
    required Object role,
    String? organizationId,
    bool? resend,
    Object? teamId,
  }) =>
      _api.inviteMember(
        email: email,
        role: role,
        organizationId: organizationId,
        resend: resend,
        teamId: teamId,
      );

  Future<Result<OrganizationInvitation>> inviteMemberRaw(
    Map<String, dynamic> body,
  ) =>
      _api.inviteMemberRaw(body: body);

  Future<Result<InvitationWithMemberResponse>> acceptInvitation({
    required String invitationId,
  }) => _api.acceptInvitation(invitationId: invitationId);

  Future<Result<InvitationWithMemberResponse>> rejectInvitation({
    required String invitationId,
  }) => _api.rejectInvitation(invitationId: invitationId);

  Future<Result<OrganizationInvitation>> cancelInvitation({
    required String invitationId,
  }) => _api.cancelInvitation(invitationId: invitationId);

  Future<Result<OrganizationInvitation>> fetchInvitation({
    required String id,
  }) => _api.fetchInvitation(id: id);

  Future<Result<List<OrganizationInvitation>>> listInvitations({
    String? organizationId,
  }) => _api.listInvitations(organizationId: organizationId);

  Future<Result<List<OrganizationInvitation>>> listUserInvitations({
    String? email,
  }) => _api.listUserInvitations(email: email);

  Future<Result<OrganizationCreateRoleResponse>> createRole(
    Map<String, dynamic> body,
  ) => _api.createRole(body: body);

  Future<Result<OrganizationOperationSuccess>> deleteRole(
    Map<String, dynamic> body,
  ) => _api.deleteRole(body: body);

  Future<Result<List<OrganizationRoleRecord>>> listRoles({
    String? organizationId,
  }) => _api.listRoles(organizationId: organizationId);

  Future<Result<OrganizationRoleRecord>> getRole({
    String? organizationId,
    String? roleName,
    String? roleId,
  }) => _api.getRole(
    organizationId: organizationId,
    roleName: roleName,
    roleId: roleId,
  );

  Future<Result<OrganizationUpdateRoleResponse>> updateRole(
    Map<String, dynamic> body,
  ) => _api.updateRole(body: body);

  Future<Result<CheckPermissionResponse>> hasPermission(
    Map<String, dynamic> body,
  ) => _api.hasPermission(body: body);

  Future<Result<OrganizationTeam>> createTeam(Map<String, dynamic> body) =>
      _api.createTeam(body: body);

  Future<Result<OrganizationPlainMessage>> removeTeam({
    required String teamId,
    String? organizationId,
  }) => _api.removeTeam(teamId: teamId, organizationId: organizationId);

  Future<Result<OrganizationTeam>> updateTeam(Map<String, dynamic> body) =>
      _api.updateTeam(body: body);

  Future<Result<List<OrganizationTeam>>> listTeams({String? organizationId}) =>
      _api.listTeams(organizationId: organizationId);

  Future<Result<List<OrganizationTeam>>> listUserTeams() =>
      _api.listUserTeams();

  Future<Result<List<OrganizationTeamMember>>> listTeamMembers({
    String? teamId,
  }) => _api.listTeamMembers(teamId: teamId);

  Future<Result<OrganizationTeamMember>> addTeamMember({
    required String teamId,
    required String userId,
    String? organizationId,
  }) => _api.addTeamMember(
    teamId: teamId,
    userId: userId,
    organizationId: organizationId,
  );

  Future<Result<OrganizationPlainMessage>> removeTeamMember({
    required String teamId,
    required String userId,
    String? organizationId,
  }) => _api.removeTeamMember(
    teamId: teamId,
    userId: userId,
    organizationId: organizationId,
  );
}

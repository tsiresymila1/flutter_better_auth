// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_retrofit.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _OrganizationRetrofit implements OrganizationRetrofit {
  _OrganizationRetrofit(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  Future<HttpResponse<OrganizationSlugCheckResponse>> _checkSlug({
    required String slug,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'slug': slug};
    final _options = _setStreamType<Result<OrganizationSlugCheckResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/check-slug',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationSlugCheckResponse _value;
    try {
      _value = OrganizationSlugCheckResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationSlugCheckResponse>> checkSlug({
    required String slug,
  }) {
    return BetterAuthCallAdapter<OrganizationSlugCheckResponse>().adapt(
      () => _checkSlug(slug: slug),
    );
  }

  Future<HttpResponse<OrganizationPayload>> _create({
    required String name,
    required String slug,
    String? userId,
    String? logo,
    Map<String, dynamic>? metadata,
    bool? keepCurrentActiveOrganization,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'name': name,
      'slug': slug,
      'userId': userId,
      'logo': logo,
      'metadata': metadata,
      'keepCurrentActiveOrganization': keepCurrentActiveOrganization,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationPayload>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/create',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationPayload _value;
    try {
      _value = OrganizationPayload.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationPayload>> create({
    required String name,
    required String slug,
    String? userId,
    String? logo,
    Map<String, dynamic>? metadata,
    bool? keepCurrentActiveOrganization,
  }) {
    return BetterAuthCallAdapter<OrganizationPayload>().adapt(
      () => _create(
        name: name,
        slug: slug,
        userId: userId,
        logo: logo,
        metadata: metadata,
        keepCurrentActiveOrganization: keepCurrentActiveOrganization,
      ),
    );
  }

  Future<HttpResponse<OrganizationPayload>> _createOrganizationRaw({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationPayload>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/create',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationPayload _value;
    try {
      _value = OrganizationPayload.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationPayload>> createOrganizationRaw({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<OrganizationPayload>().adapt(
      () => _createOrganizationRaw(body: body),
    );
  }

  Future<HttpResponse<OrganizationPayload>> _update({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationPayload>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/update',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationPayload _value;
    try {
      _value = OrganizationPayload.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationPayload>> update({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<OrganizationPayload>().adapt(
      () => _update(body: body),
    );
  }

  Future<HttpResponse<OrganizationPayload>> _delete({
    required String organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'organizationId': organizationId};
    final _options = _setStreamType<Result<OrganizationPayload>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/delete',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationPayload _value;
    try {
      _value = OrganizationPayload.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationPayload>> delete({required String organizationId}) {
    return BetterAuthCallAdapter<OrganizationPayload>().adapt(
      () => _delete(organizationId: organizationId),
    );
  }

  Future<HttpResponse<OrganizationPayload?>> _getFullOrganization({
    String? organizationId,
    String? organizationSlug,
    int? membersLimit,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'organizationId': organizationId,
      r'organizationSlug': organizationSlug,
      r'membersLimit': membersLimit,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<OrganizationPayload?>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/get-full-organization',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>?>(_options);
    late OrganizationPayload? _value;
    try {
      _value = _result.data == null
          ? null
          : OrganizationPayload.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationPayload?>> getFullOrganization({
    String? organizationId,
    String? organizationSlug,
    int? membersLimit,
  }) {
    return BetterAuthCallAdapter<OrganizationPayload?>().adapt(
      () => _getFullOrganization(
        organizationId: organizationId,
        organizationSlug: organizationSlug,
        membersLimit: membersLimit,
      ),
    );
  }

  Future<HttpResponse<List<OrganizationPayload>>> _listOrganizations() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<List<OrganizationPayload>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/list',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<OrganizationPayload> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                OrganizationPayload.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<List<OrganizationPayload>>> listOrganizations() {
    return BetterAuthCallAdapter<List<OrganizationPayload>>().adapt(
      () => _listOrganizations(),
    );
  }

  Future<HttpResponse<OrganizationMember>> _addMember({
    required String userId,
    required Object role,
    String? organizationId,
    String? teamId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'userId': userId,
      'role': role,
      'organizationId': organizationId,
      'teamId': teamId,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationMember>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/add-member',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationMember _value;
    try {
      _value = OrganizationMember.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationMember>> addMember({
    required String userId,
    required Object role,
    String? organizationId,
    String? teamId,
  }) {
    return BetterAuthCallAdapter<OrganizationMember>().adapt(
      () => _addMember(
        userId: userId,
        role: role,
        organizationId: organizationId,
        teamId: teamId,
      ),
    );
  }

  Future<HttpResponse<OrganizationMember>> _addMemberRaw({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationMember>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/add-member',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationMember _value;
    try {
      _value = OrganizationMember.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationMember>> addMemberRaw({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<OrganizationMember>().adapt(
      () => _addMemberRaw(body: body),
    );
  }

  Future<HttpResponse<WrappedOrganizationMemberResponse>> _removeMember({
    required String memberIdOrEmail,
    String? organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'memberIdOrEmail': memberIdOrEmail,
      'organizationId': organizationId,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<WrappedOrganizationMemberResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/remove-member',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late WrappedOrganizationMemberResponse _value;
    try {
      _value = WrappedOrganizationMemberResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<WrappedOrganizationMemberResponse>> removeMember({
    required String memberIdOrEmail,
    String? organizationId,
  }) {
    return BetterAuthCallAdapter<WrappedOrganizationMemberResponse>().adapt(
      () => _removeMember(
        memberIdOrEmail: memberIdOrEmail,
        organizationId: organizationId,
      ),
    );
  }

  Future<HttpResponse<OrganizationMember>> _updateMemberRole({
    required Object role,
    required String memberId,
    String? organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'role': role,
      'memberId': memberId,
      'organizationId': organizationId,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationMember>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/update-member-role',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationMember _value;
    try {
      _value = OrganizationMember.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationMember>> updateMemberRole({
    required Object role,
    required String memberId,
    String? organizationId,
  }) {
    return BetterAuthCallAdapter<OrganizationMember>().adapt(
      () => _updateMemberRole(
        role: role,
        memberId: memberId,
        organizationId: organizationId,
      ),
    );
  }

  Future<HttpResponse<OrganizationMember>> _getActiveMember() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<OrganizationMember>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/get-active-member',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationMember _value;
    try {
      _value = OrganizationMember.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationMember>> getActiveMember() {
    return BetterAuthCallAdapter<OrganizationMember>().adapt(
      () => _getActiveMember(),
    );
  }

  Future<HttpResponse<OrganizationMember>> _leave({
    required String organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'organizationId': organizationId};
    final _options = _setStreamType<Result<OrganizationMember>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/leave',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationMember _value;
    try {
      _value = OrganizationMember.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationMember>> leave({required String organizationId}) {
    return BetterAuthCallAdapter<OrganizationMember>().adapt(
      () => _leave(organizationId: organizationId),
    );
  }

  Future<HttpResponse<OrganizationMembersPage>> _listMembers({
    int? limit,
    int? offset,
    String? sortBy,
    String? sortDirection,
    String? filterField,
    String? filterOperator,
    String? filterValue,
    String? organizationId,
    String? organizationSlug,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'offset': offset,
      r'sortBy': sortBy,
      r'sortDirection': sortDirection,
      r'filterField': filterField,
      r'filterOperator': filterOperator,
      r'filterValue': filterValue,
      r'organizationId': organizationId,
      r'organizationSlug': organizationSlug,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<OrganizationMembersPage>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/list-members',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationMembersPage _value;
    try {
      _value = OrganizationMembersPage.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
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
  }) {
    return BetterAuthCallAdapter<OrganizationMembersPage>().adapt(
      () => _listMembers(
        limit: limit,
        offset: offset,
        sortBy: sortBy,
        sortDirection: sortDirection,
        filterField: filterField,
        filterOperator: filterOperator,
        filterValue: filterValue,
        organizationId: organizationId,
        organizationSlug: organizationSlug,
      ),
    );
  }

  Future<HttpResponse<OrganizationMembersPage>> _listMembersRaw({
    required Map<String, dynamic> queries,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<OrganizationMembersPage>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/list-members',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationMembersPage _value;
    try {
      _value = OrganizationMembersPage.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationMembersPage>> listMembersRaw({
    required Map<String, dynamic> queries,
  }) {
    return BetterAuthCallAdapter<OrganizationMembersPage>().adapt(
      () => _listMembersRaw(queries: queries),
    );
  }

  Future<HttpResponse<OrganizationMemberRoleResponse>> _getActiveMemberRole({
    String? userId,
    String? organizationId,
    String? organizationSlug,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'userId': userId,
      r'organizationId': organizationId,
      r'organizationSlug': organizationSlug,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<OrganizationMemberRoleResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/get-active-member-role',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationMemberRoleResponse _value;
    try {
      _value = OrganizationMemberRoleResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationMemberRoleResponse>> getActiveMemberRole({
    String? userId,
    String? organizationId,
    String? organizationSlug,
  }) {
    return BetterAuthCallAdapter<OrganizationMemberRoleResponse>().adapt(
      () => _getActiveMemberRole(
        userId: userId,
        organizationId: organizationId,
        organizationSlug: organizationSlug,
      ),
    );
  }

  Future<HttpResponse<OrganizationInvitation>> _inviteMember({
    required String email,
    required Object role,
    String? organizationId,
    bool? resend,
    Object? teamId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'email': email,
      'role': role,
      'organizationId': organizationId,
      'resend': resend,
      'teamId': teamId,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationInvitation>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/invite-member',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationInvitation _value;
    try {
      _value = OrganizationInvitation.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationInvitation>> inviteMember({
    required String email,
    required Object role,
    String? organizationId,
    bool? resend,
    Object? teamId,
  }) {
    return BetterAuthCallAdapter<OrganizationInvitation>().adapt(
      () => _inviteMember(
        email: email,
        role: role,
        organizationId: organizationId,
        resend: resend,
        teamId: teamId,
      ),
    );
  }

  Future<HttpResponse<OrganizationInvitation>> _inviteMemberRaw({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationInvitation>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/invite-member',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationInvitation _value;
    try {
      _value = OrganizationInvitation.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationInvitation>> inviteMemberRaw({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<OrganizationInvitation>().adapt(
      () => _inviteMemberRaw(body: body),
    );
  }

  Future<HttpResponse<InvitationWithMemberResponse>> _acceptInvitation({
    required String invitationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'invitationId': invitationId};
    final _options = _setStreamType<Result<InvitationWithMemberResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/accept-invitation',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late InvitationWithMemberResponse _value;
    try {
      _value = InvitationWithMemberResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<InvitationWithMemberResponse>> acceptInvitation({
    required String invitationId,
  }) {
    return BetterAuthCallAdapter<InvitationWithMemberResponse>().adapt(
      () => _acceptInvitation(invitationId: invitationId),
    );
  }

  Future<HttpResponse<InvitationWithMemberResponse>> _rejectInvitation({
    required String invitationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'invitationId': invitationId};
    final _options = _setStreamType<Result<InvitationWithMemberResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/reject-invitation',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late InvitationWithMemberResponse _value;
    try {
      _value = InvitationWithMemberResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<InvitationWithMemberResponse>> rejectInvitation({
    required String invitationId,
  }) {
    return BetterAuthCallAdapter<InvitationWithMemberResponse>().adapt(
      () => _rejectInvitation(invitationId: invitationId),
    );
  }

  Future<HttpResponse<OrganizationInvitation>> _cancelInvitation({
    required String invitationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'invitationId': invitationId};
    final _options = _setStreamType<Result<OrganizationInvitation>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/cancel-invitation',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationInvitation _value;
    try {
      _value = OrganizationInvitation.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationInvitation>> cancelInvitation({
    required String invitationId,
  }) {
    return BetterAuthCallAdapter<OrganizationInvitation>().adapt(
      () => _cancelInvitation(invitationId: invitationId),
    );
  }

  Future<HttpResponse<OrganizationInvitation>> _fetchInvitation({
    required String id,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<OrganizationInvitation>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/get-invitation',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationInvitation _value;
    try {
      _value = OrganizationInvitation.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationInvitation>> fetchInvitation({required String id}) {
    return BetterAuthCallAdapter<OrganizationInvitation>().adapt(
      () => _fetchInvitation(id: id),
    );
  }

  Future<HttpResponse<List<OrganizationInvitation>>> _listInvitations({
    String? organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'organizationId': organizationId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<List<OrganizationInvitation>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/list-invitations',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<OrganizationInvitation> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                OrganizationInvitation.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<List<OrganizationInvitation>>> listInvitations({
    String? organizationId,
  }) {
    return BetterAuthCallAdapter<List<OrganizationInvitation>>().adapt(
      () => _listInvitations(organizationId: organizationId),
    );
  }

  Future<HttpResponse<List<OrganizationInvitation>>> _listUserInvitations({
    String? email,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'email': email};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<List<OrganizationInvitation>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/list-user-invitations',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<OrganizationInvitation> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                OrganizationInvitation.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<List<OrganizationInvitation>>> listUserInvitations({
    String? email,
  }) {
    return BetterAuthCallAdapter<List<OrganizationInvitation>>().adapt(
      () => _listUserInvitations(email: email),
    );
  }

  Future<HttpResponse<OrganizationCreateRoleResponse>> _createRole({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationCreateRoleResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/create-role',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationCreateRoleResponse _value;
    try {
      _value = OrganizationCreateRoleResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationCreateRoleResponse>> createRole({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<OrganizationCreateRoleResponse>().adapt(
      () => _createRole(body: body),
    );
  }

  Future<HttpResponse<OrganizationOperationSuccess>> _deleteRole({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationOperationSuccess>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/delete-role',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationOperationSuccess _value;
    try {
      _value = OrganizationOperationSuccess.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationOperationSuccess>> deleteRole({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<OrganizationOperationSuccess>().adapt(
      () => _deleteRole(body: body),
    );
  }

  Future<HttpResponse<List<OrganizationRoleRecord>>> _listRoles({
    String? organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'organizationId': organizationId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<List<OrganizationRoleRecord>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/list-roles',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<OrganizationRoleRecord> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                OrganizationRoleRecord.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<List<OrganizationRoleRecord>>> listRoles({
    String? organizationId,
  }) {
    return BetterAuthCallAdapter<List<OrganizationRoleRecord>>().adapt(
      () => _listRoles(organizationId: organizationId),
    );
  }

  Future<HttpResponse<OrganizationRoleRecord>> _getRole({
    String? organizationId,
    String? roleName,
    String? roleId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'organizationId': organizationId,
      r'roleName': roleName,
      r'roleId': roleId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<OrganizationRoleRecord>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/get-role',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationRoleRecord _value;
    try {
      _value = OrganizationRoleRecord.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationRoleRecord>> getRole({
    String? organizationId,
    String? roleName,
    String? roleId,
  }) {
    return BetterAuthCallAdapter<OrganizationRoleRecord>().adapt(
      () => _getRole(
        organizationId: organizationId,
        roleName: roleName,
        roleId: roleId,
      ),
    );
  }

  Future<HttpResponse<OrganizationUpdateRoleResponse>> _updateRole({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationUpdateRoleResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/update-role',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationUpdateRoleResponse _value;
    try {
      _value = OrganizationUpdateRoleResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationUpdateRoleResponse>> updateRole({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<OrganizationUpdateRoleResponse>().adapt(
      () => _updateRole(body: body),
    );
  }

  Future<HttpResponse<CheckPermissionResponse>> _hasPermission({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<CheckPermissionResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/has-permission',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late CheckPermissionResponse _value;
    try {
      _value = CheckPermissionResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<CheckPermissionResponse>> hasPermission({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<CheckPermissionResponse>().adapt(
      () => _hasPermission(body: body),
    );
  }

  Future<HttpResponse<OrganizationTeam>> _createTeam({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationTeam>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/create-team',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationTeam _value;
    try {
      _value = OrganizationTeam.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationTeam>> createTeam({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<OrganizationTeam>().adapt(
      () => _createTeam(body: body),
    );
  }

  Future<HttpResponse<OrganizationPlainMessage>> _removeTeam({
    required String teamId,
    String? organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'teamId': teamId,
      'organizationId': organizationId,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationPlainMessage>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/remove-team',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationPlainMessage _value;
    try {
      _value = OrganizationPlainMessage.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationPlainMessage>> removeTeam({
    required String teamId,
    String? organizationId,
  }) {
    return BetterAuthCallAdapter<OrganizationPlainMessage>().adapt(
      () => _removeTeam(teamId: teamId, organizationId: organizationId),
    );
  }

  Future<HttpResponse<OrganizationTeam>> _updateTeam({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationTeam>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/update-team',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationTeam _value;
    try {
      _value = OrganizationTeam.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationTeam>> updateTeam({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<OrganizationTeam>().adapt(
      () => _updateTeam(body: body),
    );
  }

  Future<HttpResponse<List<OrganizationTeam>>> _listTeams({
    String? organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'organizationId': organizationId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<List<OrganizationTeam>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/list-teams',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<OrganizationTeam> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => OrganizationTeam.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<List<OrganizationTeam>>> listTeams({String? organizationId}) {
    return BetterAuthCallAdapter<List<OrganizationTeam>>().adapt(
      () => _listTeams(organizationId: organizationId),
    );
  }

  Future<HttpResponse<List<OrganizationTeam>>> _listUserTeams() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<List<OrganizationTeam>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/list-user-teams',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<OrganizationTeam> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) => OrganizationTeam.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<List<OrganizationTeam>>> listUserTeams() {
    return BetterAuthCallAdapter<List<OrganizationTeam>>().adapt(
      () => _listUserTeams(),
    );
  }

  Future<HttpResponse<List<OrganizationTeamMember>>> _listTeamMembers({
    String? teamId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'teamId': teamId};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<List<OrganizationTeamMember>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/list-team-members',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<List<dynamic>>(_options);
    late List<OrganizationTeamMember> _value;
    try {
      _value = _result.data!
          .map(
            (dynamic i) =>
                OrganizationTeamMember.fromJson(i as Map<String, dynamic>),
          )
          .toList();
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<List<OrganizationTeamMember>>> listTeamMembers({
    String? teamId,
  }) {
    return BetterAuthCallAdapter<List<OrganizationTeamMember>>().adapt(
      () => _listTeamMembers(teamId: teamId),
    );
  }

  Future<HttpResponse<OrganizationTeamMember>> _addTeamMember({
    required String teamId,
    required String userId,
    String? organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'teamId': teamId,
      'userId': userId,
      'organizationId': organizationId,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationTeamMember>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/add-team-member',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationTeamMember _value;
    try {
      _value = OrganizationTeamMember.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationTeamMember>> addTeamMember({
    required String teamId,
    required String userId,
    String? organizationId,
  }) {
    return BetterAuthCallAdapter<OrganizationTeamMember>().adapt(
      () => _addTeamMember(
        teamId: teamId,
        userId: userId,
        organizationId: organizationId,
      ),
    );
  }

  Future<HttpResponse<OrganizationPlainMessage>> _removeTeamMember({
    required String teamId,
    required String userId,
    String? organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'teamId': teamId,
      'userId': userId,
      'organizationId': organizationId,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<OrganizationPlainMessage>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/remove-team-member',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late OrganizationPlainMessage _value;
    try {
      _value = OrganizationPlainMessage.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<OrganizationPlainMessage>> removeTeamMember({
    required String teamId,
    required String userId,
    String? organizationId,
  }) {
    return BetterAuthCallAdapter<OrganizationPlainMessage>().adapt(
      () => _removeTeamMember(
        teamId: teamId,
        userId: userId,
        organizationId: organizationId,
      ),
    );
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on

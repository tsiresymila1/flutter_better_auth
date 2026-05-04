// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_better_auth.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _OrganizationBetterAuth implements OrganizationBetterAuth {
  _OrganizationBetterAuth(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  Future<HttpResponse<List<Organization>>> _listOrganizations() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<List<Organization>>>(
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
    late List<Organization> _value;
    try {
      _value =
          _result.data!
              .map(
                (dynamic i) => Organization.fromJson(i as Map<String, dynamic>),
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
  Future<Result<List<Organization>>> listOrganizations() {
    return BetterAuthCallAdapter<List<Organization>>().adapt(
      () => _listOrganizations(),
    );
  }

  Future<HttpResponse<Organization>> _create({
    required String name,
    required String slug,
    String? logo,
    Map<String, dynamic>? metadata,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'name': name,
      'slug': slug,
      'logo': logo,
      'metadata': metadata,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<Organization>>(
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
    late Organization _value;
    try {
      _value = Organization.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<Organization>> create({
    required String name,
    required String slug,
    String? logo,
    Map<String, dynamic>? metadata,
  }) {
    return BetterAuthCallAdapter<Organization>().adapt(
      () => _create(name: name, slug: slug, logo: logo, metadata: metadata),
    );
  }

  Future<HttpResponse<StatusResponse>> _delete({
    required String organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'organizationId': organizationId};
    final _options = _setStreamType<Result<StatusResponse>>(
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
    late StatusResponse _value;
    try {
      _value = StatusResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<StatusResponse>> delete({required String organizationId}) {
    return BetterAuthCallAdapter<StatusResponse>().adapt(
      () => _delete(organizationId: organizationId),
    );
  }

  Future<HttpResponse<Organization>> _update({
    required String organizationId,
    required Map<String, dynamic> data,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'organizationId': organizationId,
      'data': data,
    };
    final _options = _setStreamType<Result<Organization>>(
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
    late Organization _value;
    try {
      _value = Organization.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<Organization>> update({
    required String organizationId,
    required Map<String, dynamic> data,
  }) {
    return BetterAuthCallAdapter<Organization>().adapt(
      () => _update(organizationId: organizationId, data: data),
    );
  }

  Future<HttpResponse<Organization>> _setActive({
    required String organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'organizationId': organizationId};
    final _options = _setStreamType<Result<Organization>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/set-active',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Organization _value;
    try {
      _value = Organization.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<Organization>> setActive({required String organizationId}) {
    return BetterAuthCallAdapter<Organization>().adapt(
      () => _setActive(organizationId: organizationId),
    );
  }

  Future<HttpResponse<Organization>> _getOrganization({
    String? organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'organizationId': organizationId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<Organization>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/get-full-organization',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late Organization _value;
    try {
      _value = Organization.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<Organization>> getOrganization({String? organizationId}) {
    return BetterAuthCallAdapter<Organization>().adapt(
      () => _getOrganization(organizationId: organizationId),
    );
  }

  Future<HttpResponse<StatusResponse>> _checkSlug({
    required String slug,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'slug': slug};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<StatusResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/organization/check-slug',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late StatusResponse _value;
    try {
      _value = StatusResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<StatusResponse>> checkSlug({required String slug}) {
    return BetterAuthCallAdapter<StatusResponse>().adapt(
      () => _checkSlug(slug: slug),
    );
  }

  Future<HttpResponse<Invitation>> _inviteMember({
    required String email,
    required String role,
    required String organizationId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'email': email,
      'role': role,
      'organizationId': organizationId,
    };
    final _options = _setStreamType<Result<Invitation>>(
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
    late Invitation _value;
    try {
      _value = Invitation.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<Invitation>> inviteMember({
    required String email,
    required String role,
    required String organizationId,
  }) {
    return BetterAuthCallAdapter<Invitation>().adapt(
      () => _inviteMember(
        email: email,
        role: role,
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

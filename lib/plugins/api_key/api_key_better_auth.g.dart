// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_key_better_auth.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _ApiKeyBetterAuth implements ApiKeyBetterAuth {
  _ApiKeyBetterAuth(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  Future<HttpResponse<ApiKeyModel>> _create({
    String? configId,
    String? name,
    int? expiresIn,
    String? userId,
    String? organizationId,
    String? prefix,
    int? remaining,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? permissions,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'configId': configId,
      'name': name,
      'expiresIn': expiresIn,
      'userId': userId,
      'organizationId': organizationId,
      'prefix': prefix,
      'remaining': remaining,
      'metadata': metadata,
      'permissions': permissions,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<ApiKeyModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api-key/create',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiKeyModel _value;
    try {
      _value = ApiKeyModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<ApiKeyModel>> create({
    String? configId,
    String? name,
    int? expiresIn,
    String? userId,
    String? organizationId,
    String? prefix,
    int? remaining,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? permissions,
  }) {
    return BetterAuthCallAdapter<ApiKeyModel>().adapt(
      () => _create(
        configId: configId,
        name: name,
        expiresIn: expiresIn,
        userId: userId,
        organizationId: organizationId,
        prefix: prefix,
        remaining: remaining,
        metadata: metadata,
        permissions: permissions,
      ),
    );
  }

  Future<HttpResponse<VerifyApiKeyResponse>> _verify({
    String? configId,
    required String key,
    Map<String, dynamic>? permissions,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'configId': configId,
      'key': key,
      'permissions': permissions,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<VerifyApiKeyResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api-key/verify',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late VerifyApiKeyResponse _value;
    try {
      _value = VerifyApiKeyResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<VerifyApiKeyResponse>> verify({
    String? configId,
    required String key,
    Map<String, dynamic>? permissions,
  }) {
    return BetterAuthCallAdapter<VerifyApiKeyResponse>().adapt(
      () => _verify(configId: configId, key: key, permissions: permissions),
    );
  }

  Future<HttpResponse<ApiKeyModel>> _fetch({
    String? configId,
    required String id,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'configId': configId, r'id': id};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<ApiKeyModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api-key/get',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiKeyModel _value;
    try {
      _value = ApiKeyModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<ApiKeyModel>> fetch({String? configId, required String id}) {
    return BetterAuthCallAdapter<ApiKeyModel>().adapt(
      () => _fetch(configId: configId, id: id),
    );
  }

  Future<HttpResponse<ApiKeyModel>> _update({
    String? configId,
    required String keyId,
    String? userId,
    String? name,
    bool? enabled,
    int? remaining,
    int? refillAmount,
    int? refillInterval,
    Map<String, dynamic>? metadata,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'configId': configId,
      'keyId': keyId,
      'userId': userId,
      'name': name,
      'enabled': enabled,
      'remaining': remaining,
      'refillAmount': refillAmount,
      'refillInterval': refillInterval,
      'metadata': metadata,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<ApiKeyModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api-key/update',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiKeyModel _value;
    try {
      _value = ApiKeyModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<ApiKeyModel>> update({
    String? configId,
    required String keyId,
    String? userId,
    String? name,
    bool? enabled,
    int? remaining,
    int? refillAmount,
    int? refillInterval,
    Map<String, dynamic>? metadata,
  }) {
    return BetterAuthCallAdapter<ApiKeyModel>().adapt(
      () => _update(
        configId: configId,
        keyId: keyId,
        userId: userId,
        name: name,
        enabled: enabled,
        remaining: remaining,
        refillAmount: refillAmount,
        refillInterval: refillInterval,
        metadata: metadata,
      ),
    );
  }

  Future<HttpResponse<SuccessResponse>> _delete({
    String? configId,
    required String keyId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'configId': configId, 'keyId': keyId};
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<SuccessResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api-key/delete',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SuccessResponse _value;
    try {
      _value = SuccessResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SuccessResponse>> delete({
    String? configId,
    required String keyId,
  }) {
    return BetterAuthCallAdapter<SuccessResponse>().adapt(
      () => _delete(configId: configId, keyId: keyId),
    );
  }

  Future<HttpResponse<ApiKeysListResponse>> _list({
    String? configId,
    String? organizationId,
    int? limit,
    int? offset,
    String? sortBy,
    String? sortDirection,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'configId': configId,
      r'organizationId': organizationId,
      r'limit': limit,
      r'offset': offset,
      r'sortBy': sortBy,
      r'sortDirection': sortDirection,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<ApiKeysListResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api-key/list',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiKeysListResponse _value;
    try {
      _value = ApiKeysListResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<ApiKeysListResponse>> list({
    String? configId,
    String? organizationId,
    int? limit,
    int? offset,
    String? sortBy,
    String? sortDirection,
  }) {
    return BetterAuthCallAdapter<ApiKeysListResponse>().adapt(
      () => _list(
        configId: configId,
        organizationId: organizationId,
        limit: limit,
        offset: offset,
        sortBy: sortBy,
        sortDirection: sortDirection,
      ),
    );
  }

  Future<HttpResponse<DeleteExpiredApiKeysResponse>> _deleteAllExpired({
    Map<String, dynamic> body = const {},
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<DeleteExpiredApiKeysResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api-key/delete-all-expired-api-keys',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DeleteExpiredApiKeysResponse _value;
    try {
      _value = DeleteExpiredApiKeysResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<DeleteExpiredApiKeysResponse>> deleteAllExpired({
    Map<String, dynamic> body = const {},
  }) {
    return BetterAuthCallAdapter<DeleteExpiredApiKeysResponse>().adapt(
      () => _deleteAllExpired(body: body),
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

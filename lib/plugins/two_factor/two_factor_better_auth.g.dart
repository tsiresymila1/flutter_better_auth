// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_factor_better_auth.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _TwoFactorBetterAuth implements TwoFactorBetterAuth {
  _TwoFactorBetterAuth(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  Future<HttpResponse<TwoFactorEnableResponse>> _enable({
    String? password,
    String? issuer,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'password': password, 'issuer': issuer};
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<TwoFactorEnableResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/two-factor/enable',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late TwoFactorEnableResponse _value;
    try {
      _value = TwoFactorEnableResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<TwoFactorEnableResponse>> enable({
    String? password,
    String? issuer,
  }) {
    return BetterAuthCallAdapter<TwoFactorEnableResponse>().adapt(
      () => _enable(password: password, issuer: issuer),
    );
  }

  Future<HttpResponse<StatusResponse>> _disable({String? password}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'password': password};
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<StatusResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/two-factor/disable',
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
  Future<Result<StatusResponse>> disable({String? password}) {
    return BetterAuthCallAdapter<StatusResponse>().adapt(
      () => _disable(password: password),
    );
  }

  Future<HttpResponse<TwoFactorTotpUriResponse>> _getTotpUri({
    String? password,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'password': password};
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<TwoFactorTotpUriResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/two-factor/get-totp-uri',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late TwoFactorTotpUriResponse _value;
    try {
      _value = TwoFactorTotpUriResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<TwoFactorTotpUriResponse>> getTotpUri({String? password}) {
    return BetterAuthCallAdapter<TwoFactorTotpUriResponse>().adapt(
      () => _getTotpUri(password: password),
    );
  }

  Future<HttpResponse<SignUpResponse>> _verifyTotp({
    required String code,
    bool? trustDevice,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'code': code, 'trustDevice': trustDevice};
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<SignUpResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/two-factor/verify-totp',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SignUpResponse _value;
    try {
      _value = SignUpResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SignUpResponse>> verifyTotp({
    required String code,
    bool? trustDevice,
  }) {
    return BetterAuthCallAdapter<SignUpResponse>().adapt(
      () => _verifyTotp(code: code, trustDevice: trustDevice),
    );
  }

  Future<HttpResponse<StatusResponse>> _sendOtp({bool? trustDevice}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'trustDevice': trustDevice};
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<StatusResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/two-factor/send-otp',
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
  Future<Result<StatusResponse>> sendOtp({bool? trustDevice}) {
    return BetterAuthCallAdapter<StatusResponse>().adapt(
      () => _sendOtp(trustDevice: trustDevice),
    );
  }

  Future<HttpResponse<SignUpResponse>> _verifyOtp({
    required String code,
    bool? trustDevice,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'code': code, 'trustDevice': trustDevice};
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<SignUpResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/two-factor/verify-otp',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SignUpResponse _value;
    try {
      _value = SignUpResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SignUpResponse>> verifyOtp({
    required String code,
    bool? trustDevice,
  }) {
    return BetterAuthCallAdapter<SignUpResponse>().adapt(
      () => _verifyOtp(code: code, trustDevice: trustDevice),
    );
  }

  Future<HttpResponse<SignUpResponse>> _verifyBackupCode({
    required String code,
    bool? disableSession,
    bool? trustDevice,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'code': code,
      'disableSession': disableSession,
      'trustDevice': trustDevice,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<SignUpResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/two-factor/verify-backup-code',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SignUpResponse _value;
    try {
      _value = SignUpResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SignUpResponse>> verifyBackupCode({
    required String code,
    bool? disableSession,
    bool? trustDevice,
  }) {
    return BetterAuthCallAdapter<SignUpResponse>().adapt(
      () => _verifyBackupCode(
        code: code,
        disableSession: disableSession,
        trustDevice: trustDevice,
      ),
    );
  }

  Future<HttpResponse<TwoFactorBackupCodesResponse>> _generateBackupCodes({
    String? password,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'password': password};
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<TwoFactorBackupCodesResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/two-factor/generate-backup-codes',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late TwoFactorBackupCodesResponse _value;
    try {
      _value = TwoFactorBackupCodesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<TwoFactorBackupCodesResponse>> generateBackupCodes({
    String? password,
  }) {
    return BetterAuthCallAdapter<TwoFactorBackupCodesResponse>().adapt(
      () => _generateBackupCodes(password: password),
    );
  }

  Future<HttpResponse<TwoFactorBackupCodesResponse>> _viewBackupCodes({
    required String userId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'userId': userId};
    final _options = _setStreamType<Result<TwoFactorBackupCodesResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/two-factor/view-backup-codes',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late TwoFactorBackupCodesResponse _value;
    try {
      _value = TwoFactorBackupCodesResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<TwoFactorBackupCodesResponse>> viewBackupCodes({
    required String userId,
  }) {
    return BetterAuthCallAdapter<TwoFactorBackupCodesResponse>().adapt(
      () => _viewBackupCodes(userId: userId),
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_better_auth.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _PhoneBetterAuth implements PhoneBetterAuth {
  _PhoneBetterAuth(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  Future<HttpResponse<SignUpResponse>> _signIn({
    required String phoneNumber,
    required String password,
    bool? rememberMe,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'phoneNumber': phoneNumber,
      'password': password,
      'rememberMe': rememberMe,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<SignUpResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/sign-in/phone-number',
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
  Future<Result<SignUpResponse>> signIn({
    required String phoneNumber,
    required String password,
    bool? rememberMe,
  }) {
    return BetterAuthCallAdapter<SignUpResponse>().adapt(
      () => _signIn(
        phoneNumber: phoneNumber,
        password: password,
        rememberMe: rememberMe,
      ),
    );
  }

  Future<HttpResponse<SendOTPResponse>> _sendOtp({
    required String phoneNumber,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'phoneNumber': phoneNumber};
    final _options = _setStreamType<Result<SendOTPResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/phone-number/send-otp',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SendOTPResponse _value;
    try {
      _value = SendOTPResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SendOTPResponse>> sendOtp({required String phoneNumber}) {
    return BetterAuthCallAdapter<SendOTPResponse>().adapt(
      () => _sendOtp(phoneNumber: phoneNumber),
    );
  }

  Future<HttpResponse<SignUpResponse>> _verify({
    required String phoneNumber,
    required String code,
    bool? disableSession,
    String? updatePhoneNumber,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'phoneNumber': phoneNumber,
      'code': code,
      'disableSession': disableSession,
      'updatePhoneNumber': updatePhoneNumber,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<SignUpResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/phone-number/verify',
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
  Future<Result<SignUpResponse>> verify({
    required String phoneNumber,
    required String code,
    bool? disableSession,
    String? updatePhoneNumber,
  }) {
    return BetterAuthCallAdapter<SignUpResponse>().adapt(
      () => _verify(
        phoneNumber: phoneNumber,
        code: code,
        disableSession: disableSession,
        updatePhoneNumber: updatePhoneNumber,
      ),
    );
  }

  Future<HttpResponse<StatusResponse>> _requestPasswordResetOTP({
    required String phoneNumber,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'phoneNumber': phoneNumber};
    final _options = _setStreamType<Result<StatusResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/phone-number/request-password-reset',
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
  Future<Result<StatusResponse>> requestPasswordResetOTP({
    required String phoneNumber,
  }) {
    return BetterAuthCallAdapter<StatusResponse>().adapt(
      () => _requestPasswordResetOTP(phoneNumber: phoneNumber),
    );
  }

  Future<HttpResponse<StatusResponse>> _restPassword({
    required String otp,
    required String phoneNumber,
    required String newPassword,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'otp': otp,
      'phoneNumber': phoneNumber,
      'newPassword': newPassword,
    };
    final _options = _setStreamType<Result<StatusResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/phone-number/reset-password',
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
  Future<Result<StatusResponse>> restPassword({
    required String otp,
    required String phoneNumber,
    required String newPassword,
  }) {
    return BetterAuthCallAdapter<StatusResponse>().adapt(
      () => _restPassword(
        otp: otp,
        phoneNumber: phoneNumber,
        newPassword: newPassword,
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

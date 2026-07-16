// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_better_auth.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _SignInBetterAuth implements SignInBetterAuth {
  _SignInBetterAuth(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  Future<HttpResponse<SignInSocialResponse>> _socialAuth({
    required String provider,
    String? callbackURL,
    String? newUserCallbackURL,
    String? errorCallbackURL,
    bool? disableRedirect,
    List<String>? scopes,
    SocialIdTokenBody? idToken,
    bool? requestSignUp,
    String? loginHint,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'provider': provider,
      'callbackURL': callbackURL,
      'newUserCallbackURL': newUserCallbackURL,
      'errorCallbackURL': errorCallbackURL,
      'disableRedirect': disableRedirect,
      'scopes': scopes,
      'idToken': idToken,
      'requestSignUp': requestSignUp,
      'loginHint': loginHint,
    };
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<SignInSocialResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/sign-in/social',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SignInSocialResponse _value;
    try {
      _value = SignInSocialResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SignInSocialResponse>> socialAuth({
    required String provider,
    String? callbackURL,
    String? newUserCallbackURL,
    String? errorCallbackURL,
    bool? disableRedirect,
    List<String>? scopes,
    SocialIdTokenBody? idToken,
    bool? requestSignUp,
    String? loginHint,
  }) {
    return BetterAuthCallAdapter<SignInSocialResponse>().adapt(
      () => _socialAuth(
        provider: provider,
        callbackURL: callbackURL,
        newUserCallbackURL: newUserCallbackURL,
        errorCallbackURL: errorCallbackURL,
        disableRedirect: disableRedirect,
        scopes: scopes,
        idToken: idToken,
        requestSignUp: requestSignUp,
        loginHint: loginHint,
      ),
    );
  }

  Future<HttpResponse<SignInEmailResponse>> _emailRaw({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<SignInEmailResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/sign-in/email',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SignInEmailResponse _value;
    try {
      _value = SignInEmailResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SignInEmailResponse>> emailRaw({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<SignInEmailResponse>().adapt(
      () => _emailRaw(body: body),
    );
  }

  Future<HttpResponse<SignInEmailResponse>> _usernameRaw({
    required Map<String, dynamic> body,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body);
    _data.removeWhere((k, v) => v == null);
    final _options = _setStreamType<Result<SignInEmailResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/sign-in/username',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late SignInEmailResponse _value;
    try {
      _value = SignInEmailResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SignInEmailResponse>> usernameRaw({
    required Map<String, dynamic> body,
  }) {
    return BetterAuthCallAdapter<SignInEmailResponse>().adapt(
      () => _usernameRaw(body: body),
    );
  }

  Future<HttpResponse<SignUpResponse>> _anonymous() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<Result<SignUpResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/sign-in/anonymous',
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
  Future<Result<SignUpResponse>> anonymous() {
    return BetterAuthCallAdapter<SignUpResponse>().adapt(() => _anonymous());
  }

  Future<HttpResponse<UsernameAvailableResponse>> _isUsernameAvailable({
    required String username,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{'username': username};
    final _options = _setStreamType<Result<UsernameAvailableResponse>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/is-username-available',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late UsernameAvailableResponse _value;
    try {
      _value = UsernameAvailableResponse.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<UsernameAvailableResponse>> isUsernameAvailable({
    required String username,
  }) {
    return BetterAuthCallAdapter<UsernameAvailableResponse>().adapt(
      () => _isUsernameAvailable(username: username),
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

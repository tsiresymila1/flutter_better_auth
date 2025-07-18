// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_better_auth.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

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
    String? scopes,
    SocialIdTokenBody? idToken,
    String? requestSignUp,
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
      errorLogger?.logError(e, s, _options);
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
    String? scopes,
    SocialIdTokenBody? idToken,
    String? requestSignUp,
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

  Future<HttpResponse<SignInEmailResponse>> _email({
    required String email,
    required String password,
    String? callbackURL,
    String? rememberMe,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'email': email,
      'password': password,
      'callbackURL': callbackURL,
      'rememberMe': rememberMe,
    };
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
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SignInEmailResponse>> email({
    required String email,
    required String password,
    String? callbackURL,
    String? rememberMe,
  }) {
    return BetterAuthCallAdapter<SignInEmailResponse>().adapt(
      () => _email(
        email: email,
        password: password,
        callbackURL: callbackURL,
        rememberMe: rememberMe,
      ),
    );
  }

  Future<HttpResponse<SignInEmailResponse>> _username({
    required String username,
    required String password,
    String? rememberMe,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{
      'username': username,
      'password': password,
      'rememberMe': rememberMe,
    };
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
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SignInEmailResponse>> username({
    required String username,
    required String password,
    String? rememberMe,
  }) {
    return BetterAuthCallAdapter<SignInEmailResponse>().adapt(
      () => _username(
        username: username,
        password: password,
        rememberMe: rememberMe,
      ),
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
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  @override
  Future<Result<SignUpResponse>> anonymous() {
    return BetterAuthCallAdapter<SignUpResponse>().adapt(() => _anonymous());
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

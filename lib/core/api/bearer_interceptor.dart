import 'package:dio/dio.dart';

import '../flutter_better_auth.dart';

/// Better Auth `bearer` plugin support.
///
/// Captures the `set-auth-token` header that Better Auth returns on sign-in
/// (when the server `bearer()` plugin is enabled) and attaches
/// `Authorization: Bearer <token>` to subsequent requests. This makes auth work
/// across origins (e.g. Flutter Web on a different origin than the server),
/// where third-party cookies are blocked. No-op when the server never sends the
/// header.
class BearerTokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = FlutterBetterAuth.bearerToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final token = response.headers.value('set-auth-token');
    if (token != null && token.isNotEmpty) {
      FlutterBetterAuth.setBearerToken(token);
    }
    handler.next(response);
  }
}

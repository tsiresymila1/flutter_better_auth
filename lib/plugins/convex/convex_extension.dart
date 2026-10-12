import 'dart:convert';

import '../../core/api/better_auth_client.dart';
import '../../core/api/models/result/result_extension.dart';
import '../../core/flutter_better_auth.dart';
import 'convex_better_auth.dart';

/// Caches the Convex JWT and refreshes it shortly before it expires.
class ConvexTokenProvider {
  ConvexTokenProvider(this._api, {this.leeway = const Duration(seconds: 30)});

  final ConvexBetterAuth _api;
  final Duration leeway;
  String? _token;
  DateTime? _expiresAt;
  Future<String?>? _inflight;

  /// Shape of Convex's `fetchToken({forceRefreshToken})` callback. Returns the
  /// cached token unless [forceRefreshToken] is set or it is close to expiry;
  /// null when signed out or the request fails.
  Future<String?> fetchToken({bool forceRefreshToken = false}) {
    final exp = _expiresAt;
    final fresh =
        _token != null &&
        exp != null &&
        DateTime.now().isBefore(exp.subtract(leeway));
    if (!forceRefreshToken && fresh) return Future.value(_token);
    // Share one request between concurrent callers.
    return _inflight ??= _fetch().whenComplete(() => _inflight = null);
  }

  Future<String?> _fetch() async {
    final result = await _api.token();
    final token = result.data?.token;
    if (token == null) {
      clear();
      return null;
    }
    _token = token;
    _expiresAt = _jwtExpiry(token);
    return token;
  }

  void clear() {
    _token = null;
    _expiresAt = null;
  }
}

// Null expiry makes the token count as stale, so it is refetched each call.
DateTime? _jwtExpiry(String jwt) {
  try {
    final parts = jwt.split('.');
    final payload = jsonDecode(
      utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
    );
    final exp = payload['exp'];
    return exp is num
        ? DateTime.fromMillisecondsSinceEpoch(exp.toInt() * 1000)
        : null;
  } catch (_) {
    return null;
  }
}

final _providers = Expando<ConvexTokenProvider>();

extension ConvexBetterAuthExtension on BetterAuthClient {
  ConvexBetterAuth get convex => ConvexBetterAuth(
    FlutterBetterAuth.dioClient,
    baseUrl: FlutterBetterAuth.baseUrl,
  );

  /// Cached Convex token helper; pass `convexToken.fetchToken` to a Convex
  /// client's auth provider.
  ConvexTokenProvider get convexToken => _providers[this] ??= _create();

  ConvexTokenProvider _create() {
    final provider = ConvexTokenProvider(convex);
    // Never serve a signed-out user's token.
    onAuthChange.listen((user) {
      if (user == null) provider.clear();
    });
    return provider;
  }
}

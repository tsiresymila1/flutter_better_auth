import 'package:cookie_jar/cookie_jar.dart';

import 'storage.dart';

class CustomPersistCookieJar extends PersistCookieJar {
  final StorageInterface? store;
  CustomPersistCookieJar({required this.store, required super.storage});

  @override
  Future<void> saveFromResponse(Uri uri, List<Cookie> cookies) async {
    final persisted = await store?.loadCookies(uri.host) ?? <Cookie>[];
    final merged = <String, Cookie>{};

    for (final cookie in persisted) {
      if (!_isExpired(cookie)) {
        merged[_cookieKey(cookie, uri)] = cookie;
      }
    }
    for (final cookie in cookies) {
      final key = _cookieKey(cookie, uri);
      if (_isExpired(cookie)) {
        merged.remove(key);
      } else {
        _normalizeExpiration(cookie);
        merged[key] = cookie;
      }
    }

    await store?.saveCookies(uri.host, merged.values.toList());
    await super.saveFromResponse(uri, cookies);
  }

  @override
  Future<List<Cookie>> loadForRequest(Uri uri) async {
    final cookies = await store?.loadCookies(uri.host) ?? <Cookie>[];
    final active = cookies.where((cookie) => !_isExpired(cookie)).toList();
    if (active.length != cookies.length) {
      await store?.saveCookies(uri.host, active);
    }
    await super.deleteAll();
    await super.saveFromResponse(uri, active);
    return super.loadForRequest(uri);
  }

  Future<void> clearFor(Uri uri) async {
    await store?.saveCookies(uri.host, []);
    await deleteAll();
  }

  String _cookieKey(Cookie cookie, Uri uri) {
    return '${cookie.name}|${cookie.domain ?? uri.host}|${cookie.path ?? '/'}';
  }

  bool _isExpired(Cookie cookie) {
    if (cookie.maxAge != null && cookie.maxAge! <= 0) {
      return true;
    }
    final expires = cookie.expires;
    return expires != null && !expires.isAfter(DateTime.now());
  }

  void _normalizeExpiration(Cookie cookie) {
    final maxAge = cookie.maxAge;
    if (maxAge != null && maxAge > 0 && cookie.expires == null) {
      cookie.expires = DateTime.now().add(Duration(seconds: maxAge));
      cookie.maxAge = null;
    }
  }
}

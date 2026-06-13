import 'dart:io';

import 'package:flutter_better_auth/core/storage/custom_persist_cookie_jar.dart';
import 'package:flutter_better_auth/core/storage/memory_storage.dart';
import 'package:flutter_better_auth/core/storage/storage.dart';
import 'package:flutter_test/flutter_test.dart';

class InMemoryCookieStorage implements StorageInterface {
  final Map<String, List<Cookie>> cookiesByHost = {};

  @override
  Future<List<Cookie>> loadCookies(String url) async =>
      List.of(cookiesByHost[url] ?? const []);

  @override
  Future<void> saveCookies(String url, List<Cookie> cookies) async {
    cookiesByHost[url] = List.of(cookies);
  }
}

void main() {
  group('CustomPersistCookieJar', () {
    final uri = Uri.parse('https://example.com/api/auth');

    test('merges cookies received in separate responses', () async {
      final storage = InMemoryCookieStorage();
      final jar = CustomPersistCookieJar(
        store: storage,
        storage: MemoryStorage(),
      );

      await jar.saveFromResponse(uri, [Cookie('oauth_state', 'state')]);
      await jar.saveFromResponse(uri, [Cookie('session_token', 'token')]);

      final cookies = await jar.loadForRequest(uri);

      expect(
        {for (final cookie in cookies) cookie.name: cookie.value},
        {'oauth_state': 'state', 'session_token': 'token'},
      );
    });

    test('removes cookies expired by the server', () async {
      final storage = InMemoryCookieStorage();
      final jar = CustomPersistCookieJar(
        store: storage,
        storage: MemoryStorage(),
      );

      await jar.saveFromResponse(uri, [Cookie('session_token', 'token')]);
      await jar.saveFromResponse(uri, [
        Cookie('session_token', '')..maxAge = 0,
      ]);

      expect(await jar.loadForRequest(uri), isEmpty);
    });

    test(
      'does not send persisted cookies outside their request path',
      () async {
        final storage = InMemoryCookieStorage();
        final jar = CustomPersistCookieJar(
          store: storage,
          storage: MemoryStorage(),
        );

        await jar.saveFromResponse(uri, [
          Cookie('admin_session', 'token')..path = '/admin',
        ]);

        expect(await jar.loadForRequest(uri), isEmpty);
      },
    );
  });
}

import 'dart:io';

import 'package:flutter_better_auth/core/storage/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSecureStore extends Mock implements FlutterSecureStorage {}

void main() {
  group('SecureStorage', () {
    late MockSecureStore store;
    late Map<String, String> backing;
    late SecureStorage secureStorage;

    setUp(() {
      store = MockSecureStore();
      backing = {};
      secureStorage = SecureStorage(storage: store);

      when(
        () => store.write(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((inv) async {
        backing[inv.namedArguments[#key] as String] =
            inv.namedArguments[#value] as String;
      });
      when(() => store.read(key: any(named: 'key'))).thenAnswer(
        (inv) async => backing[inv.namedArguments[#key] as String],
      );
      when(() => store.delete(key: any(named: 'key'))).thenAnswer((inv) async {
        backing.remove(inv.namedArguments[#key] as String);
      });
    });

    test('round-trips a small cookie set', () async {
      final cookie = Cookie('session', 'abc123')
        ..domain = 'example.com'
        ..path = '/'
        ..httpOnly = true
        ..secure = true;

      await secureStorage.saveCookies('example.com', [cookie]);
      final loaded = await secureStorage.loadCookies('example.com');

      expect(loaded, hasLength(1));
      expect(loaded.first.name, 'session');
      expect(loaded.first.value, 'abc123');
      expect(loaded.first.domain, 'example.com');
      expect(loaded.first.httpOnly, true);
      expect(loaded.first.secure, true);
    });

    test('chunks and reassembles a value larger than the chunk size', () async {
      final big = 'x' * 5000; // > 1800, forces multiple chunks
      final cookie = Cookie('session', big);

      await secureStorage.saveCookies('example.com', [cookie]);

      // More than one chunk key was written (plus the count marker).
      final chunkKeys = backing.keys.where((k) => k.endsWith('0')).toList();
      expect(chunkKeys, isNotEmpty);
      expect(backing.keys.any((k) => k.endsWith('__count')), isTrue);

      final loaded = await secureStorage.loadCookies('example.com');
      expect(loaded.single.value, big);
    });

    test('saving an empty list clears prior chunks', () async {
      await secureStorage.saveCookies('example.com', [
        Cookie('session', 'y' * 4000),
      ]);
      expect(backing, isNotEmpty);

      await secureStorage.saveCookies('example.com', []);

      expect(backing, isEmpty);
      expect(await secureStorage.loadCookies('example.com'), isEmpty);
    });

    test('returns empty for an unknown host', () async {
      expect(await secureStorage.loadCookies('nope.example.com'), isEmpty);
    });

    test('normalizes hosts with disallowed characters into stable keys', () async {
      final cookie = Cookie('session', 'v');
      await secureStorage.saveCookies('example.com:8080', [cookie]);

      // Key set contains no raw colon.
      expect(backing.keys.every((k) => !k.contains(':')), isTrue);
      final loaded = await secureStorage.loadCookies('example.com:8080');
      expect(loaded.single.value, 'v');
    });
  });
}

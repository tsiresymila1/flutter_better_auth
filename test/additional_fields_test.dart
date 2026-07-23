import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_better_auth/core/api/default/sign_up/sign_up_better_auth.dart';
import 'package:flutter_better_auth/core/api/default/sign_up/sign_up_extension.dart';
import 'package:flutter_better_auth/core/models/additional_fields.dart';
import 'package:flutter_better_auth/core/models/session/session.dart';
import 'package:flutter_better_auth/core/models/user/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User.additionalFields', () {
    test('collects unmapped server keys alongside the static fields', () {
      final user = User.fromJson(<String, dynamic>{
        'id': 'u1',
        'name': 'Jane',
        'email': 'j@x.io',
        'emailVerified': true,
        // Better Auth additionalFields — flat-merged into the user object.
        'firstName': 'Jane',
        'lastName': 'Doe',
        'lang': 'fr',
      });

      expect(user.id, 'u1');
      expect(user.email, 'j@x.io');
      expect(user.emailVerified, isTrue);
      expect(user.additionalFields['firstName'], 'Jane');
      expect(user.additionalFields['lastName'], 'Doe');
      expect(user.additionalFields['lang'], 'fr');
    });

    test('is empty when the payload has no custom fields', () {
      final user = User.fromJson(<String, dynamic>{
        'id': 'u1',
        'name': 'Jane',
        'email': 'j@x.io',
      });
      expect(user.additionalFields, isEmpty);
    });

    test('does not leak a static field name into the map', () {
      final user = User.fromJson(<String, dynamic>{
        'id': 'u1',
        'name': 'Jane',
        'email': 'j@x.io',
        'role': 'admin',
      });
      // `role` is a known field, so it must map to `user.role`, not the map.
      expect(user.role, 'admin');
      expect(user.additionalFields.containsKey('role'), isFalse);
    });

    test('is unmodifiable', () {
      final user = User.fromJson(<String, dynamic>{
        'id': 'u1',
        'name': 'Jane',
        'email': 'j@x.io',
        'firstName': 'Jane',
      });
      expect(
        () => user.additionalFields['lastName'] = 'Doe',
        throwsUnsupportedError,
      );
    });
  });

  group('field<T>() accessor', () {
    final user = User.fromJson(<String, dynamic>{
      'id': 'u1',
      'name': 'Jane',
      'email': 'j@x.io',
      'firstName': 'Jane',
      'loginCount': 42,
      // Stored as a JSON string so `field()` needs the decode callback to read it.
      'prefs': jsonEncode(<String, dynamic>{'theme': 'dark'}),
    });

    test('returns a typed value', () {
      expect(user.field<String>('firstName'), 'Jane');
      expect(user.field<int>('loginCount'), 42);
    });

    test('returns null for an absent key', () {
      expect(user.field<String>('missing'), isNull);
      expect(user.field<String>('missing') ?? 'fallback', 'fallback');
    });

    test('decodes nested JSON via decode', () {
      final prefs = user.field<Map<String, dynamic>>(
        'prefs',
        decode: (value) => jsonDecode(value as String) as Map<String, dynamic>,
      );
      expect(prefs?['theme'], 'dark');
    });

    test('throws when the value is not assignable to T', () {
      expect(() => user.field<String>('loginCount'), throwsA(isA<ArgumentError>()));
    });
  });

  group('Session.additionalFields', () {
    test('collects unmapped server keys', () {
      final session = Session.fromJson(<String, dynamic>{
        'id': 's1',
        'token': 'tok',
        'expiresAt': '2026-12-31T00:00:00.000Z',
        'userId': 'u1',
        'theme': 'dark',
        'language': 'fr',
      });

      expect(session.userId, 'u1');
      expect(session.additionalFields['theme'], 'dark');
      expect(session.field<String>('language'), 'fr');
    });
  });

  group('signUp.email write path', () {
    test('flat-merges additionalFields as top-level body keys', () async {
      Object? sentBody;
      final dio = Dio(BaseOptions(baseUrl: 'http://test'))
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              sentBody = options.data;
              handler.next(options);
            },
          ),
        )
        ..httpClientAdapter = _SignUpOkAdapter();

      final signUp = SignUpBetterAuth(dio, baseUrl: 'http://test');
      await signUp.email(
        name: 'Jane',
        email: 'a@b.c',
        password: 'pw',
        additionalFields: <String, dynamic>{
          'firstName': 'Jane',
          'lastName': 'Doe',
        },
      );

      // Custom fields must be siblings of name/email/password — never nested —
      // because Better Auth reads them as flat top-level keys.
      expect(sentBody, <String, dynamic>{
        'name': 'Jane',
        'email': 'a@b.c',
        'password': 'pw',
        'firstName': 'Jane',
        'lastName': 'Doe',
      });
    });
  });
}

/// Returns a minimal valid `SignUpResponse` payload so the call completes.
class _SignUpOkAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final body = jsonEncode(<String, dynamic>{
      'token': null,
      'user': <String, dynamic>{'id': '1', 'name': 'n', 'email': 'e@e.e'},
    });
    return ResponseBody.fromString(
      body,
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

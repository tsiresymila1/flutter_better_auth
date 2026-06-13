import 'dart:io';

import 'package:flutter_better_auth/core/api/default/sign_in/sign_in_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'builds the Expo authorization proxy below the Better Auth base URL',
    () {
      final uri = buildBetterAuthOAuthProxyUri(
        baseUrl: 'https://example.com/api/auth',
        authorizationUrl: 'https://provider.example.com/oauth?state=provider',
        oauthState: 'stored-state',
      );

      expect(uri.path, '/api/auth/expo-authorization-proxy');
      expect(
        uri.queryParameters['authorizationURL'],
        'https://provider.example.com/oauth?state=provider',
      );
      expect(uri.queryParameters['oauthState'], 'stored-state');
    },
  );

  test('finds prefixed Better Auth OAuth state cookies', () {
    expect(
      findBetterAuthOAuthState([
        Cookie('better-auth.oauth_state', 'state-value'),
      ]),
      'state-value',
    );
  });

  group('parseOAuthCallback', () {
    test('extracts the session cookie param from the deeplink', () {
      final raw =
          'better-auth.session_token=tok.sig; Path=/; HttpOnly; SameSite=Lax';
      final url =
          'myapp://auth-callback?cookie=${Uri.encodeQueryComponent(raw)}';

      final cb = parseOAuthCallback(url);

      expect(cb.cookie, raw);
      expect(cb.code, isNull);
      expect(cb.allParams.keys, contains('cookie'));
    });

    test('extracts code/state when the server returns the OAuth code', () {
      final cb = parseOAuthCallback(
        'myapp://auth-callback?code=abc123&state=xyz',
      );

      expect(cb.cookie, isNull);
      expect(cb.code, 'abc123');
      expect(cb.state, 'xyz');
    });

    test('surfaces provider errors', () {
      final cb = parseOAuthCallback(
        'myapp://auth-callback?error=access_denied&error_description=nope',
      );

      expect(cb.cookie, isNull);
      expect(cb.code, isNull);
      expect(cb.error, 'access_denied');
    });

    test('falls back to fragment parameters', () {
      final cb = parseOAuthCallback('myapp://auth-callback#code=fragcode');

      expect(cb.code, 'fragcode');
    });

    test('records all params for diagnostics', () {
      final cb = parseOAuthCallback('myapp://auth-callback?foo=1&bar=2');

      expect(cb.allParams.keys, containsAll(['foo', 'bar']));
    });
  });

  group('cookiesFromSetCookieParam', () {
    test('parses a single Set-Cookie value', () {
      final cookies = cookiesFromSetCookieParam(
        'better-auth.session_token=tok.sig; Path=/; HttpOnly; SameSite=Lax',
      );

      expect(cookies, hasLength(1));
      expect(cookies.single.name, 'better-auth.session_token');
      expect(cookies.single.value, 'tok.sig');
    });

    test('splits multiple comma-joined cookies', () {
      final cookies = cookiesFromSetCookieParam(
        'better-auth.session_token=tok.sig; Path=/; HttpOnly, '
        'better-auth.session_data=dat; Path=/; HttpOnly',
      );

      expect(cookies.map((c) => c.name), [
        'better-auth.session_token',
        'better-auth.session_data',
      ]);
    });
  });
}

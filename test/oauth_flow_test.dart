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
}

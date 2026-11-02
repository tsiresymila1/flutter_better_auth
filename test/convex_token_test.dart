import 'dart:convert';

import 'package:flutter_better_auth/core/api/models/result/result.dart';
import 'package:flutter_better_auth/plugins/convex/convex_plugin.dart';
import 'package:flutter_better_auth/plugins/jwt/models/token_response/token_response.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeApi implements ConvexBetterAuth {
  int calls = 0;
  int expInSeconds = 900;

  @override
  Future<Result<JwtTokenResponse>> token() async {
    calls++;
    final exp =
        DateTime.now().millisecondsSinceEpoch ~/ 1000 + expInSeconds;
    final payload = base64Url.encode(utf8.encode(jsonEncode({'exp': exp})));
    return Result.ok(JwtTokenResponse(token: 'h.$payload.s$calls'));
  }

  @override
  dynamic noSuchMethod(Invocation i) => super.noSuchMethod(i);
}

void main() {
  test('caches the token until close to expiry, refetches when forced', () async {
    final api = _FakeApi();
    final p = ConvexTokenProvider(api);
    final a = await p.fetchToken();
    expect(await p.fetchToken(), a);
    expect(api.calls, 1);
    expect(await p.fetchToken(forceRefreshToken: true), isNot(a));
    expect(api.calls, 2);
  });

  test('refetches when the token is within the leeway of expiry', () async {
    final api = _FakeApi()..expInSeconds = 10;
    final p = ConvexTokenProvider(api);
    await p.fetchToken();
    await p.fetchToken();
    expect(api.calls, 2);
  });

  test('concurrent callers share one request', () async {
    final api = _FakeApi();
    final p = ConvexTokenProvider(api);
    await Future.wait([p.fetchToken(), p.fetchToken()]);
    expect(api.calls, 1);
  });
}

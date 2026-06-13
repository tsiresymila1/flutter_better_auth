import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_better_auth/flutter_better_auth.dart';

import 'support/fake_cookie_storage.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await FlutterBetterAuth.initialize(
      url: 'http://localhost/api/auth',
      store: FakeCookieStorage(),
    );
  });

  testWidgets('BetterAuthConsumer receives same client as FlutterBetterAuth',
      (tester) async {
    BetterAuthClient? receivedViaMaybe;
    BetterAuthClient? receivedViaConsumer;
    await tester.pumpWidget(
      BetterAuthProvider(
        child: MaterialApp(
          home: Scaffold(
            body: BetterAuthConsumer(
              builder: (context, client) {
                receivedViaMaybe = BetterAuthInherit.maybeOf(context);
                receivedViaConsumer = client;
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
    expect(receivedViaConsumer, same(FlutterBetterAuth.client));
    expect(receivedViaMaybe, same(receivedViaConsumer));
  });

  testWidgets(
      'BetterAuthInherit.maybeOf is null outside BetterAuthProvider',
      (tester) async {
    BetterAuthClient? client;
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            client = BetterAuthInherit.maybeOf(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(client, isNull);
  });

  testWidgets('BetterAuthConsumer without provider surfaces StateError',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BetterAuthConsumer(
          builder: (context, client) => const SizedBox.shrink(),
        ),
      ),
    );
    expect(tester.takeException(), isA<StateError>());
  });
}

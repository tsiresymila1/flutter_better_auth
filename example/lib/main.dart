import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'harness/session_header.dart';
import 'services/google_auth.dart';
import 'tabs/admin_tab.dart';
import 'tabs/api_key_tab.dart';
import 'tabs/auth_tab.dart';
import 'tabs/email_otp_tab.dart';
import 'tabs/jwt_ott_tab.dart';
import 'tabs/magic_link_tab.dart';
import 'tabs/multi_session_tab.dart';
import 'tabs/organization_tab.dart';
import 'tabs/passkey_tab.dart';
import 'tabs/phone_tab.dart';
import 'tabs/sessions_tab.dart';
import 'tabs/social_tab.dart';
import 'tabs/two_factor_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await FlutterBetterAuth.initialize(
    url: dotenv.env['BETTER_AUTH_URL']!,
    // Required for native social sign-in: sent as `expo-origin` so the
    // Better Auth Expo server recognizes the native flow and appends the
    // session cookie to the `myapp://` callback deeplink. Must match the
    // scheme registered in AndroidManifest.xml / Info.plist and the
    // server's trustedOrigins.
    scheme: 'myapp',
  );
  String? envOrNull(String key) {
    final v = dotenv.env[key];
    return (v == null || v.isEmpty) ? null : v;
  }

  try {
    await GoogleAuthService.init(
      serverClientId: envOrNull('GOOGLE_SERVER_CLIENT_ID'),
      // On web, google_sign_in needs the WEB client id as `clientId`
      // (the web origin must be an "Authorized JavaScript origin" of that
      // client). On native, use the iOS client id (or null).
      clientId: kIsWeb
          ? envOrNull('GOOGLE_SERVER_CLIENT_ID')
          : envOrNull('GOOGLE_IOS_CLIENT_ID'),
    );
  } catch (e) {
    debugPrint('Google sign-in init skipped: $e');
  }
  // Detect an existing session on load (e.g. after returning from a web OAuth
  // redirect).
  unawaited(FlutterBetterAuth.refreshSession());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BetterAuthProvider(
      child: ShadApp(
        title: 'BetterAuth Harness',
        darkTheme: ShadThemeData(
          brightness: Brightness.dark,
          colorScheme: ShadNeutralColorScheme.dark(),
        ),
        theme: ShadThemeData(
          brightness: Brightness.light,
          colorScheme: ShadNeutralColorScheme.light(),
        ),
        themeMode: ThemeMode.dark,
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BetterAuthConsumer(
      builder: (context, client) {
        final tabs = <(String, Widget)>[
          ('Auth', const AuthTab()),
          ('Sessions', const SessionsTab()),
          ('Social', const SocialTab()),
          ('2FA', const TwoFactorTab()),
          ('Admin', const AdminTab()),
          ('Org', const OrganizationTab()),
          ('API Key', const ApiKeyTab()),
          ('Passkey', const PasskeyTab()),
          ('Phone', const PhoneTab()),
          ('Email OTP', const EmailOtpTab()),
          ('Magic Link', const MagicLinkTab()),
          ('Multi-Session', const MultiSessionTab()),
          ('JWT / OTT', const JwtOttTab()),
        ];
        return DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Better Auth Harness'),
              bottom: TabBar(
                isScrollable: true,
                tabs: [for (final tab in tabs) Tab(text: tab.$1)],
              ),
            ),
            body: Column(
              children: [
                SessionHeader(client: client),
                Expanded(
                  child: TabBarView(children: [for (final tab in tabs) tab.$2]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

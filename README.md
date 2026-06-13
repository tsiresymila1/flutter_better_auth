# Dart/Flutter Better Auth

A Dart/Flutter client for [Better Auth](https://www.better-auth.com) — sign-in, sign-up,
social/OAuth, session management, and every first-party plugin (2FA, organizations,
passkeys, API keys, admin, phone, email-OTP, JWT, one-time-token, anonymous).

- Encrypted session storage by default (Keychain/Keystore).
- Reactive auth state (`onAuthChange`) with refresh on app-resume and network-reconnect.
- Typed request/response models for every endpoint, validated against the server's OpenAPI schema.

## Contents

- [Install](#install)
- [Quick start](#quick-start)
- [Server setup](#server-setup)
- [Working with `Result`](#working-with-result)
- [Session & auth state](#session--auth-state)
- [Email & password](#email--password)
- [Username](#username)
- [Anonymous](#anonymous)
- [Social / OAuth](#social--oauth) · [redirect](#redirect-flow-github-etc) · [idToken (Google)](#idtoken-flow-google-native)
- [Phone number](#phone-number)
- [Email OTP](#email-otp)
- [Two-Factor (2FA)](#two-factor-2fa)
- [Passkey (WebAuthn)](#passkey-webauthn)
- [Admin](#admin)
- [API Key](#api-key)
- [Organization](#organization)
- [JWT](#jwt)
- [One-Time Token](#one-time-token)
- [Storage](#storage)
- [Plugin imports](#plugin-imports)
- [Example app](#example-app)

## Install

```sh
flutter pub add flutter_better_auth
```

## Quick start

```dart
import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterBetterAuth.initialize(
    url: 'https://your-server.com/api/auth', // Better Auth base URL
    scheme: 'myapp',                         // deep-link scheme (required for native social)
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BetterAuthProvider(
      child: MaterialApp(home: const HomePage()),
    );
  }
}
```

Access the client anywhere:

```dart
// From the widget tree:
BetterAuthConsumer(
  builder: (context, client) => /* use client */,
);

// Or directly:
final client = FlutterBetterAuth.client;
```

`initialize()` options:

| Param | Default | Purpose |
|-------|---------|---------|
| `url` | — | Better Auth base URL (`…/api/auth`). |
| `scheme` | `null` | Deep-link scheme. **Required for native social sign-in** — sent as `expo-origin`. |
| `store` | secure storage | Custom `StorageInterface` (see [Storage](#storage)). |
| `dio` | new `Dio` | Provide your own `Dio` instance. |
| `refreshSessionOnAppResume` | `true` | Refresh session when the app returns to foreground. |
| `refreshSessionOnReconnect` | `true` | Refresh session when the device regains connectivity. |

## Server setup

Install the matching plugins on your Better Auth server and trust your app's scheme:

```ts
import { betterAuth } from "better-auth";
import { expo } from "@better-auth/expo";

export const auth = betterAuth({
  trustedOrigins: ["myapp://"],         // your app scheme
  plugins: [
    expo(),                              // required for native social sign-in
    // twoFactor(), organization(), admin(), passkey(), jwt(),
    // phoneNumber(), emailOTP(), apiKey(), anonymous(), oneTimeToken(), ...
  ],
  emailAndPassword: { enabled: true },
  socialProviders: { /* google, github, … */ },
});
```

Each Flutter plugin below requires its server-side counterpart to be enabled.

## Working with `Result`

Every call returns `Result<T>` (a sealed type). Use the `data` / `error` getters:

```dart
final result = await client.signIn.email(
  email: 'test@mail.com',
  password: '12345678',
);

if (result.data != null) {
  print(result.data); // typed response (e.g. SignInEmailResponse)
} else {
  print('${result.error?.code}: ${result.error?.message}');
}
```

Or pattern-match:

```dart
switch (result) {
  case Success(:final data): /* … */;
  case Failure(:final error): /* … */;
}
```

## Session & auth state

```dart
final client = FlutterBetterAuth.client;

// Current session (user + session):
final res = await client.getSession();
final user = res.data?.user;

// Reactive auth state — emits User? on sign-in/out, resume, reconnect:
StreamBuilder<User?>(
  stream: client.onAuthChange,
  builder: (context, snap) => Text(snap.data == null ? 'Signed out' : 'Hi ${snap.data!.name}'),
);

// Force a refresh:
await FlutterBetterAuth.refreshSession();

// Sign out:
await client.signOut();

// Sessions management:
await client.listSessions();
await client.revokeSession(token: '<session-token>');
await client.revokeOtherSessions();
await client.revokeSessions();
```

## Email & password

```dart
// Sign up
await client.signUp.email(
  name: 'Test User',
  email: 'test@mail.com',
  password: '12345678',
);

// Sign in
await client.signIn.email(
  email: 'test@mail.com',
  password: '12345678',
  rememberMe: true, // optional (bool)
);

// Update profile
await client.updateUser(name: 'New Name', image: 'https://…/avatar.png');

// Change password
await client.changePassword(
  currentPassword: '12345678',
  newPassword: '87654321',
  revokeOtherSessions: true,
);

// Forgot / reset password
await client.forgotPassword(email: 'test@mail.com');
await client.resetPassword(newPassword: '87654321', token: '<token-from-email>');

// Email verification
await client.sendVerificationEmail(email: 'test@mail.com');
await client.verifyEmail(token: '<token>');

// Change email
await client.changeEmail(newEmail: 'new@mail.com');

// Delete account
await client.deleteUser(password: '12345678');
```

## Username

Requires the `username()` server plugin.

```dart
await client.signIn.username(
  username: 'testuser',
  password: '12345678',
  rememberMe: true,
);
```

## Anonymous

Requires the `anonymous()` server plugin.

```dart
import 'package:flutter_better_auth/plugins/anonymous/anonymous_plugin.dart';

// Sign in anonymously (available without the extra import):
await client.signIn.anonymous();

// Delete the anonymous user (needs the import above):
await client.anonymous.deleteAnonymousUser();
```

Linking an anonymous account to a later sign-in (`onLinkAccount`) is configured on the server.

## Social / OAuth

Two flows: **redirect** (opens a browser, e.g. GitHub) and **idToken** (native, e.g. Google).
Both require the server `expo()` plugin and your scheme in `trustedOrigins`.

### Redirect flow (GitHub, etc.)

```dart
await client.signIn.social(
  provider: 'github',
  callbackUrlScheme: 'myapp', // your deep-link scheme
  scopes: ['read:user'],      // optional (List<String>)
);
```

The client opens `/expo-authorization-proxy`, runs the OAuth round-trip in a secure web view,
and persists the session cookie returned via the `myapp://` deep link.

**Android** — register the callback activity in `android/app/src/main/AndroidManifest.xml`:

```xml
<activity
  android:name="com.linusu.flutter_web_auth_2.CallbackActivity"
  android:exported="true"
  android:taskAffinity="">
  <intent-filter android:label="flutter_web_auth_2">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="myapp" />
  </intent-filter>
</activity>
```

### idToken flow (Google native)

Use [`google_sign_in`](https://pub.dev/packages/google_sign_in) to obtain an ID token, then:

```dart
import 'package:google_sign_in/google_sign_in.dart';

await GoogleSignIn.instance.initialize(
  serverClientId: '<google-WEB-oauth-client-id>', // must match server's google clientId
);
final account = await GoogleSignIn.instance.authenticate();
final idToken = account.authentication.idToken!;

await client.signIn.social(
  provider: 'google',
  idToken: SocialIdTokenBody(token: idToken),
);
```

Google Cloud setup (same project as the web client):
- **Web** OAuth client → use its id as `serverClientId` **and** the server's `socialProviders.google.clientId`.
- **Android** OAuth client → your app package + signing SHA-1 (no API exists to create this; do it in the console/Firebase).
- **iOS** OAuth client → put its reversed id as a `CFBundleURLTypes` scheme in `Info.plist`.
- Configure the **OAuth consent screen** (a fresh project without one throws "Developer console is not set up correctly").

### Account linking

```dart
await client.social.link(provider: 'github', callbackURL: 'myapp://', scopes: ['repo']);
await client.social.unlink(providerId: 'github');
await client.social.listAccounts();
await client.social.refreshToken(providerId: 'google');
await client.social.getAccessToken(providerId: 'google');
```

## Phone number

Requires the `phoneNumber()` server plugin.

```dart
import 'package:flutter_better_auth/plugins/phone/phone_plugin.dart';

await client.phone.sendOtp(body: PhoneBody(phoneNumber: '+15555550123'));
await client.phone.verify(body: VerifyPhoneBody(phoneNumber: '+15555550123', code: '123456'));
await client.phone.signIn(body: SignInPhoneBody(phoneNumber: '+15555550123', password: '12345678'));

// Password reset by phone
await client.phone.requestPasswordResetOTP(body: PhoneBody(phoneNumber: '+15555550123'));
await client.phone.restPassword(
  body: ResetPhonePasswordBody(otp: '123456', phoneNumber: '+15555550123', newPassword: '87654321'),
);
```

## Email OTP

Requires the `emailOTP()` server plugin.

```dart
import 'package:flutter_better_auth/plugins/email_otp/email_otp_plugin.dart';

await client.emailOtp.sendVerification(email: 'test@mail.com', type: 'sign-in');
await client.emailOtp.signIn(email: 'test@mail.com', otp: '123456');
await client.emailOtp.verifyEmail(email: 'test@mail.com', otp: '123456');

// Password reset by OTP
await client.emailOtp.forgotPassword(email: 'test@mail.com');
await client.emailOtp.resetPassword(email: 'test@mail.com', otp: '123456', password: '87654321');
```

`type` is one of `'sign-in'`, `'email-verification'`, `'forget-password'`.

## Two-Factor (2FA)

Requires the `twoFactor()` server plugin.

```dart
import 'package:flutter_better_auth/plugins/two_factor/two_factor_plugin.dart';

// Enrollment
await client.twoFactor.enable(password: '12345678');     // returns TOTP secret/URI + backup codes
await client.twoFactor.getTotpUri(password: '12345678');  // for the QR code
await client.twoFactor.disable(password: '12345678');

// Verify (during sign-in challenge)
await client.twoFactor.verifyTotp(code: '123456', trustDevice: true);
await client.twoFactor.sendOtp();                          // OTP via email/SMS
await client.twoFactor.verifyOtp(code: '123456');
await client.twoFactor.verifyBackupCode(code: 'abcd-efgh');

// Backup codes
await client.twoFactor.generateBackupCodes(password: '12345678');
await client.twoFactor.viewBackupCodes(userId: '<user-id>');
```

## Passkey (WebAuthn)

Requires the `@better-auth/passkey` server plugin. This client exposes the **HTTP** surface only —
the actual credential ceremony (FIDO2/WebAuthn) is done by an app-side package such as
[`passkeys`](https://pub.dev/packages/passkeys).

```dart
import 'package:flutter_better_auth/plugins/passkey/passkey_plugin.dart';

// 1. Get options from the server
final opts = await client.passkey.generateRegistrationOptions(/* … */);
// 2. Run the device ceremony with your WebAuthn package → credential JSON
// 3. Send it back
await client.passkey.verifyRegistration(/* body: { response, name } */);

// Sign-in
await client.passkey.generateAuthenticationOptions();
await client.passkey.verifyAuthentication(/* body: { response } */);

// Manage
await client.passkey.listUserPasskeys();
await client.passkey.updatePasskey(id: '<id>', name: 'My phone');
await client.passkey.deletePasskey(id: '<id>');
```

## Admin

Requires the `admin()` server plugin and an admin session.

```dart
import 'package:flutter_better_auth/plugins/admin/admin_plugin.dart';

await client.admin.listUsers(limit: 20, offset: 0, searchValue: 'john');
await client.admin.getUser(id: '<user-id>');
await client.admin.createUser(email: 'new@mail.com', password: '12345678', name: 'New', role: 'user');
await client.admin.setRole(userId: '<id>', role: 'admin');

await client.admin.banUser(userId: '<id>', banReason: 'spam', banExpiresIn: 86400);
await client.admin.unbanUser(userId: '<id>');

await client.admin.listUserSessions(userId: '<id>');
await client.admin.revokeUserSessions(userId: '<id>');

await client.admin.impersonateUser(userId: '<id>');
await client.admin.stopImpersonating();
await client.admin.removeUser(userId: '<id>');
```

## API Key

Requires the `apiKey()` server plugin.

```dart
import 'package:flutter_better_auth/plugins/api_key/api_key_plugin.dart';

final created = await client.apiKey.create(name: 'my-key', expiresIn: 3600);
await client.apiKey.list();
await client.apiKey.fetch(id: '<key-id>');
await client.apiKey.update(keyId: '<key-id>', enabled: false);
await client.apiKey.verify(key: '<plaintext-key>');
await client.apiKey.delete(keyId: '<key-id>');
await client.apiKey.deleteAllExpired();
```

## Organization

Requires the `organization()` server plugin.

```dart
import 'package:flutter_better_auth/plugins/organization/organization_plugin.dart';

await client.organization.checkSlug(slug: 'acme');
await client.organization.create(name: 'Acme', slug: 'acme');
await client.organization.listOrganizations();
await client.organization.getFullOrganization(organizationId: '<org-id>');
await client.organization.leave(organizationId: '<org-id>');

// Members & invitations
await client.organization.listMembers(limit: 20);
await client.organization.inviteMember(email: 'member@mail.com', role: 'member', organizationId: '<org-id>');
```

`getSession()` populates `session.activeOrganizationId` once an active org is set on the server,
and `session.activeTeamId` when teams are enabled.

For server-side **additional schema fields**, use the `*Raw` variants with a JSON map:
`createRaw(...)`, `inviteMemberRaw(...)`, `addMemberRaw(...)`, and `listMembersRaw({...})`
for non-string list-member filters.

## JWT

Requires the `jwt()` server plugin.

```dart
import 'package:flutter_better_auth/plugins/jwt/jwt_plugin.dart';

final token = await client.jwt.token();  // signed JWT for the current session
final jwks = await client.jwt.jwks();     // public JWKS
```

## One-Time Token

Requires the `oneTimeToken()` server plugin.

```dart
import 'package:flutter_better_auth/plugins/one_time_token/one_time_token_plugin.dart';

final generated = await client.oneTimeToken.generate();    // GET /one-time-token/generate
final session = await client.oneTimeToken.verify(token: '<token>'); // POST /one-time-token/verify
```

## Storage

By default, session cookies are stored **encrypted** on native platforms
(`flutter_secure_storage`, chunked for the iOS Keychain). To customize, pass a `StorageInterface`:

```dart
// Built-in unencrypted Hive store (opt-in):
import 'package:flutter_better_auth/flutter_better_auth.dart';

await HiveStorage.init(); // opens the Hive box first
await FlutterBetterAuth.initialize(
  url: '…',
  store: HiveStorage(), // or your own StorageInterface implementation
);
```

A custom store implements:

```dart
abstract class StorageInterface {
  Future<void> saveCookies(String host, List<Cookie> cookies);
  Future<List<Cookie>> loadCookies(String host);
}
```

## Plugin imports

The default import gives you `signIn`, `signUp`, `social`, sessions, and account methods.
Each plugin getter needs its file imported:

```dart
import 'package:flutter_better_auth/plugins/admin/admin_plugin.dart';            // client.admin
import 'package:flutter_better_auth/plugins/anonymous/anonymous_plugin.dart';    // client.anonymous
import 'package:flutter_better_auth/plugins/phone/phone_plugin.dart';            // client.phone
import 'package:flutter_better_auth/plugins/email_otp/email_otp_plugin.dart';    // client.emailOtp
import 'package:flutter_better_auth/plugins/jwt/jwt_plugin.dart';                // client.jwt
import 'package:flutter_better_auth/plugins/api_key/api_key_plugin.dart';        // client.apiKey
import 'package:flutter_better_auth/plugins/two_factor/two_factor_plugin.dart';  // client.twoFactor
import 'package:flutter_better_auth/plugins/organization/organization_plugin.dart'; // client.organization
import 'package:flutter_better_auth/plugins/passkey/passkey_plugin.dart';        // client.passkey
import 'package:flutter_better_auth/plugins/one_time_token/one_time_token_plugin.dart'; // client.oneTimeToken
```

## Example app

The [`example/`](example) directory is a tabbed **test harness** that exercises every plugin
with live output, plus a Next.js Better Auth server under [`web/`](web). See
[`example/README.md`](example/README.md) for setup (including Google native sign-in).

## Author

[Tsiresy Milà](https://tsiresymila.vercel.app)

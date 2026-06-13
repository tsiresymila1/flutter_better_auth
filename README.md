# Dart/Flutter BetterAuth

A Dart/Flutter client for interacting with the Better Auth authentication API, enabling seamless
integration of secure sign-in, sign-up, and user session management features
with [Better-Auth](https://www.better-auth.com).

## Getting Started

Add `flutter_better_auth` to your project dependencies:

```sh
flutter pub add flutter_better_auth
```

Or manually add it to your `pubspec.yaml`:

```yaml
dependencies:
   flutter_better_auth: <latest_version>
```

## Features

- ✅ Default API support
- ✅ Social authentication
- ✅ Email authentication
- ✅ Phone number authentication
- ✅ Username authentication
- ✅ Anonymous authentication — [`sign-in/anonymous`](https://www.better-auth.com/docs/plugins/anonymous) and [`delete-anonymous-user`](https://www.better-auth.com/docs/plugins/anonymous); see **Anonymous authentication** below
- ✅ Admin
- ✅ Email OTP
- ✅ JWT
- ✅ Two-Factor Authentication
- ✅ API Key
- ✅ Organization
- ✅ One-time-token
- ✅ Passkey — [`@better-auth/passkey`](https://www.better-auth.com/docs/plugins/passkey); see **Passkey** below

## Usage

Import the package in your `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await FlutterBetterAuth.initialize(
      url: 'api_url',
      scheme: 'myapp',
   );
   runApp(const MyApp());
}
```

### Native social authentication

Native OAuth follows the same authorization-proxy flow as Better Auth's
official Expo client. Configure the Expo server plugin and trust your app's
deep-link origin:

```ts
import { expo } from "@better-auth/expo";

export const auth = betterAuth({
  trustedOrigins: ["myapp://"],
  plugins: [expo()],
});
```

Pass the matching scheme to the Flutter client:

```dart
await FlutterBetterAuth.initialize(
  url: 'https://example.com/api/auth',
  scheme: 'myapp',
);
```

The client sends `expo-origin`, opens `/expo-authorization-proxy`, forwards the
stored OAuth state, and persists the session cookies returned through the deep
link callback.

Wrap your `MaterialApp` with `BetterAuthProvider`:

```dart
class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
      return BetterAuthProvider(
         child: MaterialApp(
            title: 'BetterAuth',
            theme: ThemeData(
               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: const MyHomePage(title: 'Better Auth'),
         ),
      );
   }
}
```

Access BetterAuth client using `BetterAuthConsumer`:

```dart
BetterAuthConsumer(
  builder: (context, client) {
    return Widget();
  }
)
```

Or directly via:

```dart
final client = FlutterBetterAuth.client;
```

### Anonymous authentication

Enable the **[`anonymous`](https://www.better-auth.com/docs/plugins/anonymous)** plugin on the server. This package exposes:

| Action | Dart API |
|--------|----------|
| Sign in anonymously | `await client.signIn.anonymous()` — available from the default import (`flutter_better_auth.dart`); **`POST /sign-in/anonymous`**. |
| Delete anonymous user | Import **`plugins/anonymous/anonymous_plugin.dart`**, then `await client.anonymous.deleteAnonymousUser()` — **`POST /delete-anonymous-user`** (requires an anonymous session; can be disabled on the server with `disableDeleteAnonymousUser`). |

Linking an anonymous account when signing in another way (`onLinkAccount`) is configured only on the server.

### Passkey

Install [`@better-auth/passkey`](https://www.better-auth.com/docs/plugins/passkey) on the server. Import **`plugins/passkey/passkey_plugin.dart`** for **`client.passkey`**.

This matches the official client’s **two-step** WebAuthn flow (see [`packages/passkey/src/client.ts`](https://github.com/better-auth/better-auth/blob/main/packages/passkey/src/client.ts)):

| Step | Method | HTTP |
|------|--------|------|
| Registration options | `client.passkey.generateRegistrationOptions(...)` | `GET /passkey/generate-register-options` |
| Verify registration | `client.passkey.verifyRegistration(body)` | `POST /passkey/verify-registration` — `body` includes `response` (registration JSON) and optional `name` |
| Authentication options | `client.passkey.generateAuthenticationOptions()` | `GET /passkey/generate-authenticate-options` |
| Verify sign-in | `client.passkey.verifyAuthentication(body)` | `POST /passkey/verify-authentication` — `body` includes `response` (authentication JSON); sets session |
| List | `client.passkey.listUserPasskeys()` | `GET /passkey/list-user-passkeys` |
| Delete | `client.passkey.deletePasskey(id: ...)` | `POST /passkey/delete-passkey` |
| Rename | `client.passkey.updatePasskey(id: ..., name: ...)` | `POST /passkey/update-passkey` |

#### Pub / WebAuthn dependencies

- **`flutter_better_auth`:** passkey support is **HTTP-only** on top of [Dio](https://pub.dev/packages/dio) (already pulled in). This package’s **`pubspec.yaml`** does **not** list a WebAuthn plugin on purpose, so consumers who never use passkeys avoid extra native/binary weight.

- **Your application:** completing registration or sign-in still needs a **credential ceremony** on the device (FIDO2 / WebAuthn). Add a WebAuthn-capable dependency **in your app’s `pubspec.yaml`**, for example **[`passkeys`](https://pub.dev/packages/passkeys)** on mobile—or use **`web`** / **`dart:js_interop`** and the browser’s **`navigator.credentials`** on web—or another approach you prefer. Translate the credential result into JSON and pass it as `response` inside the maps for `verifyRegistration` / `verifyAuthentication`.

Ensure your Dio client sends a correct **`Origin`** (and cookies if you rely on cookie sessions) so [SimpleWebAuthn verification](https://www.better-auth.com/docs/plugins/passkey) on the server matches your RP settings.

## Using plugins

To use available plugin, you can import them like:

```dart
import 'package:flutter_better_auth/plugins/admin/admin_plugin.dart';
import 'package:flutter_better_auth/plugins/anonymous/anonymous_plugin.dart';
import 'package:flutter_better_auth/plugins/phone/phone_plugin.dart';
import 'package:flutter_better_auth/plugins/email_otp/email_otp_plugin.dart';
import 'package:flutter_better_auth/plugins/jwt/jwt_plugin.dart';
import 'package:flutter_better_auth/plugins/api_key/api_key_plugin.dart';
import 'package:flutter_better_auth/plugins/two_factor/two_factor_plugin.dart';
import 'package:flutter_better_auth/plugins/organization/organization_plugin.dart';
import 'package:flutter_better_auth/plugins/passkey/passkey_plugin.dart';
import 'package:flutter_better_auth/plugins/one_time_token/one_time_token_plugin.dart';
```

And now, it will be available in client. For example:

```dart
client.phone // to access phone plugin 
client.admin // to access admin plugin 
client.anonymous // [`delete-anonymous-user`](https://www.better-auth.com/docs/plugins/anonymous) — anonymous sign-in: `client.signIn.anonymous()`
client.emailOtp // to access email_otp plugin
client.jwt // to access jwt plugin
client.twoFactor // to access Two-Factor (TOTP, OTP, backup codes)
client.apiKey // to access API Key plugin (create, verify, list, …)
client.organization // organizations, members, invites, teams, dynamic roles, hasPermission
client.passkey // WebAuthn: generate/verify registration & authentication, list, delete, update — see **Passkey** above
client.oneTimeToken // Better Auth [`one-time-token`](https://www.better-auth.com/docs/plugins/one-time-token): generate / verify
```

`getSession()` populates **`session.activeOrganizationId`** after you set an active org on the server, and **`session.activeTeamId`** when the organization plugin has **teams** enabled.

Typed helpers such as **`client.organization.create`**, **`client.organization.inviteMember`**, and **`client.organization.addMember`** expose the usual body fields only. If you added **`schema.organization`**, **`schema.invitation`**, or **`schema.member`** additional fields on the server, use **`client.organization.createRaw(...)`**, **`client.organization.inviteMemberRaw(...)`**, or **`client.organization.addMemberRaw(...)`** with a JSON map matching that schema. For **`list-members`** filters whose **`filterValue`** is not a string (arrays, booleans, numbers), pass the full query map with **`client.organization.listMembersRaw({...})`**.

## Full Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await FlutterBetterAuth.initialize(
      url: 'your_base_url/api/auth',
      scheme: 'myapp',
   );
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
   Widget build(BuildContext context) {
      return BetterAuthProvider(
         child: MaterialApp(
            title: 'BetterAuth',
            theme: ThemeData(
               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: const MyHomePage(title: 'Better Auth'),
         ),
      );
   }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key, required this.title});

   final String title;

   @override
   State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
         ),
         body: BetterAuthConsumer(
            builder: (context, client) {
               return Center(
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     spacing: 8,
                     children: <Widget>[
                        FilledButton(
                           onPressed: () async {
                              final result = await client.signIn.email(
                                 email: "test@mail.com",
                                 password: "123456788",
                              );
                              if (result.data != null) {
                                 debugPrint(result.data.toString());
                              } else {
                                 debugPrint(result.error?.message);
                              }
                           },
                           child: Text("Sign-in"),
                        ),

                        FilledButton(
                           onPressed: () async {
                              final result = await client.getSession();
                              if (result.data != null) {
                                 debugPrint(result.data.toString());
                              } else {
                                 debugPrint(result.error?.message);
                              }
                           },
                           child: Text("GetSession"),
                        ),
                        FilledButton(
                           onPressed: () {
                              client.signOut();
                           },
                           child: Text("SignOut"),
                        ),
                        FilledButton(
                           onPressed: () async {
                              await client.signIn.social(
                                 provider: 'github',
                                 disableRedirect: true,
                                 callbackURL: "/auth-callback",
                                 callbackUrlScheme: "myapp",
                              );
                           },
                           child: Text("Github"),
                        ),

                        FilledButton(
                           onPressed: () async {
                              final result = await client.signUp.email(
                                 name: "test",
                                 email: "test@mail.com",
                                 password: "123456788",
                              );
                              if (result.data != null) {
                                 debugPrint(result.data.toString());
                              } else {
                                 debugPrint(result.error?.message);
                              }
                           },
                           child: Text("SignUp"),
                        ),
                     ],
                  ),
               );
            },
         ),
      );
   }
}

```

## Social Authentication

For social authentication, it is currently recommended to use `idToken`.

If the social provider does not support `idToken`, follow these steps:

1. **Add the dependency:**

   Add `flutter_web_auth_2: ^5.0.0-alpha.3` (or newer) to your `pubspec.yaml` dependencies.

2. **Update your AndroidManifest.xml:**

   Insert the following into your `AndroidManifest.xml`, replacing `YOUR_CALLBACK_URL_SCHEME_HERE` with your actual callback URL scheme:

```xml
<manifest>
   <application>
      ...
      <activity
              android:name="com.linusu.flutter_web_auth_2.CallbackActivity"
              android:exported="true"
              android:taskAffinity="">
         <intent-filter android:label="flutter_web_auth_2">
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.DEFAULT" />
            <category android:name="android.intent.category.BROWSABLE" />
            <data android:scheme="YOUR_CALLBACK_URL_SCHEME_HERE" />
         </intent-filter>
      </activity>
      ...
   </application>
</manifest>
```

1. **Configure your Better Auth server plugin:**

   Add `expo()` from `@better-auth/expo` to your Better Auth server plugin.

2. **Add your callback scheme to trustedOrigins:**

   In your Better Auth configuration, ensure that `YOUR_CALLBACK_URL_SCHEME_HERE://` is included in the `trustedOrigins` list.

```ts
export const auth = betterAuth({
   trustedOrigins: ["YOUR_CALLBACK_URL_SCHEME_HERE://"]
})
```

## Testing

This package is still under development and not fully tested. Use with caution.

## Author

[Tsiresy Milà](https://tsiresymila.vercel.app)

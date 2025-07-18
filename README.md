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
- ✅ Anonymous authentication
- ✅ Admin
- ✅ Email OTP
- ✅ JWT
- ⬜ Two-Factor Authentication
- ⬜ API Key
- ⬜ Organization
- ⬜ One-time-token

## Usage

Import the package in your `main.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await FlutterBetterAuth.initialize(url: 'api_url');
   runApp(const MyApp());
}
```

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

## Using plugins

To use available plugin, you can import them like:

```dart
import 'package:flutter_better_auth/plugins/admin/admin_plugin.dart';
import 'package:flutter_better_auth/plugins/phone/phone_plugin.dart';
import 'package:flutter_better_auth/plugins/email_otp/email_otp_plugin.dart';
import 'package:flutter_better_auth/plugins/jwt/jwt_plugin.dart';
```

And now, it will be available in client. For example:

```dart
client.phone // to access phone plugin 
client.admin // to access admin plugin 
client.emailOtp // to access email_otp plugin
client.jwt // to access jwt plugin
```

## Full Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await FlutterBetterAuth.initialize(
      url: 'your_base_url/api/auth',
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

3. **Configure your Better Auth server plugin:**

   Add `expo()` from `@better-auth/expo` to your Better Auth server plugin.

4. **Add your callback scheme to trustedOrigins:**

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

# Changelog

### 0.3.0

**Breaking**

- `client.phone` methods now take flat named parameters (`@BodyExtra`) instead of body objects, matching every other plugin:
    - `signIn(phoneNumber:, password:, rememberMe:)` — was `signIn(body: SignInPhoneBody(...))`.
    - `sendOtp(phoneNumber:)`, `requestPasswordResetOTP(phoneNumber:)` — was `(body: PhoneBody(...))`.
    - `verify(phoneNumber:, code:, disableSession:, updatePhoneNumber:)` — was `(body: VerifyPhoneBody(...))`; `disableSession` is now `bool?`.
    - `restPassword(otp:, phoneNumber:, newPassword:)` — was `(body: ResetPhonePasswordBody(...))`.
- Removed the now-unused body models and the `SignInPhoneBody` export.

### 0.2.0

**Breaking**

- Request param types corrected against the Better Auth OpenAPI schema:
    - `signIn.email` / `signIn.username` — `rememberMe` is now `bool?` (was `String?`).
    - `signIn.social` — `scopes` is now `List<String>?` (was `String?`), `requestSignUp` is now `bool?` (was `String?`).
    - `social.link` — `scopes` is now `List<String>?` (was `String?`).
- `SocialAccountResponse` — field renamed `provider` → `providerId` (the server returns `providerId`); added `accountId`, `userId`, `scopes`. Fixes `type 'Null' is not a subtype of type 'String'` on `social.listAccounts()`.

**Fixed**

- Bodyless `POST` requests now send an empty JSON object `{}` instead of an empty body, fixing server `SyntaxError: Unexpected end of JSON input` (e.g. `signIn.anonymous()`, `signOut()`, `revokeSessions()`).
- `Invitation.role` is now nullable to match the schema (server may omit it).
- Hardened native OAuth callback parsing (`parseOAuthCallback`): reads query **and** URL-fragment params, surfaces provider `error`, and logs the raw callback for debugging.

**Added**

- **Secure cookie storage by default** on native platforms (`flutter_secure_storage`): session cookies are encrypted at rest and chunked to stay under the iOS Keychain item-size limit. `HiveStorage` remains available as an opt-in (`store:`), and you can supply any `StorageInterface`.
- **`refreshSessionOnReconnect`** (default `true`): refreshes the session stream when the device regains connectivity (offline → online), mirroring the Expo online-manager. Pairs with the existing `refreshSessionOnAppResume`.
- `BetterAuthClient` is now exported from the package barrel (`package:flutter_better_auth/flutter_better_auth.dart`).

**Removed**

- The redundant `flutter-origin` request header (the Better Auth Expo server only reads `expo-origin`).

### 0.1.6

- Add [**One-Time Token**](https://www.better-auth.com/docs/plugins/one-time-token) plugin (`client.oneTimeToken`): `GET /one-time-token/generate`, `POST /one-time-token/verify`.
- Add [**Anonymous**](https://www.better-auth.com/docs/plugins/anonymous) plugin: `client.anonymous.deleteAnonymousUser()` (`POST /delete-anonymous-user`). Anonymous sign-in stays on `client.signIn.anonymous()` (`POST /sign-in/anonymous`).
- Add [**Passkey**](https://www.better-auth.com/docs/plugins/passkey) plugin (`client.passkey`): full HTTP surface for [`@better-auth/passkey`](https://www.better-auth.com/docs/plugins/passkey) (generate/verify registration & authentication, list, delete, update). WebAuthn UI is left to the app (e.g. [`passkeys`](https://pub.dev/packages/passkeys)).
- Add [**Organization**](https://www.better-auth.com/docs/plugins/organization) plugin (`client.organization`): Retrofit surface for org/members/invites/teams/roles/**`has-permission`**; **`set-active` / `set-active-team`** via Dio with JSON **`null`** preserved (**`RemoveNullsInterceptor`**); **`listMembersRaw`** for list-members query parity.
- Add [**API Key**](https://www.better-auth.com/docs/plugins/api-key) plugin (`client.apiKey`).
- Add [**Two-Factor**](https://www.better-auth.com/docs/plugins/two-factor) plugin (`client.twoFactor`).
- **Session**: `Session.activeTeamId` where teams apply; regenerated client **`.g.dart`** where needed.
- **Widgets**: `BetterAuthInherit.maybeOf`; **`StateError`** when `BetterAuthConsumer` is used outside **`BetterAuthProvider`**.
- README updates (anonymous / passkey / org), **`SignInEmailResponse`** and model tests, example app updates.

### 0.1.2

- Remove log.
- Add condition for social auth on web

### 0.1.1

- Remove log.

### 0.1.0

- Add `flutter_auth_web_2` for social auth.

### 0.0.9

- Fix body serialization

### 0.0.8

- Break changes: We change use name parameter with BodyExtra instead of Class.
    - Before:
  ```dart
  final result = await client.signIn.email(
    body: SignInEmailBody(
      email: "test@mail.com",
      password: "12345678",
    ),
  )
  ```
    - After
  ```dart
  final result = await client.signIn.email(
    email: "test@mail.com",
    password: "12345678",
  );
  ```

### 0.0.7

- Fix: update api response types to use correct models
  from [Karuppusamy](https://github.com/karuppusamy-d)

### 0.0.6

- Add JWT support

### 0.0.5

- Update readme for plugin example

### 0.0.4

- Add Email OTP
- Add plugin example in readme

### 0.0.3

- Refactoring
- Add github example
  from [Karuppusamy](https://github.com/karuppusamy-d)

### 0.0.2

- Update readme
- Add admin plugin

### 0.0.1

- Initial release with support for:
    - Default API authentication
    - Social authentication
    - Email, phone number, and username authentication
    - Anonymous authentication

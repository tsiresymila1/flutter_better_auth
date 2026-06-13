# flutter_better_auth — example harness

A tabbed test harness that exercises every plugin the Flutter client exposes
against a Better Auth server.

## Layout

- **Persistent header** — live auth state (driven by `client.onAuthChange`), a
  `refreshSession()` button, current user id/email/role.
- **One tab per plugin**, each with input fields, action buttons, and an output
  console showing the last `Result` (data on success, `[code] message` on error).

| Tab | Covers |
|-----|--------|
| Auth | sign-up, sign-in (email/username/anonymous), session, update user, change/forgot/reset password, verify email, delete user |
| Sessions | list / revoke / revoke-others / revoke-all |
| Social | GitHub (redirect), **Google (native idToken)**, link/unlink, list accounts, refresh/access token |
| 2FA | enable/disable, TOTP URI, verify TOTP/OTP/backup, backup codes |
| Admin | list/get/create users, set role, ban/unban, sessions, impersonate, remove |
| Org | check slug, create/list/get/leave, members, invite |
| API Key | create/list/fetch/update/verify/delete/delete-expired |
| Passkey | options / list / update / delete (**partial — see note**) |
| Phone | sign-in, send/verify OTP, password reset |
| Email OTP | send, verify, sign-in, forgot/reset password |
| JWT / OTT | token, JWKS / generate, verify |

## Run

1. Copy `.env.example` to `.env` and fill it in:
   ```
   BETTER_AUTH_URL=https://<host>/api/auth
   GOOGLE_SERVER_CLIENT_ID=<google web oauth client id>   # for Google native sign-in
   GOOGLE_IOS_CLIENT_ID=<google ios oauth client id>      # iOS only
   ```
2. `flutter pub get`
3. `flutter run`

The server must run the Better Auth Expo plugin and trust the app scheme:
```ts
betterAuth({ plugins: [ ...expo() ], trustedOrigins: ["myapp://"] })
```
The app initializes with `scheme: 'myapp'` — this must match the scheme
registered in `AndroidManifest.xml` / `Info.plist` and the server `trustedOrigins`.

## Google native sign-in (idToken) setup

Native Google sign-in uses `google_sign_in` to get an ID token, then calls
`signIn.social(provider: 'google', idToken: ...)`. You must configure Google
Cloud OAuth clients:

1. **Google Cloud Console → Credentials**, create OAuth client IDs:
   - **Web** client — its id goes in `GOOGLE_SERVER_CLIENT_ID` **and** in the
     Better Auth server's `socialProviders.google.clientId`. The ID token
     audience is validated against this.
   - **iOS** client — its id goes in `GOOGLE_IOS_CLIENT_ID`.
   - **Android** client — register your app's **SHA-1** signing certificate.

2. **iOS** — add the reversed iOS client id as a URL scheme in
   `ios/Runner/Info.plist`:
   ```xml
   <key>CFBundleURLTypes</key>
   <array>
     <dict>
       <key>CFBundleURLSchemes</key>
       <array>
         <string>com.googleusercontent.apps.XXXXXXXX-XXXXXXXX</string>
       </array>
     </dict>
   </array>
   ```

3. **Android** — no extra manifest entry for Google; just the SHA-1 registered
   above. (The `myapp` scheme `CallbackActivity` is already present for the
   GitHub redirect flow.)

## Notes

- **Passkey is partial.** Real WebAuthn credential creation needs a native
  platform-authenticator package; the client only exposes the option/list/
  update/delete endpoints, which is what this tab calls.
- Plugins that send codes/links (Email OTP, Phone, magic link) print them to the
  **server console** in this example's server config — read them there.
- `.env` is gitignored. Never commit OAuth secrets.

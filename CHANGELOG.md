## Changelog

### 0.0.1

- Initial release with support for:
    - Default API authentication
    - Social authentication
    - Email, phone number, and username authentication
    - Anonymous authentication

### 0.0.2

- Update readme
- Add admin plugin

### 0.0.3

- Refactoring
- Add github example

### 0.0.4

- Add Email OTP
- Add plugin example in readme

### 0.0.5

- Update readme for plugin example

### 0.0.6

- Add JWT support

### 0.0.7

- Fix: update api response types to use correct models
  from [Karuppusamy](https://github.com/karuppusamy-d)

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

### 0.0.9

- Fix body serialization

### 0.1.0

- Add `flutter_auth_web_2` for social auth.

### 0.1.1

- Remove log.

### 0.1.2

- Remove log.
- Add condition for social auth on web

### Upcoming

- Two-Factor Authentication
- PassKey
- One-Tap
- API Key and Organization support
- One-time-token support
- Etc ...
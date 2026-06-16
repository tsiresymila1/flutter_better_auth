import 'package:web/web.dart' as web;

/// Web: navigate the whole page to [url] (the OAuth provider). Better Auth
/// redirects back to the configured `callbackURL` afterwards.
void redirectToUrl(String url) {
  web.window.location.href = url;
}

String? currentOrigin() => web.window.location.origin;

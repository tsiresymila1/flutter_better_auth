import 'web_redirect_io.dart'
    if (dart.library.js_interop) 'web_redirect_web.dart' as impl;

/// Full-page browser redirect (web only; no-op on native).
void redirectToUrl(String url) => impl.redirectToUrl(url);

/// The current web app origin (e.g. `http://localhost:5000`), or null on native.
String? currentOrigin() => impl.currentOrigin();

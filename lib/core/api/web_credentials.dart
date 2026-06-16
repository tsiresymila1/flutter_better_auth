import 'package:dio/dio.dart';

import 'web_credentials_io.dart'
    if (dart.library.js_interop) 'web_credentials_web.dart' as impl;

/// On web, makes the browser attach/store cookies for cross-origin credentialed
/// requests (`withCredentials = true`). No-op on native platforms, where the
/// cookie jar handles persistence instead.
void enableWebCredentials(Dio dio) => impl.enableWebCredentials(dio);

import 'package:dio/dio.dart';

class RemoveNullsInterceptor extends Interceptor {
  /// Better Auth expects JSON `null` for some organization bodies (clear active org/team).
  bool _preserveNullKeysForOrganizationBody(String urlPath) {
    return urlPath.contains('/organization/set-active-team') ||
        urlPath.endsWith('/organization/set-active');
  }

  /// Some servers (e.g. Convex) return dates as epoch milliseconds; the models
  /// parse ISO strings. Rewrite epoch-ms numbers on date-like keys to ISO.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    response.data = epochDatesToIso(response.data);
    handler.next(response);
  }

  static const _bodyMethods = {'POST', 'PUT', 'PATCH'};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final data = options.data;

    // Better Auth parses the JSON body even for bodyless POSTs. With the
    // global `application/json` content type, an empty body makes the server
    // run `JSON.parse('')`, which throws "Unexpected end of JSON input". Send
    // an empty object so the body is valid JSON.
    if (data == null && _bodyMethods.contains(options.method.toUpperCase())) {
      options.data = <String, dynamic>{};
      super.onRequest(options, handler);
      return;
    }

    if (data != null &&
        !_preserveNullKeysForOrganizationBody(options.uri.path)) {
      if (_canCallToJson(data)) {
        final json = (data as dynamic).toJson();
        options.data = _removeNullsFromMap(json);
      } else if (data is Map<String, dynamic>) {
        options.data = _removeNullsFromMap(data);
      }
    }
    super.onRequest(options, handler);
  }

  Map<String, dynamic> _removeNullsFromMap(Map<String, dynamic> map) {
    return Map.fromEntries(
      map.entries
          .where((entry) {
            return entry.value != null;
          })
          .map((e) {
            if (_canCallToJson(e.value)) {
              return MapEntry(
                e.key,
                _removeNullsFromMap(e.value.toJson() as Map<String, dynamic>),
              );
            }
            if (e.value is Map) {
              return MapEntry(e.key, _removeNullsFromMap(e.value));
            }
            return e;
          }),
    );
  }

  bool _canCallToJson(Object? obj) {
    try {
      final result = (obj as dynamic).toJson();
      return result is Map<String, dynamic>;
    } catch (_) {
      return false;
    }
  }
}

bool _isDateKey(String k) => k.endsWith('At') || k.endsWith('Expires');

// ponytail: key-name heuristic (*At / *Expires), ms values only (> 1e11).
Object? epochDatesToIso(Object? v) {
  if (v is List) return v.map(epochDatesToIso).toList();
  if (v is Map) {
    return v.map((k, val) {
      if (k is String && _isDateKey(k) && val is num && val > 1e11) {
        return MapEntry(
          k,
          DateTime.fromMillisecondsSinceEpoch(val.toInt(), isUtc: true)
              .toIso8601String(),
        );
      }
      return MapEntry(k, epochDatesToIso(val));
    });
  }
  return v;
}

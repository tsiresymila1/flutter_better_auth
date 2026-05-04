import 'dart:io';

import 'package:hive_ce/hive_ce.dart';
import 'package:path_provider/path_provider.dart';

import 'storage.dart';

class HiveStorage implements StorageInterface {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.openBox('better_auth_cookies');
  }

  final _box = Hive.box('better_auth_cookies');

  @override
  Future<void> saveCookies(String url, List<Cookie> cookies) async {
    final list =
        cookies
            .map(
              (c) => {
                'name': c.name,
                'value': c.value,
                'expires': c.expires?.millisecondsSinceEpoch,
                'path': c.path,
                'domain': c.domain,
                'httpOnly': c.httpOnly,
                'secure': c.secure,
              },
            )
            .toList();
    await _box.put(url, list);
  }

  @override
  Future<List<Cookie>> loadCookies(String url) async {
    final data = _box.get(url);
    if (data == null) return [];

    return (data as List).map<Cookie>((c) {
      final cookie = Cookie(c['name'], c['value']);
      cookie.expires =
          c['expires'] != null
              ? DateTime.fromMillisecondsSinceEpoch(c['expires'])
              : null;
      cookie.path = c['path'];
      cookie.domain = c['domain'];
      cookie.httpOnly = c['httpOnly'] ?? false;
      cookie.secure = c['secure'] ?? false;
      return cookie;
    }).toList();
  }
}

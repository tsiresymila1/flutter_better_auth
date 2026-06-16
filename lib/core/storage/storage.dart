import 'package:cookie_jar/cookie_jar.dart';

abstract class StorageInterface {
  static late final String basePath;
  Future<void> saveCookies(String url, List<Cookie> cookies);
  Future<List<Cookie>> loadCookies(String url);
}

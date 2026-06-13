import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage.dart';

/// Encrypted, host-keyed cookie store backed by the platform keychain/keystore.
///
/// Mirrors the Expo client's secure cookie persistence: values are encrypted at
/// rest and split into ~1800-character chunks to stay under the iOS Keychain
/// per-item write limit. Keys are normalized to the character set the secure
/// store accepts.
class SecureStorage implements StorageInterface {
  SecureStorage({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  /// Max characters per secure-store entry. Matches the Expo adapter; keeps each
  /// write under the iOS Keychain ~2KB per-item cap.
  static const int _chunkSize = 1800;
  static const String _prefix = 'ba_cookies_';
  static const String _countSuffix = '__count';

  /// Secure-store keys allow a limited character set. Replace anything else so a
  /// host like `example.com:8080` maps to a stable, valid key.
  String _normalizeKey(String url) {
    final safe = url.replaceAll(RegExp(r'[^A-Za-z0-9_.-]'), '_');
    return '$_prefix$safe';
  }

  @override
  Future<void> saveCookies(String url, List<Cookie> cookies) async {
    final key = _normalizeKey(url);
    await _deleteChunks(key);
    if (cookies.isEmpty) return;

    final payload = jsonEncode(cookies.map(_cookieToMap).toList());
    final chunks = _splitIntoChunks(payload, _chunkSize);
    await _storage.write(key: '$key$_countSuffix', value: '${chunks.length}');
    for (var i = 0; i < chunks.length; i++) {
      await _storage.write(key: '$key$i', value: chunks[i]);
    }
  }

  @override
  Future<List<Cookie>> loadCookies(String url) async {
    final key = _normalizeKey(url);
    final countStr = await _storage.read(key: '$key$_countSuffix');
    if (countStr == null) return [];

    final count = int.tryParse(countStr) ?? 0;
    final buffer = StringBuffer();
    for (var i = 0; i < count; i++) {
      final part = await _storage.read(key: '$key$i');
      // Missing chunk means a partial/corrupt write; treat as no cookies.
      if (part == null) return [];
      buffer.write(part);
    }

    final raw = buffer.toString();
    if (raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw) as List;
      return list
          .map((e) => _cookieFromMap(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> _deleteChunks(String key) async {
    final countStr = await _storage.read(key: '$key$_countSuffix');
    final count = int.tryParse(countStr ?? '') ?? 0;
    for (var i = 0; i < count; i++) {
      await _storage.delete(key: '$key$i');
    }
    await _storage.delete(key: '$key$_countSuffix');
  }

  List<String> _splitIntoChunks(String value, int size) {
    final chunks = <String>[];
    for (var i = 0; i < value.length; i += size) {
      final end = (i + size < value.length) ? i + size : value.length;
      chunks.add(value.substring(i, end));
    }
    return chunks;
  }

  Map<String, dynamic> _cookieToMap(Cookie c) => {
    'name': c.name,
    'value': c.value,
    'expires': c.expires?.millisecondsSinceEpoch,
    'path': c.path,
    'domain': c.domain,
    'httpOnly': c.httpOnly,
    'secure': c.secure,
  };

  Cookie _cookieFromMap(Map<String, dynamic> c) {
    final cookie = Cookie(c['name'] as String, c['value'] as String);
    cookie.expires = c['expires'] != null
        ? DateTime.fromMillisecondsSinceEpoch(c['expires'] as int)
        : null;
    cookie.path = c['path'] as String?;
    cookie.domain = c['domain'] as String?;
    cookie.httpOnly = (c['httpOnly'] as bool?) ?? false;
    cookie.secure = (c['secure'] as bool?) ?? false;
    return cookie;
  }
}

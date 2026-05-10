import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_better_auth/core/api/better_auth_client.dart';
import 'package:flutter_better_auth/core/storage/custom_persist_cookie_jar.dart';
import 'package:flutter_better_auth/core/storage/hive_storage.dart';
import 'package:flutter_better_auth/core/storage/storage.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

import 'api/interceptor.dart';
import 'storage/memory_storage.dart';

class FlutterBetterAuth {
  static final FlutterBetterAuth _instance = FlutterBetterAuth._internal();
  late final BetterAuthClient _client;
  static bool _initialized = false;

  static late String baseUrl;
  static late Dio dioClient;
  static late StorageInterface? storage;

  FlutterBetterAuth._internal() {
    _client = BetterAuthClient(dioClient, baseUrl: baseUrl);
  }

  static Future<void> initialize({
    required String url,
    Dio? dio,
    StorageInterface? store,
  }) async {
    if (_initialized) return;
    baseUrl = url;
    if (store == null && !kIsWeb) {
      await HiveStorage.init();
      storage = HiveStorage();
    } else {
      storage = store;
    }
    dioClient =
        dio ??
        Dio(
          BaseOptions(
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
              HttpHeaders.userAgentHeader: 'FlutterBetterAuth/1.0.0',
              'flutter-origin': 'flutter://',
              'expo-origin': 'exp://',
            },
            validateStatus: (status) => status != null && status < 300,
          ),
        );
    final cookieJar = CustomPersistCookieJar(
      store: storage,
      storage: MemoryStorage(),
    );
    dioClient.interceptors.add(CookieManager(cookieJar));
    dioClient.interceptors.add(RemoveNullsInterceptor());
    dioClient.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) async {
          final path = response.requestOptions.path;
          if (response.statusCode == 200) {
            if (path.contains('/sign-in') ||
                path.contains('/sign-up') ||
                path.contains('/update-user') ||
                path.contains('/change-email') ||
                path.contains('/change-password')) {
              // await _refreshSession();
            } else if (path.contains('/sign-out')) {
              _authStreamController.add(null);
            }
          }
          handler.next(response);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            _authStreamController.add(null);
          }
          handler.next(error);
        },
      ),
    );
    _initialized = true;
  }

  @visibleForTesting
  static void reset() {
    _initialized = false;
  }

  static final StreamController<User?> _authStreamController =
      StreamController<User?>.broadcast();
  static Stream<User?> get _onAuthChange => _authStreamController.stream;

  static Future<void> _refreshSession() async {
    try {
      final result = await client.getSession();
      result.maybeWhen(
        orElse: () {
          _authStreamController.add(null);
        },
        ok: (success) {
          _authStreamController.add(success?.user);
        },
        err: (error) {
          _authStreamController.add(null);
        },
      );
    } catch (e) {
      _authStreamController.add(null);
    }
  }

  static BetterAuthClient get client {
    assert(
      _initialized,
      'FlutterBetterAuth not initialized. Call initialize() first.',
    );
    return _instance._client;
  }
}

extension OnAuthChangeExtension on BetterAuthClient {
  Stream<User?> get onAuthChange => FlutterBetterAuth._onAuthChange;
}

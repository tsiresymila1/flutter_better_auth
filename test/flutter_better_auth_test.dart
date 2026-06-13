import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_better_auth/core/api/interceptor.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockStorage extends Mock implements StorageInterface {}

class RecordingErrorHandler extends ErrorInterceptorHandler {
  DioException? error;

  @override
  void next(DioException error) {
    this.error = error;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterBetterAuth', () {
    late MockDio mockDio;
    late MockStorage mockStorage;

    setUp(() {
      FlutterBetterAuth.reset(); // Reset singleton state
      mockDio = MockDio();
      mockStorage = MockStorage();
      final interceptors = Interceptors();
      when(() => mockDio.interceptors).thenReturn(interceptors);
      when(() => mockDio.options).thenReturn(BaseOptions());
      when(() => mockStorage.loadCookies(any())).thenAnswer((_) async => []);
      when(
        () => mockStorage.saveCookies(any(), any()),
      ).thenAnswer((_) async {});
    });

    test('initialize sets up singleton correctly', () async {
      await FlutterBetterAuth.initialize(
        url: 'https://example.com',
        dio: mockDio,
        store: mockStorage,
      );

      expect(() => FlutterBetterAuth.client, returnsNormally);
      expect(FlutterBetterAuth.baseUrl, 'https://example.com');
    });

    test('initialize configures the native app origin', () async {
      await FlutterBetterAuth.initialize(
        url: 'https://example.com',
        dio: mockDio,
        store: mockStorage,
        scheme: 'myapp',
      );

      expect(mockDio.options.headers['expo-origin'], 'myapp://');
      expect(mockDio.options.headers['x-skip-oauth-proxy'], 'true');
    });

    test('reset allows initialization with a different client', () async {
      await FlutterBetterAuth.initialize(
        url: 'https://first.example.com',
        dio: mockDio,
        store: mockStorage,
      );
      final firstClient = FlutterBetterAuth.client;

      FlutterBetterAuth.reset();
      final secondDio = MockDio();
      when(() => secondDio.interceptors).thenReturn(Interceptors());
      when(() => secondDio.options).thenReturn(BaseOptions());
      await FlutterBetterAuth.initialize(
        url: 'https://second.example.com',
        dio: secondDio,
        store: mockStorage,
      );

      expect(FlutterBetterAuth.client, isNot(same(firstClient)));
      expect(FlutterBetterAuth.baseUrl, 'https://second.example.com');
    });

    test('initialize adds interceptors', () async {
      final interceptors = Interceptors();
      when(() => mockDio.interceptors).thenReturn(interceptors);

      await FlutterBetterAuth.initialize(
        url: 'https://example.com',
        dio: mockDio,
        store: mockStorage,
      );

      expect(interceptors.any((i) => i is CookieManager), isTrue);
      expect(interceptors.any((i) => i is RemoveNullsInterceptor), isTrue);
      expect(interceptors.any((i) => i is InterceptorsWrapper), isTrue);
    });

    test('onAuthChange emits null on 401 error', () async {
      final interceptors = Interceptors();
      when(() => mockDio.interceptors).thenReturn(interceptors);

      await FlutterBetterAuth.initialize(
        url: 'https://example.com',
        dio: mockDio,
        store: mockStorage,
      );

      final authInterceptor =
          interceptors.lastWhere(
                (i) =>
                    i is InterceptorsWrapper &&
                    i is! CookieManager &&
                    i is! RemoveNullsInterceptor,
              )
              as InterceptorsWrapper;

      final error = DioException(
        requestOptions: RequestOptions(path: '/some-protected-route'),
        response: Response(
          requestOptions: RequestOptions(path: '/some-protected-route'),
          statusCode: 401,
        ),
      );

      final handler = RecordingErrorHandler();

      final authChange = expectLater(
        FlutterBetterAuth.client.onAuthChange,
        emits(null),
      );
      authInterceptor.onError(error, handler);
      await authChange;
      expect(handler.error, same(error));
    });

    test('onAuthChange emits null on /sign-out success', () async {
      final interceptors = Interceptors();
      when(() => mockDio.interceptors).thenReturn(interceptors);

      await FlutterBetterAuth.initialize(
        url: 'https://example.com',
        dio: mockDio,
        store: mockStorage,
      );

      final authInterceptor =
          interceptors.lastWhere(
                (i) =>
                    i is InterceptorsWrapper &&
                    i is! CookieManager &&
                    i is! RemoveNullsInterceptor,
              )
              as InterceptorsWrapper;

      final response = Response(
        requestOptions: RequestOptions(path: '/sign-out'),
        statusCode: 200,
      );

      final handler = ResponseInterceptorHandler();

      final authChange = expectLater(
        FlutterBetterAuth.client.onAuthChange,
        emits(null),
      );
      authInterceptor.onResponse(response, handler);
      await authChange;
    });
  });
}

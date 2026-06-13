import 'package:dio/dio.dart';
import 'package:flutter_better_auth/core/api/adapter.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit/retrofit.dart';

void main() {
  group('BetterAuthCallAdapter', () {
    final reqOpts = RequestOptions(path: '/x');

    test('wraps a successful response in Result.ok', () async {
      final adapter = BetterAuthCallAdapter<String>();

      final result = await adapter.adapt(
        () async =>
            HttpResponse<String>('hello', Response(requestOptions: reqOpts)),
      );

      expect(result.data, 'hello');
      expect(result.error, isNull);
    });

    test('maps a DioException with server code/message to Result.err', () async {
      final adapter = BetterAuthCallAdapter<String>();

      final result = await adapter.adapt(() async {
        throw DioException(
          requestOptions: reqOpts,
          response: Response(
            requestOptions: reqOpts,
            statusCode: 400,
            data: {'code': 'BAD_REQUEST', 'message': 'nope'},
          ),
        );
      });

      expect(result.data, isNull);
      expect(result.error?.code, 'BAD_REQUEST');
      expect(result.error?.message, 'nope');
    });

    test('falls back to ERROR code when response has no body', () async {
      final adapter = BetterAuthCallAdapter<String>();

      final result = await adapter.adapt(() async {
        throw DioException(requestOptions: reqOpts, message: 'boom');
      });

      expect(result.error?.code, 'ERROR');
      expect(result.error?.message, 'boom');
    });

    test('maps non-Dio errors to Result.err', () async {
      final adapter = BetterAuthCallAdapter<String>();

      final result = await adapter.adapt(
        () async => throw StateError('kaboom'),
      );

      expect(result.error, isNotNull);
      expect(result.error!.message, contains('kaboom'));
    });
  });
}

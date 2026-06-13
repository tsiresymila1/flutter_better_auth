import 'package:dio/dio.dart';
import 'package:flutter_better_auth/core/api/interceptor.dart';
import 'package:flutter_test/flutter_test.dart';

class _RecordingHandler extends RequestInterceptorHandler {
  RequestOptions? recorded;
  @override
  void next(RequestOptions options) {
    recorded = options;
  }
}

class _WithToJson {
  _WithToJson(this.a, this.b);
  final String? a;
  final String? b;
  Map<String, dynamic> toJson() => {'a': a, 'b': b};
}

void main() {
  group('RemoveNullsInterceptor', () {
    late RemoveNullsInterceptor interceptor;
    setUp(() => interceptor = RemoveNullsInterceptor());

    RequestOptions run(String path, Object? data) {
      final options = RequestOptions(path: path, data: data);
      interceptor.onRequest(options, _RecordingHandler());
      return options;
    }

    test('strips null values from a map body', () {
      final options = run('/update-user', {'name': 'x', 'image': null});
      expect(options.data, {'name': 'x'});
    });

    test('preserves nulls for organization set-active', () {
      final options = run('/organization/set-active', {'organizationId': null});
      expect(options.data, {'organizationId': null});
    });

    test('preserves nulls for organization set-active-team', () {
      final options = run('/organization/set-active-team', {'teamId': null});
      expect(options.data, {'teamId': null});
    });

    test('converts toJson objects and strips their nulls', () {
      final options = run('/sign-up/email', _WithToJson('keep', null));
      expect(options.data, {'a': 'keep'});
    });

    test('recurses into nested maps', () {
      final options = run('/x', {
        'outer': {'k': null, 'v': 1},
      });
      expect(options.data, {
        'outer': {'v': 1},
      });
    });

    test('leaves a null body untouched', () {
      final options = run('/x', null);
      expect(options.data, isNull);
    });
  });
}

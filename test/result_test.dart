import 'package:flutter_better_auth/core/api/models/result/better_error.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResultX', () {
    test('exposes data and null error on success', () {
      const result = Result<int>.ok(42);
      expect(result.data, 42);
      expect(result.error, isNull);
    });

    test('exposes error and null data on failure', () {
      const result = Result<int>.err(
        BetterError(code: 'X', message: 'boom', stack: null),
      );
      expect(result.data, isNull);
      expect(result.error?.code, 'X');
      expect(result.error?.message, 'boom');
    });
  });
}

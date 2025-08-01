import 'better_error.dart';
import 'result.dart';

extension ResultX<T> on Result<T> {
  T? get data => this is Success<T> ? (this as Success<T>).data : null;
  BetterError? get error =>
      this is Failure<T> ? (this as Failure<T>).error : null;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'better_error.freezed.dart';
part 'better_error.g.dart';

@freezed
abstract class BetterError with _$BetterError {
  const factory BetterError({
    @Default("ERROR") String code,
    required String message,
    required String? stack,

    /// `DioExceptionType` name when no HTTP response was received
    /// (`connectionTimeout`, `connectionError`, ...). Null otherwise.
    String? dioType,
  }) = _BetterError;

  factory BetterError.fromJson(Map<String, dynamic> json) =>
      _$BetterErrorFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'two_factor.freezed.dart';
part 'two_factor.g.dart';

@freezed
abstract class TwoFactor with _$TwoFactor {
  const factory TwoFactor({
    required String id,
    required String secret,
    required String backupCodes,
    required String userId,
  }) = _TwoFactor;

  factory TwoFactor.fromJson(Map<String, dynamic> json) =>
      _$TwoFactorFromJson(json);
}

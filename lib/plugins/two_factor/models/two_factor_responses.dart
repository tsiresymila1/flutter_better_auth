import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/models/user/user.dart';

part 'two_factor_responses.freezed.dart';
part 'two_factor_responses.g.dart';

@freezed
abstract class TwoFactorVerifyResponse with _$TwoFactorVerifyResponse {
  const factory TwoFactorVerifyResponse({
    String? token,
    User? user,
    String? message, // In case of error or just message
  }) = _TwoFactorVerifyResponse;

  factory TwoFactorVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$TwoFactorVerifyResponseFromJson(json);
}

@freezed
abstract class BackupCodesResponse with _$BackupCodesResponse {
  const factory BackupCodesResponse({
    required List<String> backupCodes,
  }) = _BackupCodesResponse;

  factory BackupCodesResponse.fromJson(Map<String, dynamic> json) =>
      _$BackupCodesResponseFromJson(json);
}

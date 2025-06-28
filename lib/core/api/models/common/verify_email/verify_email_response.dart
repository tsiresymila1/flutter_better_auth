import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/user/user.dart';

part 'verify_email_response.freezed.dart';

part 'verify_email_response.g.dart';

@freezed
abstract class VerifyEmailResponse with _$VerifyEmailResponse {
  const factory VerifyEmailResponse({
    required User? user,
    required bool status,
    String? required,
  }) = _VerifyEmailResponse;

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailResponseFromJson(json);
}

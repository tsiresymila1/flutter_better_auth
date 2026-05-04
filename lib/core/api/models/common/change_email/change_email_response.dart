import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/user/user.dart';

part 'change_email_response.freezed.dart';
part 'change_email_response.g.dart';

@freezed
abstract class ChangeEmailResponse with _$ChangeEmailResponse {
  const factory ChangeEmailResponse({
    User? user,
    required bool status,
    String? message,
  }) = _ChangeEmailResponse;

  factory ChangeEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeEmailResponseFromJson(json);
}

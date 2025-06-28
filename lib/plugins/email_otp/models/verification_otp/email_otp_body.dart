import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_otp_body.freezed.dart';
part 'email_otp_body.g.dart';

@freezed
abstract class EmailOtpBody with _$EmailOtpBody {
  const factory EmailOtpBody({required String email, required String type}) =
      _EmailOtpBody;

  factory EmailOtpBody.fromJson(Map<String, dynamic> json) =>
      _$EmailOtpBodyFromJson(json);
}

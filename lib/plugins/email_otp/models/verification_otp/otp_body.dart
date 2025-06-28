import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_body.freezed.dart';

part 'otp_body.g.dart';

@freezed
abstract class OtpBody with _$OtpBody {
  const factory OtpBody({required String email}) = _OtpBody;

  factory OtpBody.fromJson(Map<String, dynamic> json) =>
      _$OtpBodyFromJson(json);
}

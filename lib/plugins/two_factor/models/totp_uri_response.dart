import 'package:freezed_annotation/freezed_annotation.dart';

part 'totp_uri_response.freezed.dart';
part 'totp_uri_response.g.dart';

@freezed
abstract class TotpUriResponse with _$TotpUriResponse {
  const factory TotpUriResponse({
    required String totpURI,
  }) = _TotpUriResponse;

  factory TotpUriResponse.fromJson(Map<String, dynamic> json) =>
      _$TotpUriResponseFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/user/user.dart';

part 'user_wrapper_response.freezed.dart';
part 'user_wrapper_response.g.dart';

@freezed
abstract class UserWrapperResponse with _$UserWrapperResponse {
  const factory UserWrapperResponse({
    required User user,
  }) = _UserWrapperResponse;

  factory UserWrapperResponse.fromJson(Map<String, dynamic> json) =>
      _$UserWrapperResponseFromJson(json);
}

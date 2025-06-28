// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendOTPResponse {

 String get message;
/// Create a copy of SendOTPResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendOTPResponseCopyWith<SendOTPResponse> get copyWith => _$SendOTPResponseCopyWithImpl<SendOTPResponse>(this as SendOTPResponse, _$identity);

  /// Serializes this SendOTPResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendOTPResponse&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SendOTPResponse(message: $message)';
}


}

/// @nodoc
abstract mixin class $SendOTPResponseCopyWith<$Res>  {
  factory $SendOTPResponseCopyWith(SendOTPResponse value, $Res Function(SendOTPResponse) _then) = _$SendOTPResponseCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SendOTPResponseCopyWithImpl<$Res>
    implements $SendOTPResponseCopyWith<$Res> {
  _$SendOTPResponseCopyWithImpl(this._self, this._then);

  final SendOTPResponse _self;
  final $Res Function(SendOTPResponse) _then;

/// Create a copy of SendOTPResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SendOTPResponse implements SendOTPResponse {
  const _SendOTPResponse({required this.message});
  factory _SendOTPResponse.fromJson(Map<String, dynamic> json) => _$SendOTPResponseFromJson(json);

@override final  String message;

/// Create a copy of SendOTPResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendOTPResponseCopyWith<_SendOTPResponse> get copyWith => __$SendOTPResponseCopyWithImpl<_SendOTPResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendOTPResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOTPResponse&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SendOTPResponse(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SendOTPResponseCopyWith<$Res> implements $SendOTPResponseCopyWith<$Res> {
  factory _$SendOTPResponseCopyWith(_SendOTPResponse value, $Res Function(_SendOTPResponse) _then) = __$SendOTPResponseCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$SendOTPResponseCopyWithImpl<$Res>
    implements _$SendOTPResponseCopyWith<$Res> {
  __$SendOTPResponseCopyWithImpl(this._self, this._then);

  final _SendOTPResponse _self;
  final $Res Function(_SendOTPResponse) _then;

/// Create a copy of SendOTPResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_SendOTPResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_phone_password_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPhonePasswordBody {

 String get otp; String get phoneNumber; String get newPassword;
/// Create a copy of ResetPhonePasswordBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPhonePasswordBodyCopyWith<ResetPhonePasswordBody> get copyWith => _$ResetPhonePasswordBodyCopyWithImpl<ResetPhonePasswordBody>(this as ResetPhonePasswordBody, _$identity);

  /// Serializes this ResetPhonePasswordBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPhonePasswordBody&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,otp,phoneNumber,newPassword);

@override
String toString() {
  return 'ResetPhonePasswordBody(otp: $otp, phoneNumber: $phoneNumber, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ResetPhonePasswordBodyCopyWith<$Res>  {
  factory $ResetPhonePasswordBodyCopyWith(ResetPhonePasswordBody value, $Res Function(ResetPhonePasswordBody) _then) = _$ResetPhonePasswordBodyCopyWithImpl;
@useResult
$Res call({
 String otp, String phoneNumber, String newPassword
});




}
/// @nodoc
class _$ResetPhonePasswordBodyCopyWithImpl<$Res>
    implements $ResetPhonePasswordBodyCopyWith<$Res> {
  _$ResetPhonePasswordBodyCopyWithImpl(this._self, this._then);

  final ResetPhonePasswordBody _self;
  final $Res Function(ResetPhonePasswordBody) _then;

/// Create a copy of ResetPhonePasswordBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otp = null,Object? phoneNumber = null,Object? newPassword = null,}) {
  return _then(_self.copyWith(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ResetPhonePasswordBody implements ResetPhonePasswordBody {
  const _ResetPhonePasswordBody({required this.otp, required this.phoneNumber, required this.newPassword});
  factory _ResetPhonePasswordBody.fromJson(Map<String, dynamic> json) => _$ResetPhonePasswordBodyFromJson(json);

@override final  String otp;
@override final  String phoneNumber;
@override final  String newPassword;

/// Create a copy of ResetPhonePasswordBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPhonePasswordBodyCopyWith<_ResetPhonePasswordBody> get copyWith => __$ResetPhonePasswordBodyCopyWithImpl<_ResetPhonePasswordBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPhonePasswordBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPhonePasswordBody&&(identical(other.otp, otp) || other.otp == otp)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,otp,phoneNumber,newPassword);

@override
String toString() {
  return 'ResetPhonePasswordBody(otp: $otp, phoneNumber: $phoneNumber, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ResetPhonePasswordBodyCopyWith<$Res> implements $ResetPhonePasswordBodyCopyWith<$Res> {
  factory _$ResetPhonePasswordBodyCopyWith(_ResetPhonePasswordBody value, $Res Function(_ResetPhonePasswordBody) _then) = __$ResetPhonePasswordBodyCopyWithImpl;
@override @useResult
$Res call({
 String otp, String phoneNumber, String newPassword
});




}
/// @nodoc
class __$ResetPhonePasswordBodyCopyWithImpl<$Res>
    implements _$ResetPhonePasswordBodyCopyWith<$Res> {
  __$ResetPhonePasswordBodyCopyWithImpl(this._self, this._then);

  final _ResetPhonePasswordBody _self;
  final $Res Function(_ResetPhonePasswordBody) _then;

/// Create a copy of ResetPhonePasswordBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otp = null,Object? phoneNumber = null,Object? newPassword = null,}) {
  return _then(_ResetPhonePasswordBody(
otp: null == otp ? _self.otp : otp // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

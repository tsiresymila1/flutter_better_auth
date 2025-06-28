// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtpBody {

 String get email;
/// Create a copy of OtpBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpBodyCopyWith<OtpBody> get copyWith => _$OtpBodyCopyWithImpl<OtpBody>(this as OtpBody, _$identity);

  /// Serializes this OtpBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpBody&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'OtpBody(email: $email)';
}


}

/// @nodoc
abstract mixin class $OtpBodyCopyWith<$Res>  {
  factory $OtpBodyCopyWith(OtpBody value, $Res Function(OtpBody) _then) = _$OtpBodyCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$OtpBodyCopyWithImpl<$Res>
    implements $OtpBodyCopyWith<$Res> {
  _$OtpBodyCopyWithImpl(this._self, this._then);

  final OtpBody _self;
  final $Res Function(OtpBody) _then;

/// Create a copy of OtpBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OtpBody implements OtpBody {
  const _OtpBody({required this.email});
  factory _OtpBody.fromJson(Map<String, dynamic> json) => _$OtpBodyFromJson(json);

@override final  String email;

/// Create a copy of OtpBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpBodyCopyWith<_OtpBody> get copyWith => __$OtpBodyCopyWithImpl<_OtpBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpBody&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'OtpBody(email: $email)';
}


}

/// @nodoc
abstract mixin class _$OtpBodyCopyWith<$Res> implements $OtpBodyCopyWith<$Res> {
  factory _$OtpBodyCopyWith(_OtpBody value, $Res Function(_OtpBody) _then) = __$OtpBodyCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$OtpBodyCopyWithImpl<$Res>
    implements _$OtpBodyCopyWith<$Res> {
  __$OtpBodyCopyWithImpl(this._self, this._then);

  final _OtpBody _self;
  final $Res Function(_OtpBody) _then;

/// Create a copy of OtpBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_OtpBody(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

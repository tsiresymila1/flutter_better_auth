// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_otp_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmailOtpBody {

 String get email; String get type;
/// Create a copy of EmailOtpBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailOtpBodyCopyWith<EmailOtpBody> get copyWith => _$EmailOtpBodyCopyWithImpl<EmailOtpBody>(this as EmailOtpBody, _$identity);

  /// Serializes this EmailOtpBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailOtpBody&&(identical(other.email, email) || other.email == email)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,type);

@override
String toString() {
  return 'EmailOtpBody(email: $email, type: $type)';
}


}

/// @nodoc
abstract mixin class $EmailOtpBodyCopyWith<$Res>  {
  factory $EmailOtpBodyCopyWith(EmailOtpBody value, $Res Function(EmailOtpBody) _then) = _$EmailOtpBodyCopyWithImpl;
@useResult
$Res call({
 String email, String type
});




}
/// @nodoc
class _$EmailOtpBodyCopyWithImpl<$Res>
    implements $EmailOtpBodyCopyWith<$Res> {
  _$EmailOtpBodyCopyWithImpl(this._self, this._then);

  final EmailOtpBody _self;
  final $Res Function(EmailOtpBody) _then;

/// Create a copy of EmailOtpBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? type = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EmailOtpBody implements EmailOtpBody {
  const _EmailOtpBody({required this.email, required this.type});
  factory _EmailOtpBody.fromJson(Map<String, dynamic> json) => _$EmailOtpBodyFromJson(json);

@override final  String email;
@override final  String type;

/// Create a copy of EmailOtpBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailOtpBodyCopyWith<_EmailOtpBody> get copyWith => __$EmailOtpBodyCopyWithImpl<_EmailOtpBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailOtpBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailOtpBody&&(identical(other.email, email) || other.email == email)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,type);

@override
String toString() {
  return 'EmailOtpBody(email: $email, type: $type)';
}


}

/// @nodoc
abstract mixin class _$EmailOtpBodyCopyWith<$Res> implements $EmailOtpBodyCopyWith<$Res> {
  factory _$EmailOtpBodyCopyWith(_EmailOtpBody value, $Res Function(_EmailOtpBody) _then) = __$EmailOtpBodyCopyWithImpl;
@override @useResult
$Res call({
 String email, String type
});




}
/// @nodoc
class __$EmailOtpBodyCopyWithImpl<$Res>
    implements _$EmailOtpBodyCopyWith<$Res> {
  __$EmailOtpBodyCopyWithImpl(this._self, this._then);

  final _EmailOtpBody _self;
  final $Res Function(_EmailOtpBody) _then;

/// Create a copy of EmailOtpBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? type = null,}) {
  return _then(_EmailOtpBody(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

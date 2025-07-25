// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_id_token_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialIdTokenBody {

 String get token; String? get nonce; String? get accessToken; String? get refreshToken; int? get expiresAt;
/// Create a copy of SocialIdTokenBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialIdTokenBodyCopyWith<SocialIdTokenBody> get copyWith => _$SocialIdTokenBodyCopyWithImpl<SocialIdTokenBody>(this as SocialIdTokenBody, _$identity);

  /// Serializes this SocialIdTokenBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialIdTokenBody&&(identical(other.token, token) || other.token == token)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,nonce,accessToken,refreshToken,expiresAt);

@override
String toString() {
  return 'SocialIdTokenBody(token: $token, nonce: $nonce, accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $SocialIdTokenBodyCopyWith<$Res>  {
  factory $SocialIdTokenBodyCopyWith(SocialIdTokenBody value, $Res Function(SocialIdTokenBody) _then) = _$SocialIdTokenBodyCopyWithImpl;
@useResult
$Res call({
 String token, String? nonce, String? accessToken, String? refreshToken, int? expiresAt
});




}
/// @nodoc
class _$SocialIdTokenBodyCopyWithImpl<$Res>
    implements $SocialIdTokenBodyCopyWith<$Res> {
  _$SocialIdTokenBodyCopyWithImpl(this._self, this._then);

  final SocialIdTokenBody _self;
  final $Res Function(SocialIdTokenBody) _then;

/// Create a copy of SocialIdTokenBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? nonce = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,nonce: freezed == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SocialIdTokenBody implements SocialIdTokenBody {
  const _SocialIdTokenBody({required this.token, this.nonce, this.accessToken, this.refreshToken, this.expiresAt});
  factory _SocialIdTokenBody.fromJson(Map<String, dynamic> json) => _$SocialIdTokenBodyFromJson(json);

@override final  String token;
@override final  String? nonce;
@override final  String? accessToken;
@override final  String? refreshToken;
@override final  int? expiresAt;

/// Create a copy of SocialIdTokenBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialIdTokenBodyCopyWith<_SocialIdTokenBody> get copyWith => __$SocialIdTokenBodyCopyWithImpl<_SocialIdTokenBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialIdTokenBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialIdTokenBody&&(identical(other.token, token) || other.token == token)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,nonce,accessToken,refreshToken,expiresAt);

@override
String toString() {
  return 'SocialIdTokenBody(token: $token, nonce: $nonce, accessToken: $accessToken, refreshToken: $refreshToken, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$SocialIdTokenBodyCopyWith<$Res> implements $SocialIdTokenBodyCopyWith<$Res> {
  factory _$SocialIdTokenBodyCopyWith(_SocialIdTokenBody value, $Res Function(_SocialIdTokenBody) _then) = __$SocialIdTokenBodyCopyWithImpl;
@override @useResult
$Res call({
 String token, String? nonce, String? accessToken, String? refreshToken, int? expiresAt
});




}
/// @nodoc
class __$SocialIdTokenBodyCopyWithImpl<$Res>
    implements _$SocialIdTokenBodyCopyWith<$Res> {
  __$SocialIdTokenBodyCopyWithImpl(this._self, this._then);

  final _SocialIdTokenBody _self;
  final $Res Function(_SocialIdTokenBody) _then;

/// Create a copy of SocialIdTokenBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? nonce = freezed,Object? accessToken = freezed,Object? refreshToken = freezed,Object? expiresAt = freezed,}) {
  return _then(_SocialIdTokenBody(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,nonce: freezed == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as String?,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_account_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialAccountResponse {

 String get id; String get provider; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of SocialAccountResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialAccountResponseCopyWith<SocialAccountResponse> get copyWith => _$SocialAccountResponseCopyWithImpl<SocialAccountResponse>(this as SocialAccountResponse, _$identity);

  /// Serializes this SocialAccountResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialAccountResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,provider,createdAt,updatedAt);

@override
String toString() {
  return 'SocialAccountResponse(id: $id, provider: $provider, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SocialAccountResponseCopyWith<$Res>  {
  factory $SocialAccountResponseCopyWith(SocialAccountResponse value, $Res Function(SocialAccountResponse) _then) = _$SocialAccountResponseCopyWithImpl;
@useResult
$Res call({
 String id, String provider, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$SocialAccountResponseCopyWithImpl<$Res>
    implements $SocialAccountResponseCopyWith<$Res> {
  _$SocialAccountResponseCopyWithImpl(this._self, this._then);

  final SocialAccountResponse _self;
  final $Res Function(SocialAccountResponse) _then;

/// Create a copy of SocialAccountResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? provider = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SocialAccountResponse implements SocialAccountResponse {
  const _SocialAccountResponse({required this.id, required this.provider, this.createdAt = null, this.updatedAt = null});
  factory _SocialAccountResponse.fromJson(Map<String, dynamic> json) => _$SocialAccountResponseFromJson(json);

@override final  String id;
@override final  String provider;
@override@JsonKey() final  DateTime? createdAt;
@override@JsonKey() final  DateTime? updatedAt;

/// Create a copy of SocialAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialAccountResponseCopyWith<_SocialAccountResponse> get copyWith => __$SocialAccountResponseCopyWithImpl<_SocialAccountResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialAccountResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialAccountResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,provider,createdAt,updatedAt);

@override
String toString() {
  return 'SocialAccountResponse(id: $id, provider: $provider, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SocialAccountResponseCopyWith<$Res> implements $SocialAccountResponseCopyWith<$Res> {
  factory _$SocialAccountResponseCopyWith(_SocialAccountResponse value, $Res Function(_SocialAccountResponse) _then) = __$SocialAccountResponseCopyWithImpl;
@override @useResult
$Res call({
 String id, String provider, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$SocialAccountResponseCopyWithImpl<$Res>
    implements _$SocialAccountResponseCopyWith<$Res> {
  __$SocialAccountResponseCopyWithImpl(this._self, this._then);

  final _SocialAccountResponse _self;
  final $Res Function(_SocialAccountResponse) _then;

/// Create a copy of SocialAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? provider = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SocialAccountResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

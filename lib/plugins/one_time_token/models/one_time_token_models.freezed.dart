// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'one_time_token_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OneTimeTokenGenerateResponse {

 String get token; String? get url;
/// Create a copy of OneTimeTokenGenerateResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OneTimeTokenGenerateResponseCopyWith<OneTimeTokenGenerateResponse> get copyWith => _$OneTimeTokenGenerateResponseCopyWithImpl<OneTimeTokenGenerateResponse>(this as OneTimeTokenGenerateResponse, _$identity);

  /// Serializes this OneTimeTokenGenerateResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OneTimeTokenGenerateResponse&&(identical(other.token, token) || other.token == token)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,url);

@override
String toString() {
  return 'OneTimeTokenGenerateResponse(token: $token, url: $url)';
}


}

/// @nodoc
abstract mixin class $OneTimeTokenGenerateResponseCopyWith<$Res>  {
  factory $OneTimeTokenGenerateResponseCopyWith(OneTimeTokenGenerateResponse value, $Res Function(OneTimeTokenGenerateResponse) _then) = _$OneTimeTokenGenerateResponseCopyWithImpl;
@useResult
$Res call({
 String token, String? url
});




}
/// @nodoc
class _$OneTimeTokenGenerateResponseCopyWithImpl<$Res>
    implements $OneTimeTokenGenerateResponseCopyWith<$Res> {
  _$OneTimeTokenGenerateResponseCopyWithImpl(this._self, this._then);

  final OneTimeTokenGenerateResponse _self;
  final $Res Function(OneTimeTokenGenerateResponse) _then;

/// Create a copy of OneTimeTokenGenerateResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? url = freezed,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OneTimeTokenGenerateResponse].
extension OneTimeTokenGenerateResponsePatterns on OneTimeTokenGenerateResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OneTimeTokenGenerateResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OneTimeTokenGenerateResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OneTimeTokenGenerateResponse value)  $default,){
final _that = this;
switch (_that) {
case _OneTimeTokenGenerateResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OneTimeTokenGenerateResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OneTimeTokenGenerateResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OneTimeTokenGenerateResponse() when $default != null:
return $default(_that.token,_that.url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  String? url)  $default,) {final _that = this;
switch (_that) {
case _OneTimeTokenGenerateResponse():
return $default(_that.token,_that.url);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _OneTimeTokenGenerateResponse() when $default != null:
return $default(_that.token,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OneTimeTokenGenerateResponse implements OneTimeTokenGenerateResponse {
  const _OneTimeTokenGenerateResponse({required this.token, this.url});
  factory _OneTimeTokenGenerateResponse.fromJson(Map<String, dynamic> json) => _$OneTimeTokenGenerateResponseFromJson(json);

@override final  String token;
@override final  String? url;

/// Create a copy of OneTimeTokenGenerateResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OneTimeTokenGenerateResponseCopyWith<_OneTimeTokenGenerateResponse> get copyWith => __$OneTimeTokenGenerateResponseCopyWithImpl<_OneTimeTokenGenerateResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OneTimeTokenGenerateResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OneTimeTokenGenerateResponse&&(identical(other.token, token) || other.token == token)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,url);

@override
String toString() {
  return 'OneTimeTokenGenerateResponse(token: $token, url: $url)';
}


}

/// @nodoc
abstract mixin class _$OneTimeTokenGenerateResponseCopyWith<$Res> implements $OneTimeTokenGenerateResponseCopyWith<$Res> {
  factory _$OneTimeTokenGenerateResponseCopyWith(_OneTimeTokenGenerateResponse value, $Res Function(_OneTimeTokenGenerateResponse) _then) = __$OneTimeTokenGenerateResponseCopyWithImpl;
@override @useResult
$Res call({
 String token, String? url
});




}
/// @nodoc
class __$OneTimeTokenGenerateResponseCopyWithImpl<$Res>
    implements _$OneTimeTokenGenerateResponseCopyWith<$Res> {
  __$OneTimeTokenGenerateResponseCopyWithImpl(this._self, this._then);

  final _OneTimeTokenGenerateResponse _self;
  final $Res Function(_OneTimeTokenGenerateResponse) _then;

/// Create a copy of OneTimeTokenGenerateResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? url = freezed,}) {
  return _then(_OneTimeTokenGenerateResponse(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

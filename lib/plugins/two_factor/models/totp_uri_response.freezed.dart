// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'totp_uri_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TotpUriResponse {

 String get totpURI;
/// Create a copy of TotpUriResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TotpUriResponseCopyWith<TotpUriResponse> get copyWith => _$TotpUriResponseCopyWithImpl<TotpUriResponse>(this as TotpUriResponse, _$identity);

  /// Serializes this TotpUriResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TotpUriResponse&&(identical(other.totpURI, totpURI) || other.totpURI == totpURI));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totpURI);

@override
String toString() {
  return 'TotpUriResponse(totpURI: $totpURI)';
}


}

/// @nodoc
abstract mixin class $TotpUriResponseCopyWith<$Res>  {
  factory $TotpUriResponseCopyWith(TotpUriResponse value, $Res Function(TotpUriResponse) _then) = _$TotpUriResponseCopyWithImpl;
@useResult
$Res call({
 String totpURI
});




}
/// @nodoc
class _$TotpUriResponseCopyWithImpl<$Res>
    implements $TotpUriResponseCopyWith<$Res> {
  _$TotpUriResponseCopyWithImpl(this._self, this._then);

  final TotpUriResponse _self;
  final $Res Function(TotpUriResponse) _then;

/// Create a copy of TotpUriResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totpURI = null,}) {
  return _then(_self.copyWith(
totpURI: null == totpURI ? _self.totpURI : totpURI // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TotpUriResponse].
extension TotpUriResponsePatterns on TotpUriResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TotpUriResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TotpUriResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TotpUriResponse value)  $default,){
final _that = this;
switch (_that) {
case _TotpUriResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TotpUriResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TotpUriResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String totpURI)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TotpUriResponse() when $default != null:
return $default(_that.totpURI);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String totpURI)  $default,) {final _that = this;
switch (_that) {
case _TotpUriResponse():
return $default(_that.totpURI);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String totpURI)?  $default,) {final _that = this;
switch (_that) {
case _TotpUriResponse() when $default != null:
return $default(_that.totpURI);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TotpUriResponse implements TotpUriResponse {
  const _TotpUriResponse({required this.totpURI});
  factory _TotpUriResponse.fromJson(Map<String, dynamic> json) => _$TotpUriResponseFromJson(json);

@override final  String totpURI;

/// Create a copy of TotpUriResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TotpUriResponseCopyWith<_TotpUriResponse> get copyWith => __$TotpUriResponseCopyWithImpl<_TotpUriResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TotpUriResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TotpUriResponse&&(identical(other.totpURI, totpURI) || other.totpURI == totpURI));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totpURI);

@override
String toString() {
  return 'TotpUriResponse(totpURI: $totpURI)';
}


}

/// @nodoc
abstract mixin class _$TotpUriResponseCopyWith<$Res> implements $TotpUriResponseCopyWith<$Res> {
  factory _$TotpUriResponseCopyWith(_TotpUriResponse value, $Res Function(_TotpUriResponse) _then) = __$TotpUriResponseCopyWithImpl;
@override @useResult
$Res call({
 String totpURI
});




}
/// @nodoc
class __$TotpUriResponseCopyWithImpl<$Res>
    implements _$TotpUriResponseCopyWith<$Res> {
  __$TotpUriResponseCopyWithImpl(this._self, this._then);

  final _TotpUriResponse _self;
  final $Res Function(_TotpUriResponse) _then;

/// Create a copy of TotpUriResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totpURI = null,}) {
  return _then(_TotpUriResponse(
totpURI: null == totpURI ? _self.totpURI : totpURI // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

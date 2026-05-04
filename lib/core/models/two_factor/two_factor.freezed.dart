// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'two_factor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TwoFactor {

 String get id; String get secret; String get backupCodes; String get userId;
/// Create a copy of TwoFactor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TwoFactorCopyWith<TwoFactor> get copyWith => _$TwoFactorCopyWithImpl<TwoFactor>(this as TwoFactor, _$identity);

  /// Serializes this TwoFactor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TwoFactor&&(identical(other.id, id) || other.id == id)&&(identical(other.secret, secret) || other.secret == secret)&&(identical(other.backupCodes, backupCodes) || other.backupCodes == backupCodes)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,secret,backupCodes,userId);

@override
String toString() {
  return 'TwoFactor(id: $id, secret: $secret, backupCodes: $backupCodes, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $TwoFactorCopyWith<$Res>  {
  factory $TwoFactorCopyWith(TwoFactor value, $Res Function(TwoFactor) _then) = _$TwoFactorCopyWithImpl;
@useResult
$Res call({
 String id, String secret, String backupCodes, String userId
});




}
/// @nodoc
class _$TwoFactorCopyWithImpl<$Res>
    implements $TwoFactorCopyWith<$Res> {
  _$TwoFactorCopyWithImpl(this._self, this._then);

  final TwoFactor _self;
  final $Res Function(TwoFactor) _then;

/// Create a copy of TwoFactor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? secret = null,Object? backupCodes = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,secret: null == secret ? _self.secret : secret // ignore: cast_nullable_to_non_nullable
as String,backupCodes: null == backupCodes ? _self.backupCodes : backupCodes // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TwoFactor].
extension TwoFactorPatterns on TwoFactor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TwoFactor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TwoFactor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TwoFactor value)  $default,){
final _that = this;
switch (_that) {
case _TwoFactor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TwoFactor value)?  $default,){
final _that = this;
switch (_that) {
case _TwoFactor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String secret,  String backupCodes,  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TwoFactor() when $default != null:
return $default(_that.id,_that.secret,_that.backupCodes,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String secret,  String backupCodes,  String userId)  $default,) {final _that = this;
switch (_that) {
case _TwoFactor():
return $default(_that.id,_that.secret,_that.backupCodes,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String secret,  String backupCodes,  String userId)?  $default,) {final _that = this;
switch (_that) {
case _TwoFactor() when $default != null:
return $default(_that.id,_that.secret,_that.backupCodes,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TwoFactor implements TwoFactor {
  const _TwoFactor({required this.id, required this.secret, required this.backupCodes, required this.userId});
  factory _TwoFactor.fromJson(Map<String, dynamic> json) => _$TwoFactorFromJson(json);

@override final  String id;
@override final  String secret;
@override final  String backupCodes;
@override final  String userId;

/// Create a copy of TwoFactor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TwoFactorCopyWith<_TwoFactor> get copyWith => __$TwoFactorCopyWithImpl<_TwoFactor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TwoFactorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TwoFactor&&(identical(other.id, id) || other.id == id)&&(identical(other.secret, secret) || other.secret == secret)&&(identical(other.backupCodes, backupCodes) || other.backupCodes == backupCodes)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,secret,backupCodes,userId);

@override
String toString() {
  return 'TwoFactor(id: $id, secret: $secret, backupCodes: $backupCodes, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$TwoFactorCopyWith<$Res> implements $TwoFactorCopyWith<$Res> {
  factory _$TwoFactorCopyWith(_TwoFactor value, $Res Function(_TwoFactor) _then) = __$TwoFactorCopyWithImpl;
@override @useResult
$Res call({
 String id, String secret, String backupCodes, String userId
});




}
/// @nodoc
class __$TwoFactorCopyWithImpl<$Res>
    implements _$TwoFactorCopyWith<$Res> {
  __$TwoFactorCopyWithImpl(this._self, this._then);

  final _TwoFactor _self;
  final $Res Function(_TwoFactor) _then;

/// Create a copy of TwoFactor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? secret = null,Object? backupCodes = null,Object? userId = null,}) {
  return _then(_TwoFactor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,secret: null == secret ? _self.secret : secret // ignore: cast_nullable_to_non_nullable
as String,backupCodes: null == backupCodes ? _self.backupCodes : backupCodes // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

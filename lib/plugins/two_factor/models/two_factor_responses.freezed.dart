// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'two_factor_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TwoFactorVerifyResponse {

 String? get token; User? get user; String? get message;
/// Create a copy of TwoFactorVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TwoFactorVerifyResponseCopyWith<TwoFactorVerifyResponse> get copyWith => _$TwoFactorVerifyResponseCopyWithImpl<TwoFactorVerifyResponse>(this as TwoFactorVerifyResponse, _$identity);

  /// Serializes this TwoFactorVerifyResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TwoFactorVerifyResponse&&(identical(other.token, token) || other.token == token)&&(identical(other.user, user) || other.user == user)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,user,message);

@override
String toString() {
  return 'TwoFactorVerifyResponse(token: $token, user: $user, message: $message)';
}


}

/// @nodoc
abstract mixin class $TwoFactorVerifyResponseCopyWith<$Res>  {
  factory $TwoFactorVerifyResponseCopyWith(TwoFactorVerifyResponse value, $Res Function(TwoFactorVerifyResponse) _then) = _$TwoFactorVerifyResponseCopyWithImpl;
@useResult
$Res call({
 String? token, User? user, String? message
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$TwoFactorVerifyResponseCopyWithImpl<$Res>
    implements $TwoFactorVerifyResponseCopyWith<$Res> {
  _$TwoFactorVerifyResponseCopyWithImpl(this._self, this._then);

  final TwoFactorVerifyResponse _self;
  final $Res Function(TwoFactorVerifyResponse) _then;

/// Create a copy of TwoFactorVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? user = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TwoFactorVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [TwoFactorVerifyResponse].
extension TwoFactorVerifyResponsePatterns on TwoFactorVerifyResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TwoFactorVerifyResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TwoFactorVerifyResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TwoFactorVerifyResponse value)  $default,){
final _that = this;
switch (_that) {
case _TwoFactorVerifyResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TwoFactorVerifyResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TwoFactorVerifyResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? token,  User? user,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TwoFactorVerifyResponse() when $default != null:
return $default(_that.token,_that.user,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? token,  User? user,  String? message)  $default,) {final _that = this;
switch (_that) {
case _TwoFactorVerifyResponse():
return $default(_that.token,_that.user,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? token,  User? user,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _TwoFactorVerifyResponse() when $default != null:
return $default(_that.token,_that.user,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TwoFactorVerifyResponse implements TwoFactorVerifyResponse {
  const _TwoFactorVerifyResponse({this.token, this.user, this.message});
  factory _TwoFactorVerifyResponse.fromJson(Map<String, dynamic> json) => _$TwoFactorVerifyResponseFromJson(json);

@override final  String? token;
@override final  User? user;
@override final  String? message;

/// Create a copy of TwoFactorVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TwoFactorVerifyResponseCopyWith<_TwoFactorVerifyResponse> get copyWith => __$TwoFactorVerifyResponseCopyWithImpl<_TwoFactorVerifyResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TwoFactorVerifyResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TwoFactorVerifyResponse&&(identical(other.token, token) || other.token == token)&&(identical(other.user, user) || other.user == user)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,user,message);

@override
String toString() {
  return 'TwoFactorVerifyResponse(token: $token, user: $user, message: $message)';
}


}

/// @nodoc
abstract mixin class _$TwoFactorVerifyResponseCopyWith<$Res> implements $TwoFactorVerifyResponseCopyWith<$Res> {
  factory _$TwoFactorVerifyResponseCopyWith(_TwoFactorVerifyResponse value, $Res Function(_TwoFactorVerifyResponse) _then) = __$TwoFactorVerifyResponseCopyWithImpl;
@override @useResult
$Res call({
 String? token, User? user, String? message
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$TwoFactorVerifyResponseCopyWithImpl<$Res>
    implements _$TwoFactorVerifyResponseCopyWith<$Res> {
  __$TwoFactorVerifyResponseCopyWithImpl(this._self, this._then);

  final _TwoFactorVerifyResponse _self;
  final $Res Function(_TwoFactorVerifyResponse) _then;

/// Create a copy of TwoFactorVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? user = freezed,Object? message = freezed,}) {
  return _then(_TwoFactorVerifyResponse(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TwoFactorVerifyResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$BackupCodesResponse {

 List<String> get backupCodes;
/// Create a copy of BackupCodesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackupCodesResponseCopyWith<BackupCodesResponse> get copyWith => _$BackupCodesResponseCopyWithImpl<BackupCodesResponse>(this as BackupCodesResponse, _$identity);

  /// Serializes this BackupCodesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackupCodesResponse&&const DeepCollectionEquality().equals(other.backupCodes, backupCodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(backupCodes));

@override
String toString() {
  return 'BackupCodesResponse(backupCodes: $backupCodes)';
}


}

/// @nodoc
abstract mixin class $BackupCodesResponseCopyWith<$Res>  {
  factory $BackupCodesResponseCopyWith(BackupCodesResponse value, $Res Function(BackupCodesResponse) _then) = _$BackupCodesResponseCopyWithImpl;
@useResult
$Res call({
 List<String> backupCodes
});




}
/// @nodoc
class _$BackupCodesResponseCopyWithImpl<$Res>
    implements $BackupCodesResponseCopyWith<$Res> {
  _$BackupCodesResponseCopyWithImpl(this._self, this._then);

  final BackupCodesResponse _self;
  final $Res Function(BackupCodesResponse) _then;

/// Create a copy of BackupCodesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backupCodes = null,}) {
  return _then(_self.copyWith(
backupCodes: null == backupCodes ? _self.backupCodes : backupCodes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [BackupCodesResponse].
extension BackupCodesResponsePatterns on BackupCodesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackupCodesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackupCodesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackupCodesResponse value)  $default,){
final _that = this;
switch (_that) {
case _BackupCodesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackupCodesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BackupCodesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> backupCodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackupCodesResponse() when $default != null:
return $default(_that.backupCodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> backupCodes)  $default,) {final _that = this;
switch (_that) {
case _BackupCodesResponse():
return $default(_that.backupCodes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> backupCodes)?  $default,) {final _that = this;
switch (_that) {
case _BackupCodesResponse() when $default != null:
return $default(_that.backupCodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BackupCodesResponse implements BackupCodesResponse {
  const _BackupCodesResponse({required final  List<String> backupCodes}): _backupCodes = backupCodes;
  factory _BackupCodesResponse.fromJson(Map<String, dynamic> json) => _$BackupCodesResponseFromJson(json);

 final  List<String> _backupCodes;
@override List<String> get backupCodes {
  if (_backupCodes is EqualUnmodifiableListView) return _backupCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_backupCodes);
}


/// Create a copy of BackupCodesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackupCodesResponseCopyWith<_BackupCodesResponse> get copyWith => __$BackupCodesResponseCopyWithImpl<_BackupCodesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BackupCodesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackupCodesResponse&&const DeepCollectionEquality().equals(other._backupCodes, _backupCodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_backupCodes));

@override
String toString() {
  return 'BackupCodesResponse(backupCodes: $backupCodes)';
}


}

/// @nodoc
abstract mixin class _$BackupCodesResponseCopyWith<$Res> implements $BackupCodesResponseCopyWith<$Res> {
  factory _$BackupCodesResponseCopyWith(_BackupCodesResponse value, $Res Function(_BackupCodesResponse) _then) = __$BackupCodesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<String> backupCodes
});




}
/// @nodoc
class __$BackupCodesResponseCopyWithImpl<$Res>
    implements _$BackupCodesResponseCopyWith<$Res> {
  __$BackupCodesResponseCopyWithImpl(this._self, this._then);

  final _BackupCodesResponse _self;
  final $Res Function(_BackupCodesResponse) _then;

/// Create a copy of BackupCodesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backupCodes = null,}) {
  return _then(_BackupCodesResponse(
backupCodes: null == backupCodes ? _self._backupCodes : backupCodes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

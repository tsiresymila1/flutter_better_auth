// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_wrapper_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserWrapperResponse {

 User get user;
/// Create a copy of UserWrapperResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserWrapperResponseCopyWith<UserWrapperResponse> get copyWith => _$UserWrapperResponseCopyWithImpl<UserWrapperResponse>(this as UserWrapperResponse, _$identity);

  /// Serializes this UserWrapperResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserWrapperResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserWrapperResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class $UserWrapperResponseCopyWith<$Res>  {
  factory $UserWrapperResponseCopyWith(UserWrapperResponse value, $Res Function(UserWrapperResponse) _then) = _$UserWrapperResponseCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$UserWrapperResponseCopyWithImpl<$Res>
    implements $UserWrapperResponseCopyWith<$Res> {
  _$UserWrapperResponseCopyWithImpl(this._self, this._then);

  final UserWrapperResponse _self;
  final $Res Function(UserWrapperResponse) _then;

/// Create a copy of UserWrapperResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of UserWrapperResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserWrapperResponse].
extension UserWrapperResponsePatterns on UserWrapperResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserWrapperResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserWrapperResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserWrapperResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserWrapperResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserWrapperResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserWrapperResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserWrapperResponse() when $default != null:
return $default(_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User user)  $default,) {final _that = this;
switch (_that) {
case _UserWrapperResponse():
return $default(_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User user)?  $default,) {final _that = this;
switch (_that) {
case _UserWrapperResponse() when $default != null:
return $default(_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserWrapperResponse implements UserWrapperResponse {
  const _UserWrapperResponse({required this.user});
  factory _UserWrapperResponse.fromJson(Map<String, dynamic> json) => _$UserWrapperResponseFromJson(json);

@override final  User user;

/// Create a copy of UserWrapperResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserWrapperResponseCopyWith<_UserWrapperResponse> get copyWith => __$UserWrapperResponseCopyWithImpl<_UserWrapperResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserWrapperResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserWrapperResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'UserWrapperResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class _$UserWrapperResponseCopyWith<$Res> implements $UserWrapperResponseCopyWith<$Res> {
  factory _$UserWrapperResponseCopyWith(_UserWrapperResponse value, $Res Function(_UserWrapperResponse) _then) = __$UserWrapperResponseCopyWithImpl;
@override @useResult
$Res call({
 User user
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$UserWrapperResponseCopyWithImpl<$Res>
    implements _$UserWrapperResponseCopyWith<$Res> {
  __$UserWrapperResponseCopyWithImpl(this._self, this._then);

  final _UserWrapperResponse _self;
  final $Res Function(_UserWrapperResponse) _then;

/// Create a copy of UserWrapperResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_UserWrapperResponse(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of UserWrapperResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on

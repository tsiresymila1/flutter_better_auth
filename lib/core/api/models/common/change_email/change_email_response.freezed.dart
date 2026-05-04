// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_email_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangeEmailResponse {

 User? get user; bool get status; String? get message;
/// Create a copy of ChangeEmailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeEmailResponseCopyWith<ChangeEmailResponse> get copyWith => _$ChangeEmailResponseCopyWithImpl<ChangeEmailResponse>(this as ChangeEmailResponse, _$identity);

  /// Serializes this ChangeEmailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeEmailResponse&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,status,message);

@override
String toString() {
  return 'ChangeEmailResponse(user: $user, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class $ChangeEmailResponseCopyWith<$Res>  {
  factory $ChangeEmailResponseCopyWith(ChangeEmailResponse value, $Res Function(ChangeEmailResponse) _then) = _$ChangeEmailResponseCopyWithImpl;
@useResult
$Res call({
 User? user, bool status, String? message
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$ChangeEmailResponseCopyWithImpl<$Res>
    implements $ChangeEmailResponseCopyWith<$Res> {
  _$ChangeEmailResponseCopyWithImpl(this._self, this._then);

  final ChangeEmailResponse _self;
  final $Res Function(ChangeEmailResponse) _then;

/// Create a copy of ChangeEmailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? status = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ChangeEmailResponse
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


/// Adds pattern-matching-related methods to [ChangeEmailResponse].
extension ChangeEmailResponsePatterns on ChangeEmailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeEmailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeEmailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeEmailResponse value)  $default,){
final _that = this;
switch (_that) {
case _ChangeEmailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeEmailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeEmailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( User? user,  bool status,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeEmailResponse() when $default != null:
return $default(_that.user,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( User? user,  bool status,  String? message)  $default,) {final _that = this;
switch (_that) {
case _ChangeEmailResponse():
return $default(_that.user,_that.status,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( User? user,  bool status,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _ChangeEmailResponse() when $default != null:
return $default(_that.user,_that.status,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangeEmailResponse implements ChangeEmailResponse {
  const _ChangeEmailResponse({this.user, required this.status, this.message});
  factory _ChangeEmailResponse.fromJson(Map<String, dynamic> json) => _$ChangeEmailResponseFromJson(json);

@override final  User? user;
@override final  bool status;
@override final  String? message;

/// Create a copy of ChangeEmailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeEmailResponseCopyWith<_ChangeEmailResponse> get copyWith => __$ChangeEmailResponseCopyWithImpl<_ChangeEmailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangeEmailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeEmailResponse&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,status,message);

@override
String toString() {
  return 'ChangeEmailResponse(user: $user, status: $status, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ChangeEmailResponseCopyWith<$Res> implements $ChangeEmailResponseCopyWith<$Res> {
  factory _$ChangeEmailResponseCopyWith(_ChangeEmailResponse value, $Res Function(_ChangeEmailResponse) _then) = __$ChangeEmailResponseCopyWithImpl;
@override @useResult
$Res call({
 User? user, bool status, String? message
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ChangeEmailResponseCopyWithImpl<$Res>
    implements _$ChangeEmailResponseCopyWith<$Res> {
  __$ChangeEmailResponseCopyWithImpl(this._self, this._then);

  final _ChangeEmailResponse _self;
  final $Res Function(_ChangeEmailResponse) _then;

/// Create a copy of ChangeEmailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? status = null,Object? message = freezed,}) {
  return _then(_ChangeEmailResponse(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ChangeEmailResponse
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

// dart format on

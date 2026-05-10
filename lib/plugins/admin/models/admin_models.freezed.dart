// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminUserResponse {

 User get user;
/// Create a copy of AdminUserResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserResponseCopyWith<AdminUserResponse> get copyWith => _$AdminUserResponseCopyWithImpl<AdminUserResponse>(this as AdminUserResponse, _$identity);

  /// Serializes this AdminUserResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUserResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AdminUserResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class $AdminUserResponseCopyWith<$Res>  {
  factory $AdminUserResponseCopyWith(AdminUserResponse value, $Res Function(AdminUserResponse) _then) = _$AdminUserResponseCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AdminUserResponseCopyWithImpl<$Res>
    implements $AdminUserResponseCopyWith<$Res> {
  _$AdminUserResponseCopyWithImpl(this._self, this._then);

  final AdminUserResponse _self;
  final $Res Function(AdminUserResponse) _then;

/// Create a copy of AdminUserResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of AdminUserResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AdminUserResponse].
extension AdminUserResponsePatterns on AdminUserResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUserResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUserResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUserResponse value)  $default,){
final _that = this;
switch (_that) {
case _AdminUserResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUserResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUserResponse() when $default != null:
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
case _AdminUserResponse() when $default != null:
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
case _AdminUserResponse():
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
case _AdminUserResponse() when $default != null:
return $default(_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUserResponse implements AdminUserResponse {
  const _AdminUserResponse({required this.user});
  factory _AdminUserResponse.fromJson(Map<String, dynamic> json) => _$AdminUserResponseFromJson(json);

@override final  User user;

/// Create a copy of AdminUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserResponseCopyWith<_AdminUserResponse> get copyWith => __$AdminUserResponseCopyWithImpl<_AdminUserResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUserResponse&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AdminUserResponse(user: $user)';
}


}

/// @nodoc
abstract mixin class _$AdminUserResponseCopyWith<$Res> implements $AdminUserResponseCopyWith<$Res> {
  factory _$AdminUserResponseCopyWith(_AdminUserResponse value, $Res Function(_AdminUserResponse) _then) = __$AdminUserResponseCopyWithImpl;
@override @useResult
$Res call({
 User user
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$AdminUserResponseCopyWithImpl<$Res>
    implements _$AdminUserResponseCopyWith<$Res> {
  __$AdminUserResponseCopyWithImpl(this._self, this._then);

  final _AdminUserResponse _self;
  final $Res Function(_AdminUserResponse) _then;

/// Create a copy of AdminUserResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(_AdminUserResponse(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AdminUserResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$AdminUserListResponse {

 List<User> get users; double get total;
/// Create a copy of AdminUserListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserListResponseCopyWith<AdminUserListResponse> get copyWith => _$AdminUserListResponseCopyWithImpl<AdminUserListResponse>(this as AdminUserListResponse, _$identity);

  /// Serializes this AdminUserListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUserListResponse&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),total);

@override
String toString() {
  return 'AdminUserListResponse(users: $users, total: $total)';
}


}

/// @nodoc
abstract mixin class $AdminUserListResponseCopyWith<$Res>  {
  factory $AdminUserListResponseCopyWith(AdminUserListResponse value, $Res Function(AdminUserListResponse) _then) = _$AdminUserListResponseCopyWithImpl;
@useResult
$Res call({
 List<User> users, double total
});




}
/// @nodoc
class _$AdminUserListResponseCopyWithImpl<$Res>
    implements $AdminUserListResponseCopyWith<$Res> {
  _$AdminUserListResponseCopyWithImpl(this._self, this._then);

  final AdminUserListResponse _self;
  final $Res Function(AdminUserListResponse) _then;

/// Create a copy of AdminUserListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? total = null,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<User>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminUserListResponse].
extension AdminUserListResponsePatterns on AdminUserListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUserListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUserListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUserListResponse value)  $default,){
final _that = this;
switch (_that) {
case _AdminUserListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUserListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUserListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<User> users,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminUserListResponse() when $default != null:
return $default(_that.users,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<User> users,  double total)  $default,) {final _that = this;
switch (_that) {
case _AdminUserListResponse():
return $default(_that.users,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<User> users,  double total)?  $default,) {final _that = this;
switch (_that) {
case _AdminUserListResponse() when $default != null:
return $default(_that.users,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUserListResponse implements AdminUserListResponse {
  const _AdminUserListResponse({required final  List<User> users, required this.total}): _users = users;
  factory _AdminUserListResponse.fromJson(Map<String, dynamic> json) => _$AdminUserListResponseFromJson(json);

 final  List<User> _users;
@override List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override final  double total;

/// Create a copy of AdminUserListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserListResponseCopyWith<_AdminUserListResponse> get copyWith => __$AdminUserListResponseCopyWithImpl<_AdminUserListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUserListResponse&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),total);

@override
String toString() {
  return 'AdminUserListResponse(users: $users, total: $total)';
}


}

/// @nodoc
abstract mixin class _$AdminUserListResponseCopyWith<$Res> implements $AdminUserListResponseCopyWith<$Res> {
  factory _$AdminUserListResponseCopyWith(_AdminUserListResponse value, $Res Function(_AdminUserListResponse) _then) = __$AdminUserListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<User> users, double total
});




}
/// @nodoc
class __$AdminUserListResponseCopyWithImpl<$Res>
    implements _$AdminUserListResponseCopyWith<$Res> {
  __$AdminUserListResponseCopyWithImpl(this._self, this._then);

  final _AdminUserListResponse _self;
  final $Res Function(_AdminUserListResponse) _then;

/// Create a copy of AdminUserListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? total = null,}) {
  return _then(_AdminUserListResponse(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$AdminSessionListResponse {

 List<Session> get sessions;
/// Create a copy of AdminSessionListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminSessionListResponseCopyWith<AdminSessionListResponse> get copyWith => _$AdminSessionListResponseCopyWithImpl<AdminSessionListResponse>(this as AdminSessionListResponse, _$identity);

  /// Serializes this AdminSessionListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminSessionListResponse&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'AdminSessionListResponse(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $AdminSessionListResponseCopyWith<$Res>  {
  factory $AdminSessionListResponseCopyWith(AdminSessionListResponse value, $Res Function(AdminSessionListResponse) _then) = _$AdminSessionListResponseCopyWithImpl;
@useResult
$Res call({
 List<Session> sessions
});




}
/// @nodoc
class _$AdminSessionListResponseCopyWithImpl<$Res>
    implements $AdminSessionListResponseCopyWith<$Res> {
  _$AdminSessionListResponseCopyWithImpl(this._self, this._then);

  final AdminSessionListResponse _self;
  final $Res Function(AdminSessionListResponse) _then;

/// Create a copy of AdminSessionListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminSessionListResponse].
extension AdminSessionListResponsePatterns on AdminSessionListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminSessionListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminSessionListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminSessionListResponse value)  $default,){
final _that = this;
switch (_that) {
case _AdminSessionListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminSessionListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AdminSessionListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Session> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminSessionListResponse() when $default != null:
return $default(_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Session> sessions)  $default,) {final _that = this;
switch (_that) {
case _AdminSessionListResponse():
return $default(_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Session> sessions)?  $default,) {final _that = this;
switch (_that) {
case _AdminSessionListResponse() when $default != null:
return $default(_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminSessionListResponse implements AdminSessionListResponse {
  const _AdminSessionListResponse({required final  List<Session> sessions}): _sessions = sessions;
  factory _AdminSessionListResponse.fromJson(Map<String, dynamic> json) => _$AdminSessionListResponseFromJson(json);

 final  List<Session> _sessions;
@override List<Session> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of AdminSessionListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminSessionListResponseCopyWith<_AdminSessionListResponse> get copyWith => __$AdminSessionListResponseCopyWithImpl<_AdminSessionListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminSessionListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminSessionListResponse&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'AdminSessionListResponse(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$AdminSessionListResponseCopyWith<$Res> implements $AdminSessionListResponseCopyWith<$Res> {
  factory _$AdminSessionListResponseCopyWith(_AdminSessionListResponse value, $Res Function(_AdminSessionListResponse) _then) = __$AdminSessionListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Session> sessions
});




}
/// @nodoc
class __$AdminSessionListResponseCopyWithImpl<$Res>
    implements _$AdminSessionListResponseCopyWith<$Res> {
  __$AdminSessionListResponseCopyWithImpl(this._self, this._then);

  final _AdminSessionListResponse _self;
  final $Res Function(_AdminSessionListResponse) _then;

/// Create a copy of AdminSessionListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,}) {
  return _then(_AdminSessionListResponse(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,
  ));
}


}


/// @nodoc
mixin _$CheckPermissionResponse {

 bool get success; String? get error;
/// Create a copy of CheckPermissionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckPermissionResponseCopyWith<CheckPermissionResponse> get copyWith => _$CheckPermissionResponseCopyWithImpl<CheckPermissionResponse>(this as CheckPermissionResponse, _$identity);

  /// Serializes this CheckPermissionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckPermissionResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,error);

@override
String toString() {
  return 'CheckPermissionResponse(success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class $CheckPermissionResponseCopyWith<$Res>  {
  factory $CheckPermissionResponseCopyWith(CheckPermissionResponse value, $Res Function(CheckPermissionResponse) _then) = _$CheckPermissionResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String? error
});




}
/// @nodoc
class _$CheckPermissionResponseCopyWithImpl<$Res>
    implements $CheckPermissionResponseCopyWith<$Res> {
  _$CheckPermissionResponseCopyWithImpl(this._self, this._then);

  final CheckPermissionResponse _self;
  final $Res Function(CheckPermissionResponse) _then;

/// Create a copy of CheckPermissionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckPermissionResponse].
extension CheckPermissionResponsePatterns on CheckPermissionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckPermissionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckPermissionResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckPermissionResponse value)  $default,){
final _that = this;
switch (_that) {
case _CheckPermissionResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckPermissionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CheckPermissionResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckPermissionResponse() when $default != null:
return $default(_that.success,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String? error)  $default,) {final _that = this;
switch (_that) {
case _CheckPermissionResponse():
return $default(_that.success,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _CheckPermissionResponse() when $default != null:
return $default(_that.success,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckPermissionResponse implements CheckPermissionResponse {
  const _CheckPermissionResponse({required this.success, this.error});
  factory _CheckPermissionResponse.fromJson(Map<String, dynamic> json) => _$CheckPermissionResponseFromJson(json);

@override final  bool success;
@override final  String? error;

/// Create a copy of CheckPermissionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckPermissionResponseCopyWith<_CheckPermissionResponse> get copyWith => __$CheckPermissionResponseCopyWithImpl<_CheckPermissionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckPermissionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckPermissionResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,error);

@override
String toString() {
  return 'CheckPermissionResponse(success: $success, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CheckPermissionResponseCopyWith<$Res> implements $CheckPermissionResponseCopyWith<$Res> {
  factory _$CheckPermissionResponseCopyWith(_CheckPermissionResponse value, $Res Function(_CheckPermissionResponse) _then) = __$CheckPermissionResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String? error
});




}
/// @nodoc
class __$CheckPermissionResponseCopyWithImpl<$Res>
    implements _$CheckPermissionResponseCopyWith<$Res> {
  __$CheckPermissionResponseCopyWithImpl(this._self, this._then);

  final _CheckPermissionResponse _self;
  final $Res Function(_CheckPermissionResponse) _then;

/// Create a copy of CheckPermissionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? error = freezed,}) {
  return _then(_CheckPermissionResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

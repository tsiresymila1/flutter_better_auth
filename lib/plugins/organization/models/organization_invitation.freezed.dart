// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrganizationInvitation {

 String get id; String get email; String? get role; String get organizationId; String get inviterId; String get status; DateTime? get expiresAt; DateTime? get createdAt; String? get organizationName; String? get organizationSlug; String? get inviterEmail; List<String>? get teamIds;
/// Create a copy of OrganizationInvitation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationInvitationCopyWith<OrganizationInvitation> get copyWith => _$OrganizationInvitationCopyWithImpl<OrganizationInvitation>(this as OrganizationInvitation, _$identity);

  /// Serializes this OrganizationInvitation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrganizationInvitation&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.inviterId, inviterId) || other.inviterId == inviterId)&&(identical(other.status, status) || other.status == status)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName)&&(identical(other.organizationSlug, organizationSlug) || other.organizationSlug == organizationSlug)&&(identical(other.inviterEmail, inviterEmail) || other.inviterEmail == inviterEmail)&&const DeepCollectionEquality().equals(other.teamIds, teamIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,organizationId,inviterId,status,expiresAt,createdAt,organizationName,organizationSlug,inviterEmail,const DeepCollectionEquality().hash(teamIds));

@override
String toString() {
  return 'OrganizationInvitation(id: $id, email: $email, role: $role, organizationId: $organizationId, inviterId: $inviterId, status: $status, expiresAt: $expiresAt, createdAt: $createdAt, organizationName: $organizationName, organizationSlug: $organizationSlug, inviterEmail: $inviterEmail, teamIds: $teamIds)';
}


}

/// @nodoc
abstract mixin class $OrganizationInvitationCopyWith<$Res>  {
  factory $OrganizationInvitationCopyWith(OrganizationInvitation value, $Res Function(OrganizationInvitation) _then) = _$OrganizationInvitationCopyWithImpl;
@useResult
$Res call({
 String id, String email, String? role, String organizationId, String inviterId, String status, DateTime? expiresAt, DateTime? createdAt, String? organizationName, String? organizationSlug, String? inviterEmail, List<String>? teamIds
});




}
/// @nodoc
class _$OrganizationInvitationCopyWithImpl<$Res>
    implements $OrganizationInvitationCopyWith<$Res> {
  _$OrganizationInvitationCopyWithImpl(this._self, this._then);

  final OrganizationInvitation _self;
  final $Res Function(OrganizationInvitation) _then;

/// Create a copy of OrganizationInvitation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? role = freezed,Object? organizationId = null,Object? inviterId = null,Object? status = null,Object? expiresAt = freezed,Object? createdAt = freezed,Object? organizationName = freezed,Object? organizationSlug = freezed,Object? inviterEmail = freezed,Object? teamIds = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,inviterId: null == inviterId ? _self.inviterId : inviterId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,organizationName: freezed == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String?,organizationSlug: freezed == organizationSlug ? _self.organizationSlug : organizationSlug // ignore: cast_nullable_to_non_nullable
as String?,inviterEmail: freezed == inviterEmail ? _self.inviterEmail : inviterEmail // ignore: cast_nullable_to_non_nullable
as String?,teamIds: freezed == teamIds ? _self.teamIds : teamIds // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrganizationInvitation].
extension OrganizationInvitationPatterns on OrganizationInvitation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrganizationInvitation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrganizationInvitation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrganizationInvitation value)  $default,){
final _that = this;
switch (_that) {
case _OrganizationInvitation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrganizationInvitation value)?  $default,){
final _that = this;
switch (_that) {
case _OrganizationInvitation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String? role,  String organizationId,  String inviterId,  String status,  DateTime? expiresAt,  DateTime? createdAt,  String? organizationName,  String? organizationSlug,  String? inviterEmail,  List<String>? teamIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrganizationInvitation() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.organizationId,_that.inviterId,_that.status,_that.expiresAt,_that.createdAt,_that.organizationName,_that.organizationSlug,_that.inviterEmail,_that.teamIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String? role,  String organizationId,  String inviterId,  String status,  DateTime? expiresAt,  DateTime? createdAt,  String? organizationName,  String? organizationSlug,  String? inviterEmail,  List<String>? teamIds)  $default,) {final _that = this;
switch (_that) {
case _OrganizationInvitation():
return $default(_that.id,_that.email,_that.role,_that.organizationId,_that.inviterId,_that.status,_that.expiresAt,_that.createdAt,_that.organizationName,_that.organizationSlug,_that.inviterEmail,_that.teamIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String? role,  String organizationId,  String inviterId,  String status,  DateTime? expiresAt,  DateTime? createdAt,  String? organizationName,  String? organizationSlug,  String? inviterEmail,  List<String>? teamIds)?  $default,) {final _that = this;
switch (_that) {
case _OrganizationInvitation() when $default != null:
return $default(_that.id,_that.email,_that.role,_that.organizationId,_that.inviterId,_that.status,_that.expiresAt,_that.createdAt,_that.organizationName,_that.organizationSlug,_that.inviterEmail,_that.teamIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrganizationInvitation implements OrganizationInvitation {
  const _OrganizationInvitation({required this.id, required this.email, this.role, required this.organizationId, required this.inviterId, required this.status, this.expiresAt, this.createdAt, this.organizationName, this.organizationSlug, this.inviterEmail, final  List<String>? teamIds}): _teamIds = teamIds;
  factory _OrganizationInvitation.fromJson(Map<String, dynamic> json) => _$OrganizationInvitationFromJson(json);

@override final  String id;
@override final  String email;
@override final  String? role;
@override final  String organizationId;
@override final  String inviterId;
@override final  String status;
@override final  DateTime? expiresAt;
@override final  DateTime? createdAt;
@override final  String? organizationName;
@override final  String? organizationSlug;
@override final  String? inviterEmail;
 final  List<String>? _teamIds;
@override List<String>? get teamIds {
  final value = _teamIds;
  if (value == null) return null;
  if (_teamIds is EqualUnmodifiableListView) return _teamIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OrganizationInvitation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationInvitationCopyWith<_OrganizationInvitation> get copyWith => __$OrganizationInvitationCopyWithImpl<_OrganizationInvitation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrganizationInvitationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrganizationInvitation&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.inviterId, inviterId) || other.inviterId == inviterId)&&(identical(other.status, status) || other.status == status)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.organizationName, organizationName) || other.organizationName == organizationName)&&(identical(other.organizationSlug, organizationSlug) || other.organizationSlug == organizationSlug)&&(identical(other.inviterEmail, inviterEmail) || other.inviterEmail == inviterEmail)&&const DeepCollectionEquality().equals(other._teamIds, _teamIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,role,organizationId,inviterId,status,expiresAt,createdAt,organizationName,organizationSlug,inviterEmail,const DeepCollectionEquality().hash(_teamIds));

@override
String toString() {
  return 'OrganizationInvitation(id: $id, email: $email, role: $role, organizationId: $organizationId, inviterId: $inviterId, status: $status, expiresAt: $expiresAt, createdAt: $createdAt, organizationName: $organizationName, organizationSlug: $organizationSlug, inviterEmail: $inviterEmail, teamIds: $teamIds)';
}


}

/// @nodoc
abstract mixin class _$OrganizationInvitationCopyWith<$Res> implements $OrganizationInvitationCopyWith<$Res> {
  factory _$OrganizationInvitationCopyWith(_OrganizationInvitation value, $Res Function(_OrganizationInvitation) _then) = __$OrganizationInvitationCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String? role, String organizationId, String inviterId, String status, DateTime? expiresAt, DateTime? createdAt, String? organizationName, String? organizationSlug, String? inviterEmail, List<String>? teamIds
});




}
/// @nodoc
class __$OrganizationInvitationCopyWithImpl<$Res>
    implements _$OrganizationInvitationCopyWith<$Res> {
  __$OrganizationInvitationCopyWithImpl(this._self, this._then);

  final _OrganizationInvitation _self;
  final $Res Function(_OrganizationInvitation) _then;

/// Create a copy of OrganizationInvitation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? role = freezed,Object? organizationId = null,Object? inviterId = null,Object? status = null,Object? expiresAt = freezed,Object? createdAt = freezed,Object? organizationName = freezed,Object? organizationSlug = freezed,Object? inviterEmail = freezed,Object? teamIds = freezed,}) {
  return _then(_OrganizationInvitation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,organizationId: null == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String,inviterId: null == inviterId ? _self.inviterId : inviterId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,organizationName: freezed == organizationName ? _self.organizationName : organizationName // ignore: cast_nullable_to_non_nullable
as String?,organizationSlug: freezed == organizationSlug ? _self.organizationSlug : organizationSlug // ignore: cast_nullable_to_non_nullable
as String?,inviterEmail: freezed == inviterEmail ? _self.inviterEmail : inviterEmail // ignore: cast_nullable_to_non_nullable
as String?,teamIds: freezed == teamIds ? _self._teamIds : teamIds // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiKey {

 String get id; String? get name; String? get start; String? get prefix; String? get key; String get userId; bool get enabled; DateTime? get expiresAt; DateTime get createdAt; DateTime? get updatedAt; DateTime? get lastRefillAt; DateTime? get lastRequest; Map<String, dynamic>? get metadata; double? get rateLimitMax; double? get rateLimitTimeWindow; double? get remaining; double? get refillAmount; double? get refillInterval; bool? get rateLimitEnabled; double? get requestCount; String? get permissions;
/// Create a copy of ApiKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiKeyCopyWith<ApiKey> get copyWith => _$ApiKeyCopyWithImpl<ApiKey>(this as ApiKey, _$identity);

  /// Serializes this ApiKey to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiKey&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.start, start) || other.start == start)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.key, key) || other.key == key)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastRefillAt, lastRefillAt) || other.lastRefillAt == lastRefillAt)&&(identical(other.lastRequest, lastRequest) || other.lastRequest == lastRequest)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.rateLimitMax, rateLimitMax) || other.rateLimitMax == rateLimitMax)&&(identical(other.rateLimitTimeWindow, rateLimitTimeWindow) || other.rateLimitTimeWindow == rateLimitTimeWindow)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.refillAmount, refillAmount) || other.refillAmount == refillAmount)&&(identical(other.refillInterval, refillInterval) || other.refillInterval == refillInterval)&&(identical(other.rateLimitEnabled, rateLimitEnabled) || other.rateLimitEnabled == rateLimitEnabled)&&(identical(other.requestCount, requestCount) || other.requestCount == requestCount)&&(identical(other.permissions, permissions) || other.permissions == permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,start,prefix,key,userId,enabled,expiresAt,createdAt,updatedAt,lastRefillAt,lastRequest,const DeepCollectionEquality().hash(metadata),rateLimitMax,rateLimitTimeWindow,remaining,refillAmount,refillInterval,rateLimitEnabled,requestCount,permissions]);

@override
String toString() {
  return 'ApiKey(id: $id, name: $name, start: $start, prefix: $prefix, key: $key, userId: $userId, enabled: $enabled, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt, lastRefillAt: $lastRefillAt, lastRequest: $lastRequest, metadata: $metadata, rateLimitMax: $rateLimitMax, rateLimitTimeWindow: $rateLimitTimeWindow, remaining: $remaining, refillAmount: $refillAmount, refillInterval: $refillInterval, rateLimitEnabled: $rateLimitEnabled, requestCount: $requestCount, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $ApiKeyCopyWith<$Res>  {
  factory $ApiKeyCopyWith(ApiKey value, $Res Function(ApiKey) _then) = _$ApiKeyCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? start, String? prefix, String? key, String userId, bool enabled, DateTime? expiresAt, DateTime createdAt, DateTime? updatedAt, DateTime? lastRefillAt, DateTime? lastRequest, Map<String, dynamic>? metadata, double? rateLimitMax, double? rateLimitTimeWindow, double? remaining, double? refillAmount, double? refillInterval, bool? rateLimitEnabled, double? requestCount, String? permissions
});




}
/// @nodoc
class _$ApiKeyCopyWithImpl<$Res>
    implements $ApiKeyCopyWith<$Res> {
  _$ApiKeyCopyWithImpl(this._self, this._then);

  final ApiKey _self;
  final $Res Function(ApiKey) _then;

/// Create a copy of ApiKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? start = freezed,Object? prefix = freezed,Object? key = freezed,Object? userId = null,Object? enabled = null,Object? expiresAt = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? lastRefillAt = freezed,Object? lastRequest = freezed,Object? metadata = freezed,Object? rateLimitMax = freezed,Object? rateLimitTimeWindow = freezed,Object? remaining = freezed,Object? refillAmount = freezed,Object? refillInterval = freezed,Object? rateLimitEnabled = freezed,Object? requestCount = freezed,Object? permissions = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastRefillAt: freezed == lastRefillAt ? _self.lastRefillAt : lastRefillAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastRequest: freezed == lastRequest ? _self.lastRequest : lastRequest // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,rateLimitMax: freezed == rateLimitMax ? _self.rateLimitMax : rateLimitMax // ignore: cast_nullable_to_non_nullable
as double?,rateLimitTimeWindow: freezed == rateLimitTimeWindow ? _self.rateLimitTimeWindow : rateLimitTimeWindow // ignore: cast_nullable_to_non_nullable
as double?,remaining: freezed == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double?,refillAmount: freezed == refillAmount ? _self.refillAmount : refillAmount // ignore: cast_nullable_to_non_nullable
as double?,refillInterval: freezed == refillInterval ? _self.refillInterval : refillInterval // ignore: cast_nullable_to_non_nullable
as double?,rateLimitEnabled: freezed == rateLimitEnabled ? _self.rateLimitEnabled : rateLimitEnabled // ignore: cast_nullable_to_non_nullable
as bool?,requestCount: freezed == requestCount ? _self.requestCount : requestCount // ignore: cast_nullable_to_non_nullable
as double?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiKey].
extension ApiKeyPatterns on ApiKey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiKey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiKey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiKey value)  $default,){
final _that = this;
switch (_that) {
case _ApiKey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiKey value)?  $default,){
final _that = this;
switch (_that) {
case _ApiKey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? start,  String? prefix,  String? key,  String userId,  bool enabled,  DateTime? expiresAt,  DateTime createdAt,  DateTime? updatedAt,  DateTime? lastRefillAt,  DateTime? lastRequest,  Map<String, dynamic>? metadata,  double? rateLimitMax,  double? rateLimitTimeWindow,  double? remaining,  double? refillAmount,  double? refillInterval,  bool? rateLimitEnabled,  double? requestCount,  String? permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiKey() when $default != null:
return $default(_that.id,_that.name,_that.start,_that.prefix,_that.key,_that.userId,_that.enabled,_that.expiresAt,_that.createdAt,_that.updatedAt,_that.lastRefillAt,_that.lastRequest,_that.metadata,_that.rateLimitMax,_that.rateLimitTimeWindow,_that.remaining,_that.refillAmount,_that.refillInterval,_that.rateLimitEnabled,_that.requestCount,_that.permissions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? start,  String? prefix,  String? key,  String userId,  bool enabled,  DateTime? expiresAt,  DateTime createdAt,  DateTime? updatedAt,  DateTime? lastRefillAt,  DateTime? lastRequest,  Map<String, dynamic>? metadata,  double? rateLimitMax,  double? rateLimitTimeWindow,  double? remaining,  double? refillAmount,  double? refillInterval,  bool? rateLimitEnabled,  double? requestCount,  String? permissions)  $default,) {final _that = this;
switch (_that) {
case _ApiKey():
return $default(_that.id,_that.name,_that.start,_that.prefix,_that.key,_that.userId,_that.enabled,_that.expiresAt,_that.createdAt,_that.updatedAt,_that.lastRefillAt,_that.lastRequest,_that.metadata,_that.rateLimitMax,_that.rateLimitTimeWindow,_that.remaining,_that.refillAmount,_that.refillInterval,_that.rateLimitEnabled,_that.requestCount,_that.permissions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? start,  String? prefix,  String? key,  String userId,  bool enabled,  DateTime? expiresAt,  DateTime createdAt,  DateTime? updatedAt,  DateTime? lastRefillAt,  DateTime? lastRequest,  Map<String, dynamic>? metadata,  double? rateLimitMax,  double? rateLimitTimeWindow,  double? remaining,  double? refillAmount,  double? refillInterval,  bool? rateLimitEnabled,  double? requestCount,  String? permissions)?  $default,) {final _that = this;
switch (_that) {
case _ApiKey() when $default != null:
return $default(_that.id,_that.name,_that.start,_that.prefix,_that.key,_that.userId,_that.enabled,_that.expiresAt,_that.createdAt,_that.updatedAt,_that.lastRefillAt,_that.lastRequest,_that.metadata,_that.rateLimitMax,_that.rateLimitTimeWindow,_that.remaining,_that.refillAmount,_that.refillInterval,_that.rateLimitEnabled,_that.requestCount,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiKey implements ApiKey {
  const _ApiKey({required this.id, this.name, this.start, this.prefix, this.key, required this.userId, this.enabled = true, this.expiresAt, required this.createdAt, this.updatedAt, this.lastRefillAt, this.lastRequest, final  Map<String, dynamic>? metadata, this.rateLimitMax, this.rateLimitTimeWindow, this.remaining, this.refillAmount, this.refillInterval, this.rateLimitEnabled, this.requestCount, this.permissions}): _metadata = metadata;
  factory _ApiKey.fromJson(Map<String, dynamic> json) => _$ApiKeyFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? start;
@override final  String? prefix;
@override final  String? key;
@override final  String userId;
@override@JsonKey() final  bool enabled;
@override final  DateTime? expiresAt;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;
@override final  DateTime? lastRefillAt;
@override final  DateTime? lastRequest;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  double? rateLimitMax;
@override final  double? rateLimitTimeWindow;
@override final  double? remaining;
@override final  double? refillAmount;
@override final  double? refillInterval;
@override final  bool? rateLimitEnabled;
@override final  double? requestCount;
@override final  String? permissions;

/// Create a copy of ApiKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiKeyCopyWith<_ApiKey> get copyWith => __$ApiKeyCopyWithImpl<_ApiKey>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiKeyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiKey&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.start, start) || other.start == start)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.key, key) || other.key == key)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastRefillAt, lastRefillAt) || other.lastRefillAt == lastRefillAt)&&(identical(other.lastRequest, lastRequest) || other.lastRequest == lastRequest)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.rateLimitMax, rateLimitMax) || other.rateLimitMax == rateLimitMax)&&(identical(other.rateLimitTimeWindow, rateLimitTimeWindow) || other.rateLimitTimeWindow == rateLimitTimeWindow)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.refillAmount, refillAmount) || other.refillAmount == refillAmount)&&(identical(other.refillInterval, refillInterval) || other.refillInterval == refillInterval)&&(identical(other.rateLimitEnabled, rateLimitEnabled) || other.rateLimitEnabled == rateLimitEnabled)&&(identical(other.requestCount, requestCount) || other.requestCount == requestCount)&&(identical(other.permissions, permissions) || other.permissions == permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,start,prefix,key,userId,enabled,expiresAt,createdAt,updatedAt,lastRefillAt,lastRequest,const DeepCollectionEquality().hash(_metadata),rateLimitMax,rateLimitTimeWindow,remaining,refillAmount,refillInterval,rateLimitEnabled,requestCount,permissions]);

@override
String toString() {
  return 'ApiKey(id: $id, name: $name, start: $start, prefix: $prefix, key: $key, userId: $userId, enabled: $enabled, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt, lastRefillAt: $lastRefillAt, lastRequest: $lastRequest, metadata: $metadata, rateLimitMax: $rateLimitMax, rateLimitTimeWindow: $rateLimitTimeWindow, remaining: $remaining, refillAmount: $refillAmount, refillInterval: $refillInterval, rateLimitEnabled: $rateLimitEnabled, requestCount: $requestCount, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$ApiKeyCopyWith<$Res> implements $ApiKeyCopyWith<$Res> {
  factory _$ApiKeyCopyWith(_ApiKey value, $Res Function(_ApiKey) _then) = __$ApiKeyCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? start, String? prefix, String? key, String userId, bool enabled, DateTime? expiresAt, DateTime createdAt, DateTime? updatedAt, DateTime? lastRefillAt, DateTime? lastRequest, Map<String, dynamic>? metadata, double? rateLimitMax, double? rateLimitTimeWindow, double? remaining, double? refillAmount, double? refillInterval, bool? rateLimitEnabled, double? requestCount, String? permissions
});




}
/// @nodoc
class __$ApiKeyCopyWithImpl<$Res>
    implements _$ApiKeyCopyWith<$Res> {
  __$ApiKeyCopyWithImpl(this._self, this._then);

  final _ApiKey _self;
  final $Res Function(_ApiKey) _then;

/// Create a copy of ApiKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? start = freezed,Object? prefix = freezed,Object? key = freezed,Object? userId = null,Object? enabled = null,Object? expiresAt = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? lastRefillAt = freezed,Object? lastRequest = freezed,Object? metadata = freezed,Object? rateLimitMax = freezed,Object? rateLimitTimeWindow = freezed,Object? remaining = freezed,Object? refillAmount = freezed,Object? refillInterval = freezed,Object? rateLimitEnabled = freezed,Object? requestCount = freezed,Object? permissions = freezed,}) {
  return _then(_ApiKey(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastRefillAt: freezed == lastRefillAt ? _self.lastRefillAt : lastRefillAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastRequest: freezed == lastRequest ? _self.lastRequest : lastRequest // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,rateLimitMax: freezed == rateLimitMax ? _self.rateLimitMax : rateLimitMax // ignore: cast_nullable_to_non_nullable
as double?,rateLimitTimeWindow: freezed == rateLimitTimeWindow ? _self.rateLimitTimeWindow : rateLimitTimeWindow // ignore: cast_nullable_to_non_nullable
as double?,remaining: freezed == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as double?,refillAmount: freezed == refillAmount ? _self.refillAmount : refillAmount // ignore: cast_nullable_to_non_nullable
as double?,refillInterval: freezed == refillInterval ? _self.refillInterval : refillInterval // ignore: cast_nullable_to_non_nullable
as double?,rateLimitEnabled: freezed == rateLimitEnabled ? _self.rateLimitEnabled : rateLimitEnabled // ignore: cast_nullable_to_non_nullable
as bool?,requestCount: freezed == requestCount ? _self.requestCount : requestCount // ignore: cast_nullable_to_non_nullable
as double?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

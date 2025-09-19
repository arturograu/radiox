// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_player_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RadioPlayerState {

 RadioStation get radioStation; RadioPlayerStatus get status; String? get errorMessage;
/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadioPlayerStateCopyWith<RadioPlayerState> get copyWith => _$RadioPlayerStateCopyWithImpl<RadioPlayerState>(this as RadioPlayerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadioPlayerState&&(identical(other.radioStation, radioStation) || other.radioStation == radioStation)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,radioStation,status,errorMessage);

@override
String toString() {
  return 'RadioPlayerState(radioStation: $radioStation, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $RadioPlayerStateCopyWith<$Res>  {
  factory $RadioPlayerStateCopyWith(RadioPlayerState value, $Res Function(RadioPlayerState) _then) = _$RadioPlayerStateCopyWithImpl;
@useResult
$Res call({
 RadioStation radioStation, RadioPlayerStatus status, String? errorMessage
});


$RadioStationCopyWith<$Res> get radioStation;

}
/// @nodoc
class _$RadioPlayerStateCopyWithImpl<$Res>
    implements $RadioPlayerStateCopyWith<$Res> {
  _$RadioPlayerStateCopyWithImpl(this._self, this._then);

  final RadioPlayerState _self;
  final $Res Function(RadioPlayerState) _then;

/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? radioStation = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
radioStation: null == radioStation ? _self.radioStation : radioStation // ignore: cast_nullable_to_non_nullable
as RadioStation,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RadioPlayerStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadioStationCopyWith<$Res> get radioStation {
  
  return $RadioStationCopyWith<$Res>(_self.radioStation, (value) {
    return _then(_self.copyWith(radioStation: value));
  });
}
}


/// Adds pattern-matching-related methods to [RadioPlayerState].
extension RadioPlayerStatePatterns on RadioPlayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadioPlayerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadioPlayerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadioPlayerState value)  $default,){
final _that = this;
switch (_that) {
case _RadioPlayerState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadioPlayerState value)?  $default,){
final _that = this;
switch (_that) {
case _RadioPlayerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RadioStation radioStation,  RadioPlayerStatus status,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadioPlayerState() when $default != null:
return $default(_that.radioStation,_that.status,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RadioStation radioStation,  RadioPlayerStatus status,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _RadioPlayerState():
return $default(_that.radioStation,_that.status,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RadioStation radioStation,  RadioPlayerStatus status,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _RadioPlayerState() when $default != null:
return $default(_that.radioStation,_that.status,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _RadioPlayerState implements RadioPlayerState {
  const _RadioPlayerState({required this.radioStation, this.status = RadioPlayerStatus.initial, this.errorMessage});
  

@override final  RadioStation radioStation;
@override@JsonKey() final  RadioPlayerStatus status;
@override final  String? errorMessage;

/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadioPlayerStateCopyWith<_RadioPlayerState> get copyWith => __$RadioPlayerStateCopyWithImpl<_RadioPlayerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadioPlayerState&&(identical(other.radioStation, radioStation) || other.radioStation == radioStation)&&(identical(other.status, status) || other.status == status)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,radioStation,status,errorMessage);

@override
String toString() {
  return 'RadioPlayerState(radioStation: $radioStation, status: $status, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$RadioPlayerStateCopyWith<$Res> implements $RadioPlayerStateCopyWith<$Res> {
  factory _$RadioPlayerStateCopyWith(_RadioPlayerState value, $Res Function(_RadioPlayerState) _then) = __$RadioPlayerStateCopyWithImpl;
@override @useResult
$Res call({
 RadioStation radioStation, RadioPlayerStatus status, String? errorMessage
});


@override $RadioStationCopyWith<$Res> get radioStation;

}
/// @nodoc
class __$RadioPlayerStateCopyWithImpl<$Res>
    implements _$RadioPlayerStateCopyWith<$Res> {
  __$RadioPlayerStateCopyWithImpl(this._self, this._then);

  final _RadioPlayerState _self;
  final $Res Function(_RadioPlayerState) _then;

/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? radioStation = null,Object? status = null,Object? errorMessage = freezed,}) {
  return _then(_RadioPlayerState(
radioStation: null == radioStation ? _self.radioStation : radioStation // ignore: cast_nullable_to_non_nullable
as RadioStation,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RadioPlayerStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of RadioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadioStationCopyWith<$Res> get radioStation {
  
  return $RadioStationCopyWith<$Res>(_self.radioStation, (value) {
    return _then(_self.copyWith(radioStation: value));
  });
}
}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_station_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadioStationListResponse {

 List<RadioStation> get stations;
/// Create a copy of RadioStationListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadioStationListResponseCopyWith<RadioStationListResponse> get copyWith => _$RadioStationListResponseCopyWithImpl<RadioStationListResponse>(this as RadioStationListResponse, _$identity);

  /// Serializes this RadioStationListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadioStationListResponse&&const DeepCollectionEquality().equals(other.stations, stations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(stations));

@override
String toString() {
  return 'RadioStationListResponse(stations: $stations)';
}


}

/// @nodoc
abstract mixin class $RadioStationListResponseCopyWith<$Res>  {
  factory $RadioStationListResponseCopyWith(RadioStationListResponse value, $Res Function(RadioStationListResponse) _then) = _$RadioStationListResponseCopyWithImpl;
@useResult
$Res call({
 List<RadioStation> stations
});




}
/// @nodoc
class _$RadioStationListResponseCopyWithImpl<$Res>
    implements $RadioStationListResponseCopyWith<$Res> {
  _$RadioStationListResponseCopyWithImpl(this._self, this._then);

  final RadioStationListResponse _self;
  final $Res Function(RadioStationListResponse) _then;

/// Create a copy of RadioStationListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stations = null,}) {
  return _then(_self.copyWith(
stations: null == stations ? _self.stations : stations // ignore: cast_nullable_to_non_nullable
as List<RadioStation>,
  ));
}

}


/// Adds pattern-matching-related methods to [RadioStationListResponse].
extension RadioStationListResponsePatterns on RadioStationListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadioStationListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadioStationListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadioStationListResponse value)  $default,){
final _that = this;
switch (_that) {
case _RadioStationListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadioStationListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RadioStationListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RadioStation> stations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadioStationListResponse() when $default != null:
return $default(_that.stations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RadioStation> stations)  $default,) {final _that = this;
switch (_that) {
case _RadioStationListResponse():
return $default(_that.stations);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RadioStation> stations)?  $default,) {final _that = this;
switch (_that) {
case _RadioStationListResponse() when $default != null:
return $default(_that.stations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadioStationListResponse implements RadioStationListResponse {
   _RadioStationListResponse({required final  List<RadioStation> stations}): _stations = stations;
  factory _RadioStationListResponse.fromJson(Map<String, dynamic> json) => _$RadioStationListResponseFromJson(json);

 final  List<RadioStation> _stations;
@override List<RadioStation> get stations {
  if (_stations is EqualUnmodifiableListView) return _stations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stations);
}


/// Create a copy of RadioStationListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadioStationListResponseCopyWith<_RadioStationListResponse> get copyWith => __$RadioStationListResponseCopyWithImpl<_RadioStationListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadioStationListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadioStationListResponse&&const DeepCollectionEquality().equals(other._stations, _stations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_stations));

@override
String toString() {
  return 'RadioStationListResponse(stations: $stations)';
}


}

/// @nodoc
abstract mixin class _$RadioStationListResponseCopyWith<$Res> implements $RadioStationListResponseCopyWith<$Res> {
  factory _$RadioStationListResponseCopyWith(_RadioStationListResponse value, $Res Function(_RadioStationListResponse) _then) = __$RadioStationListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<RadioStation> stations
});




}
/// @nodoc
class __$RadioStationListResponseCopyWithImpl<$Res>
    implements _$RadioStationListResponseCopyWith<$Res> {
  __$RadioStationListResponseCopyWithImpl(this._self, this._then);

  final _RadioStationListResponse _self;
  final $Res Function(_RadioStationListResponse) _then;

/// Create a copy of RadioStationListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stations = null,}) {
  return _then(_RadioStationListResponse(
stations: null == stations ? _self._stations : stations // ignore: cast_nullable_to_non_nullable
as List<RadioStation>,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_radio_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteRadioStation {

 String get id; String get name; String get url; String get favicon; DateTime? get dateAdded;
/// Create a copy of FavoriteRadioStation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteRadioStationCopyWith<FavoriteRadioStation> get copyWith => _$FavoriteRadioStationCopyWithImpl<FavoriteRadioStation>(this as FavoriteRadioStation, _$identity);

  /// Serializes this FavoriteRadioStation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteRadioStation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.favicon, favicon) || other.favicon == favicon)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,favicon,dateAdded);

@override
String toString() {
  return 'FavoriteRadioStation(id: $id, name: $name, url: $url, favicon: $favicon, dateAdded: $dateAdded)';
}


}

/// @nodoc
abstract mixin class $FavoriteRadioStationCopyWith<$Res>  {
  factory $FavoriteRadioStationCopyWith(FavoriteRadioStation value, $Res Function(FavoriteRadioStation) _then) = _$FavoriteRadioStationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String url, String favicon, DateTime? dateAdded
});




}
/// @nodoc
class _$FavoriteRadioStationCopyWithImpl<$Res>
    implements $FavoriteRadioStationCopyWith<$Res> {
  _$FavoriteRadioStationCopyWithImpl(this._self, this._then);

  final FavoriteRadioStation _self;
  final $Res Function(FavoriteRadioStation) _then;

/// Create a copy of FavoriteRadioStation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? url = null,Object? favicon = null,Object? dateAdded = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,favicon: null == favicon ? _self.favicon : favicon // ignore: cast_nullable_to_non_nullable
as String,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteRadioStation].
extension FavoriteRadioStationPatterns on FavoriteRadioStation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteRadioStation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteRadioStation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteRadioStation value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteRadioStation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteRadioStation value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteRadioStation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String url,  String favicon,  DateTime? dateAdded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteRadioStation() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.favicon,_that.dateAdded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String url,  String favicon,  DateTime? dateAdded)  $default,) {final _that = this;
switch (_that) {
case _FavoriteRadioStation():
return $default(_that.id,_that.name,_that.url,_that.favicon,_that.dateAdded);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String url,  String favicon,  DateTime? dateAdded)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteRadioStation() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.favicon,_that.dateAdded);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteRadioStation implements FavoriteRadioStation {
  const _FavoriteRadioStation({required this.id, required this.name, required this.url, required this.favicon, this.dateAdded});
  factory _FavoriteRadioStation.fromJson(Map<String, dynamic> json) => _$FavoriteRadioStationFromJson(json);

@override final  String id;
@override final  String name;
@override final  String url;
@override final  String favicon;
@override final  DateTime? dateAdded;

/// Create a copy of FavoriteRadioStation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteRadioStationCopyWith<_FavoriteRadioStation> get copyWith => __$FavoriteRadioStationCopyWithImpl<_FavoriteRadioStation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteRadioStationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteRadioStation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.favicon, favicon) || other.favicon == favicon)&&(identical(other.dateAdded, dateAdded) || other.dateAdded == dateAdded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,favicon,dateAdded);

@override
String toString() {
  return 'FavoriteRadioStation(id: $id, name: $name, url: $url, favicon: $favicon, dateAdded: $dateAdded)';
}


}

/// @nodoc
abstract mixin class _$FavoriteRadioStationCopyWith<$Res> implements $FavoriteRadioStationCopyWith<$Res> {
  factory _$FavoriteRadioStationCopyWith(_FavoriteRadioStation value, $Res Function(_FavoriteRadioStation) _then) = __$FavoriteRadioStationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String url, String favicon, DateTime? dateAdded
});




}
/// @nodoc
class __$FavoriteRadioStationCopyWithImpl<$Res>
    implements _$FavoriteRadioStationCopyWith<$Res> {
  __$FavoriteRadioStationCopyWithImpl(this._self, this._then);

  final _FavoriteRadioStation _self;
  final $Res Function(_FavoriteRadioStation) _then;

/// Create a copy of FavoriteRadioStation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = null,Object? favicon = null,Object? dateAdded = freezed,}) {
  return _then(_FavoriteRadioStation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,favicon: null == favicon ? _self.favicon : favicon // ignore: cast_nullable_to_non_nullable
as String,dateAdded: freezed == dateAdded ? _self.dateAdded : dateAdded // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'radio_station.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadioStation {

 String get name; String get stationuuid; String? get changeuuid; String? get url; String? get urlResolved; String? get homepage; String? get favicon; String? get countrycode; String? get state; int get votes; String? get codec; int get bitrate;@JsonKey(fromJson: intToBool) bool get lastcheckok; DateTime? get lastchangetime; DateTime? get lastchangetimeIso8601; DateTime? get lastchecktime; DateTime? get lastchecktimeIso8601; DateTime? get lastcheckoktime; DateTime? get lastcheckoktimeIso8601; DateTime? get lastlocalchecktime; DateTime? get lastlocalchecktimeIso8601; DateTime? get clicktimestamp; DateTime? get clicktimestampIso8601; int get clickcount; int get clicktrend; double? get geoLat; double? get geoLong; bool get hasExtendedInfo;
/// Create a copy of RadioStation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadioStationCopyWith<RadioStation> get copyWith => _$RadioStationCopyWithImpl<RadioStation>(this as RadioStation, _$identity);

  /// Serializes this RadioStation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadioStation&&(identical(other.name, name) || other.name == name)&&(identical(other.stationuuid, stationuuid) || other.stationuuid == stationuuid)&&(identical(other.changeuuid, changeuuid) || other.changeuuid == changeuuid)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlResolved, urlResolved) || other.urlResolved == urlResolved)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.favicon, favicon) || other.favicon == favicon)&&(identical(other.countrycode, countrycode) || other.countrycode == countrycode)&&(identical(other.state, state) || other.state == state)&&(identical(other.votes, votes) || other.votes == votes)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.lastcheckok, lastcheckok) || other.lastcheckok == lastcheckok)&&(identical(other.lastchangetime, lastchangetime) || other.lastchangetime == lastchangetime)&&(identical(other.lastchangetimeIso8601, lastchangetimeIso8601) || other.lastchangetimeIso8601 == lastchangetimeIso8601)&&(identical(other.lastchecktime, lastchecktime) || other.lastchecktime == lastchecktime)&&(identical(other.lastchecktimeIso8601, lastchecktimeIso8601) || other.lastchecktimeIso8601 == lastchecktimeIso8601)&&(identical(other.lastcheckoktime, lastcheckoktime) || other.lastcheckoktime == lastcheckoktime)&&(identical(other.lastcheckoktimeIso8601, lastcheckoktimeIso8601) || other.lastcheckoktimeIso8601 == lastcheckoktimeIso8601)&&(identical(other.lastlocalchecktime, lastlocalchecktime) || other.lastlocalchecktime == lastlocalchecktime)&&(identical(other.lastlocalchecktimeIso8601, lastlocalchecktimeIso8601) || other.lastlocalchecktimeIso8601 == lastlocalchecktimeIso8601)&&(identical(other.clicktimestamp, clicktimestamp) || other.clicktimestamp == clicktimestamp)&&(identical(other.clicktimestampIso8601, clicktimestampIso8601) || other.clicktimestampIso8601 == clicktimestampIso8601)&&(identical(other.clickcount, clickcount) || other.clickcount == clickcount)&&(identical(other.clicktrend, clicktrend) || other.clicktrend == clicktrend)&&(identical(other.geoLat, geoLat) || other.geoLat == geoLat)&&(identical(other.geoLong, geoLong) || other.geoLong == geoLong)&&(identical(other.hasExtendedInfo, hasExtendedInfo) || other.hasExtendedInfo == hasExtendedInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,stationuuid,changeuuid,url,urlResolved,homepage,favicon,countrycode,state,votes,codec,bitrate,lastcheckok,lastchangetime,lastchangetimeIso8601,lastchecktime,lastchecktimeIso8601,lastcheckoktime,lastcheckoktimeIso8601,lastlocalchecktime,lastlocalchecktimeIso8601,clicktimestamp,clicktimestampIso8601,clickcount,clicktrend,geoLat,geoLong,hasExtendedInfo]);

@override
String toString() {
  return 'RadioStation(name: $name, stationuuid: $stationuuid, changeuuid: $changeuuid, url: $url, urlResolved: $urlResolved, homepage: $homepage, favicon: $favicon, countrycode: $countrycode, state: $state, votes: $votes, codec: $codec, bitrate: $bitrate, lastcheckok: $lastcheckok, lastchangetime: $lastchangetime, lastchangetimeIso8601: $lastchangetimeIso8601, lastchecktime: $lastchecktime, lastchecktimeIso8601: $lastchecktimeIso8601, lastcheckoktime: $lastcheckoktime, lastcheckoktimeIso8601: $lastcheckoktimeIso8601, lastlocalchecktime: $lastlocalchecktime, lastlocalchecktimeIso8601: $lastlocalchecktimeIso8601, clicktimestamp: $clicktimestamp, clicktimestampIso8601: $clicktimestampIso8601, clickcount: $clickcount, clicktrend: $clicktrend, geoLat: $geoLat, geoLong: $geoLong, hasExtendedInfo: $hasExtendedInfo)';
}


}

/// @nodoc
abstract mixin class $RadioStationCopyWith<$Res>  {
  factory $RadioStationCopyWith(RadioStation value, $Res Function(RadioStation) _then) = _$RadioStationCopyWithImpl;
@useResult
$Res call({
 String name, String stationuuid, String? changeuuid, String? url, String? urlResolved, String? homepage, String? favicon, String? countrycode, String? state, int votes, String? codec, int bitrate,@JsonKey(fromJson: intToBool) bool lastcheckok, DateTime? lastchangetime, DateTime? lastchangetimeIso8601, DateTime? lastchecktime, DateTime? lastchecktimeIso8601, DateTime? lastcheckoktime, DateTime? lastcheckoktimeIso8601, DateTime? lastlocalchecktime, DateTime? lastlocalchecktimeIso8601, DateTime? clicktimestamp, DateTime? clicktimestampIso8601, int clickcount, int clicktrend, double? geoLat, double? geoLong, bool hasExtendedInfo
});




}
/// @nodoc
class _$RadioStationCopyWithImpl<$Res>
    implements $RadioStationCopyWith<$Res> {
  _$RadioStationCopyWithImpl(this._self, this._then);

  final RadioStation _self;
  final $Res Function(RadioStation) _then;

/// Create a copy of RadioStation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? stationuuid = null,Object? changeuuid = freezed,Object? url = freezed,Object? urlResolved = freezed,Object? homepage = freezed,Object? favicon = freezed,Object? countrycode = freezed,Object? state = freezed,Object? votes = null,Object? codec = freezed,Object? bitrate = null,Object? lastcheckok = null,Object? lastchangetime = freezed,Object? lastchangetimeIso8601 = freezed,Object? lastchecktime = freezed,Object? lastchecktimeIso8601 = freezed,Object? lastcheckoktime = freezed,Object? lastcheckoktimeIso8601 = freezed,Object? lastlocalchecktime = freezed,Object? lastlocalchecktimeIso8601 = freezed,Object? clicktimestamp = freezed,Object? clicktimestampIso8601 = freezed,Object? clickcount = null,Object? clicktrend = null,Object? geoLat = freezed,Object? geoLong = freezed,Object? hasExtendedInfo = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,stationuuid: null == stationuuid ? _self.stationuuid : stationuuid // ignore: cast_nullable_to_non_nullable
as String,changeuuid: freezed == changeuuid ? _self.changeuuid : changeuuid // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlResolved: freezed == urlResolved ? _self.urlResolved : urlResolved // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,favicon: freezed == favicon ? _self.favicon : favicon // ignore: cast_nullable_to_non_nullable
as String?,countrycode: freezed == countrycode ? _self.countrycode : countrycode // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,votes: null == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,bitrate: null == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int,lastcheckok: null == lastcheckok ? _self.lastcheckok : lastcheckok // ignore: cast_nullable_to_non_nullable
as bool,lastchangetime: freezed == lastchangetime ? _self.lastchangetime : lastchangetime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastchangetimeIso8601: freezed == lastchangetimeIso8601 ? _self.lastchangetimeIso8601 : lastchangetimeIso8601 // ignore: cast_nullable_to_non_nullable
as DateTime?,lastchecktime: freezed == lastchecktime ? _self.lastchecktime : lastchecktime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastchecktimeIso8601: freezed == lastchecktimeIso8601 ? _self.lastchecktimeIso8601 : lastchecktimeIso8601 // ignore: cast_nullable_to_non_nullable
as DateTime?,lastcheckoktime: freezed == lastcheckoktime ? _self.lastcheckoktime : lastcheckoktime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastcheckoktimeIso8601: freezed == lastcheckoktimeIso8601 ? _self.lastcheckoktimeIso8601 : lastcheckoktimeIso8601 // ignore: cast_nullable_to_non_nullable
as DateTime?,lastlocalchecktime: freezed == lastlocalchecktime ? _self.lastlocalchecktime : lastlocalchecktime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastlocalchecktimeIso8601: freezed == lastlocalchecktimeIso8601 ? _self.lastlocalchecktimeIso8601 : lastlocalchecktimeIso8601 // ignore: cast_nullable_to_non_nullable
as DateTime?,clicktimestamp: freezed == clicktimestamp ? _self.clicktimestamp : clicktimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,clicktimestampIso8601: freezed == clicktimestampIso8601 ? _self.clicktimestampIso8601 : clicktimestampIso8601 // ignore: cast_nullable_to_non_nullable
as DateTime?,clickcount: null == clickcount ? _self.clickcount : clickcount // ignore: cast_nullable_to_non_nullable
as int,clicktrend: null == clicktrend ? _self.clicktrend : clicktrend // ignore: cast_nullable_to_non_nullable
as int,geoLat: freezed == geoLat ? _self.geoLat : geoLat // ignore: cast_nullable_to_non_nullable
as double?,geoLong: freezed == geoLong ? _self.geoLong : geoLong // ignore: cast_nullable_to_non_nullable
as double?,hasExtendedInfo: null == hasExtendedInfo ? _self.hasExtendedInfo : hasExtendedInfo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RadioStation].
extension RadioStationPatterns on RadioStation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadioStation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadioStation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadioStation value)  $default,){
final _that = this;
switch (_that) {
case _RadioStation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadioStation value)?  $default,){
final _that = this;
switch (_that) {
case _RadioStation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String stationuuid,  String? changeuuid,  String? url,  String? urlResolved,  String? homepage,  String? favicon,  String? countrycode,  String? state,  int votes,  String? codec,  int bitrate, @JsonKey(fromJson: intToBool)  bool lastcheckok,  DateTime? lastchangetime,  DateTime? lastchangetimeIso8601,  DateTime? lastchecktime,  DateTime? lastchecktimeIso8601,  DateTime? lastcheckoktime,  DateTime? lastcheckoktimeIso8601,  DateTime? lastlocalchecktime,  DateTime? lastlocalchecktimeIso8601,  DateTime? clicktimestamp,  DateTime? clicktimestampIso8601,  int clickcount,  int clicktrend,  double? geoLat,  double? geoLong,  bool hasExtendedInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadioStation() when $default != null:
return $default(_that.name,_that.stationuuid,_that.changeuuid,_that.url,_that.urlResolved,_that.homepage,_that.favicon,_that.countrycode,_that.state,_that.votes,_that.codec,_that.bitrate,_that.lastcheckok,_that.lastchangetime,_that.lastchangetimeIso8601,_that.lastchecktime,_that.lastchecktimeIso8601,_that.lastcheckoktime,_that.lastcheckoktimeIso8601,_that.lastlocalchecktime,_that.lastlocalchecktimeIso8601,_that.clicktimestamp,_that.clicktimestampIso8601,_that.clickcount,_that.clicktrend,_that.geoLat,_that.geoLong,_that.hasExtendedInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String stationuuid,  String? changeuuid,  String? url,  String? urlResolved,  String? homepage,  String? favicon,  String? countrycode,  String? state,  int votes,  String? codec,  int bitrate, @JsonKey(fromJson: intToBool)  bool lastcheckok,  DateTime? lastchangetime,  DateTime? lastchangetimeIso8601,  DateTime? lastchecktime,  DateTime? lastchecktimeIso8601,  DateTime? lastcheckoktime,  DateTime? lastcheckoktimeIso8601,  DateTime? lastlocalchecktime,  DateTime? lastlocalchecktimeIso8601,  DateTime? clicktimestamp,  DateTime? clicktimestampIso8601,  int clickcount,  int clicktrend,  double? geoLat,  double? geoLong,  bool hasExtendedInfo)  $default,) {final _that = this;
switch (_that) {
case _RadioStation():
return $default(_that.name,_that.stationuuid,_that.changeuuid,_that.url,_that.urlResolved,_that.homepage,_that.favicon,_that.countrycode,_that.state,_that.votes,_that.codec,_that.bitrate,_that.lastcheckok,_that.lastchangetime,_that.lastchangetimeIso8601,_that.lastchecktime,_that.lastchecktimeIso8601,_that.lastcheckoktime,_that.lastcheckoktimeIso8601,_that.lastlocalchecktime,_that.lastlocalchecktimeIso8601,_that.clicktimestamp,_that.clicktimestampIso8601,_that.clickcount,_that.clicktrend,_that.geoLat,_that.geoLong,_that.hasExtendedInfo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String stationuuid,  String? changeuuid,  String? url,  String? urlResolved,  String? homepage,  String? favicon,  String? countrycode,  String? state,  int votes,  String? codec,  int bitrate, @JsonKey(fromJson: intToBool)  bool lastcheckok,  DateTime? lastchangetime,  DateTime? lastchangetimeIso8601,  DateTime? lastchecktime,  DateTime? lastchecktimeIso8601,  DateTime? lastcheckoktime,  DateTime? lastcheckoktimeIso8601,  DateTime? lastlocalchecktime,  DateTime? lastlocalchecktimeIso8601,  DateTime? clicktimestamp,  DateTime? clicktimestampIso8601,  int clickcount,  int clicktrend,  double? geoLat,  double? geoLong,  bool hasExtendedInfo)?  $default,) {final _that = this;
switch (_that) {
case _RadioStation() when $default != null:
return $default(_that.name,_that.stationuuid,_that.changeuuid,_that.url,_that.urlResolved,_that.homepage,_that.favicon,_that.countrycode,_that.state,_that.votes,_that.codec,_that.bitrate,_that.lastcheckok,_that.lastchangetime,_that.lastchangetimeIso8601,_that.lastchecktime,_that.lastchecktimeIso8601,_that.lastcheckoktime,_that.lastcheckoktimeIso8601,_that.lastlocalchecktime,_that.lastlocalchecktimeIso8601,_that.clicktimestamp,_that.clicktimestampIso8601,_that.clickcount,_that.clicktrend,_that.geoLat,_that.geoLong,_that.hasExtendedInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadioStation implements RadioStation {
  const _RadioStation({required this.name, required this.stationuuid, this.changeuuid, this.url, this.urlResolved, this.homepage, this.favicon, this.countrycode, this.state, this.votes = 0, this.codec, this.bitrate = 0, @JsonKey(fromJson: intToBool) this.lastcheckok = false, this.lastchangetime, this.lastchangetimeIso8601, this.lastchecktime, this.lastchecktimeIso8601, this.lastcheckoktime, this.lastcheckoktimeIso8601, this.lastlocalchecktime, this.lastlocalchecktimeIso8601, this.clicktimestamp, this.clicktimestampIso8601, this.clickcount = 0, this.clicktrend = 0, this.geoLat, this.geoLong, this.hasExtendedInfo = false});
  factory _RadioStation.fromJson(Map<String, dynamic> json) => _$RadioStationFromJson(json);

@override final  String name;
@override final  String stationuuid;
@override final  String? changeuuid;
@override final  String? url;
@override final  String? urlResolved;
@override final  String? homepage;
@override final  String? favicon;
@override final  String? countrycode;
@override final  String? state;
@override@JsonKey() final  int votes;
@override final  String? codec;
@override@JsonKey() final  int bitrate;
@override@JsonKey(fromJson: intToBool) final  bool lastcheckok;
@override final  DateTime? lastchangetime;
@override final  DateTime? lastchangetimeIso8601;
@override final  DateTime? lastchecktime;
@override final  DateTime? lastchecktimeIso8601;
@override final  DateTime? lastcheckoktime;
@override final  DateTime? lastcheckoktimeIso8601;
@override final  DateTime? lastlocalchecktime;
@override final  DateTime? lastlocalchecktimeIso8601;
@override final  DateTime? clicktimestamp;
@override final  DateTime? clicktimestampIso8601;
@override@JsonKey() final  int clickcount;
@override@JsonKey() final  int clicktrend;
@override final  double? geoLat;
@override final  double? geoLong;
@override@JsonKey() final  bool hasExtendedInfo;

/// Create a copy of RadioStation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadioStationCopyWith<_RadioStation> get copyWith => __$RadioStationCopyWithImpl<_RadioStation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadioStationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadioStation&&(identical(other.name, name) || other.name == name)&&(identical(other.stationuuid, stationuuid) || other.stationuuid == stationuuid)&&(identical(other.changeuuid, changeuuid) || other.changeuuid == changeuuid)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlResolved, urlResolved) || other.urlResolved == urlResolved)&&(identical(other.homepage, homepage) || other.homepage == homepage)&&(identical(other.favicon, favicon) || other.favicon == favicon)&&(identical(other.countrycode, countrycode) || other.countrycode == countrycode)&&(identical(other.state, state) || other.state == state)&&(identical(other.votes, votes) || other.votes == votes)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.lastcheckok, lastcheckok) || other.lastcheckok == lastcheckok)&&(identical(other.lastchangetime, lastchangetime) || other.lastchangetime == lastchangetime)&&(identical(other.lastchangetimeIso8601, lastchangetimeIso8601) || other.lastchangetimeIso8601 == lastchangetimeIso8601)&&(identical(other.lastchecktime, lastchecktime) || other.lastchecktime == lastchecktime)&&(identical(other.lastchecktimeIso8601, lastchecktimeIso8601) || other.lastchecktimeIso8601 == lastchecktimeIso8601)&&(identical(other.lastcheckoktime, lastcheckoktime) || other.lastcheckoktime == lastcheckoktime)&&(identical(other.lastcheckoktimeIso8601, lastcheckoktimeIso8601) || other.lastcheckoktimeIso8601 == lastcheckoktimeIso8601)&&(identical(other.lastlocalchecktime, lastlocalchecktime) || other.lastlocalchecktime == lastlocalchecktime)&&(identical(other.lastlocalchecktimeIso8601, lastlocalchecktimeIso8601) || other.lastlocalchecktimeIso8601 == lastlocalchecktimeIso8601)&&(identical(other.clicktimestamp, clicktimestamp) || other.clicktimestamp == clicktimestamp)&&(identical(other.clicktimestampIso8601, clicktimestampIso8601) || other.clicktimestampIso8601 == clicktimestampIso8601)&&(identical(other.clickcount, clickcount) || other.clickcount == clickcount)&&(identical(other.clicktrend, clicktrend) || other.clicktrend == clicktrend)&&(identical(other.geoLat, geoLat) || other.geoLat == geoLat)&&(identical(other.geoLong, geoLong) || other.geoLong == geoLong)&&(identical(other.hasExtendedInfo, hasExtendedInfo) || other.hasExtendedInfo == hasExtendedInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,name,stationuuid,changeuuid,url,urlResolved,homepage,favicon,countrycode,state,votes,codec,bitrate,lastcheckok,lastchangetime,lastchangetimeIso8601,lastchecktime,lastchecktimeIso8601,lastcheckoktime,lastcheckoktimeIso8601,lastlocalchecktime,lastlocalchecktimeIso8601,clicktimestamp,clicktimestampIso8601,clickcount,clicktrend,geoLat,geoLong,hasExtendedInfo]);

@override
String toString() {
  return 'RadioStation(name: $name, stationuuid: $stationuuid, changeuuid: $changeuuid, url: $url, urlResolved: $urlResolved, homepage: $homepage, favicon: $favicon, countrycode: $countrycode, state: $state, votes: $votes, codec: $codec, bitrate: $bitrate, lastcheckok: $lastcheckok, lastchangetime: $lastchangetime, lastchangetimeIso8601: $lastchangetimeIso8601, lastchecktime: $lastchecktime, lastchecktimeIso8601: $lastchecktimeIso8601, lastcheckoktime: $lastcheckoktime, lastcheckoktimeIso8601: $lastcheckoktimeIso8601, lastlocalchecktime: $lastlocalchecktime, lastlocalchecktimeIso8601: $lastlocalchecktimeIso8601, clicktimestamp: $clicktimestamp, clicktimestampIso8601: $clicktimestampIso8601, clickcount: $clickcount, clicktrend: $clicktrend, geoLat: $geoLat, geoLong: $geoLong, hasExtendedInfo: $hasExtendedInfo)';
}


}

/// @nodoc
abstract mixin class _$RadioStationCopyWith<$Res> implements $RadioStationCopyWith<$Res> {
  factory _$RadioStationCopyWith(_RadioStation value, $Res Function(_RadioStation) _then) = __$RadioStationCopyWithImpl;
@override @useResult
$Res call({
 String name, String stationuuid, String? changeuuid, String? url, String? urlResolved, String? homepage, String? favicon, String? countrycode, String? state, int votes, String? codec, int bitrate,@JsonKey(fromJson: intToBool) bool lastcheckok, DateTime? lastchangetime, DateTime? lastchangetimeIso8601, DateTime? lastchecktime, DateTime? lastchecktimeIso8601, DateTime? lastcheckoktime, DateTime? lastcheckoktimeIso8601, DateTime? lastlocalchecktime, DateTime? lastlocalchecktimeIso8601, DateTime? clicktimestamp, DateTime? clicktimestampIso8601, int clickcount, int clicktrend, double? geoLat, double? geoLong, bool hasExtendedInfo
});




}
/// @nodoc
class __$RadioStationCopyWithImpl<$Res>
    implements _$RadioStationCopyWith<$Res> {
  __$RadioStationCopyWithImpl(this._self, this._then);

  final _RadioStation _self;
  final $Res Function(_RadioStation) _then;

/// Create a copy of RadioStation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? stationuuid = null,Object? changeuuid = freezed,Object? url = freezed,Object? urlResolved = freezed,Object? homepage = freezed,Object? favicon = freezed,Object? countrycode = freezed,Object? state = freezed,Object? votes = null,Object? codec = freezed,Object? bitrate = null,Object? lastcheckok = null,Object? lastchangetime = freezed,Object? lastchangetimeIso8601 = freezed,Object? lastchecktime = freezed,Object? lastchecktimeIso8601 = freezed,Object? lastcheckoktime = freezed,Object? lastcheckoktimeIso8601 = freezed,Object? lastlocalchecktime = freezed,Object? lastlocalchecktimeIso8601 = freezed,Object? clicktimestamp = freezed,Object? clicktimestampIso8601 = freezed,Object? clickcount = null,Object? clicktrend = null,Object? geoLat = freezed,Object? geoLong = freezed,Object? hasExtendedInfo = null,}) {
  return _then(_RadioStation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,stationuuid: null == stationuuid ? _self.stationuuid : stationuuid // ignore: cast_nullable_to_non_nullable
as String,changeuuid: freezed == changeuuid ? _self.changeuuid : changeuuid // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlResolved: freezed == urlResolved ? _self.urlResolved : urlResolved // ignore: cast_nullable_to_non_nullable
as String?,homepage: freezed == homepage ? _self.homepage : homepage // ignore: cast_nullable_to_non_nullable
as String?,favicon: freezed == favicon ? _self.favicon : favicon // ignore: cast_nullable_to_non_nullable
as String?,countrycode: freezed == countrycode ? _self.countrycode : countrycode // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,votes: null == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as int,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,bitrate: null == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as int,lastcheckok: null == lastcheckok ? _self.lastcheckok : lastcheckok // ignore: cast_nullable_to_non_nullable
as bool,lastchangetime: freezed == lastchangetime ? _self.lastchangetime : lastchangetime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastchangetimeIso8601: freezed == lastchangetimeIso8601 ? _self.lastchangetimeIso8601 : lastchangetimeIso8601 // ignore: cast_nullable_to_non_nullable
as DateTime?,lastchecktime: freezed == lastchecktime ? _self.lastchecktime : lastchecktime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastchecktimeIso8601: freezed == lastchecktimeIso8601 ? _self.lastchecktimeIso8601 : lastchecktimeIso8601 // ignore: cast_nullable_to_non_nullable
as DateTime?,lastcheckoktime: freezed == lastcheckoktime ? _self.lastcheckoktime : lastcheckoktime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastcheckoktimeIso8601: freezed == lastcheckoktimeIso8601 ? _self.lastcheckoktimeIso8601 : lastcheckoktimeIso8601 // ignore: cast_nullable_to_non_nullable
as DateTime?,lastlocalchecktime: freezed == lastlocalchecktime ? _self.lastlocalchecktime : lastlocalchecktime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastlocalchecktimeIso8601: freezed == lastlocalchecktimeIso8601 ? _self.lastlocalchecktimeIso8601 : lastlocalchecktimeIso8601 // ignore: cast_nullable_to_non_nullable
as DateTime?,clicktimestamp: freezed == clicktimestamp ? _self.clicktimestamp : clicktimestamp // ignore: cast_nullable_to_non_nullable
as DateTime?,clicktimestampIso8601: freezed == clicktimestampIso8601 ? _self.clicktimestampIso8601 : clicktimestampIso8601 // ignore: cast_nullable_to_non_nullable
as DateTime?,clickcount: null == clickcount ? _self.clickcount : clickcount // ignore: cast_nullable_to_non_nullable
as int,clicktrend: null == clicktrend ? _self.clicktrend : clicktrend // ignore: cast_nullable_to_non_nullable
as int,geoLat: freezed == geoLat ? _self.geoLat : geoLat // ignore: cast_nullable_to_non_nullable
as double?,geoLong: freezed == geoLong ? _self.geoLong : geoLong // ignore: cast_nullable_to_non_nullable
as double?,hasExtendedInfo: null == hasExtendedInfo ? _self.hasExtendedInfo : hasExtendedInfo // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

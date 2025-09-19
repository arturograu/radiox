// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RadioStation _$RadioStationFromJson(Map<String, dynamic> json) =>
    _RadioStation(
      name: json['name'] as String,
      stationuuid: json['stationuuid'] as String,
      changeuuid: json['changeuuid'] as String?,
      url: json['url'] as String?,
      urlResolved: json['url_resolved'] as String?,
      homepage: json['homepage'] as String?,
      favicon: json['favicon'] as String?,
      countrycode: json['countrycode'] as String?,
      state: json['state'] as String?,
      votes: (json['votes'] as num?)?.toInt() ?? 0,
      codec: json['codec'] as String?,
      bitrate: (json['bitrate'] as num?)?.toInt() ?? 0,
      lastcheckok: json['lastcheckok'] == null
          ? false
          : intToBool(json['lastcheckok']),
      lastchangetime: json['lastchangetime'] == null
          ? null
          : DateTime.parse(json['lastchangetime'] as String),
      lastchangetimeIso8601: json['lastchangetime_iso8601'] == null
          ? null
          : DateTime.parse(json['lastchangetime_iso8601'] as String),
      lastchecktime: json['lastchecktime'] == null
          ? null
          : DateTime.parse(json['lastchecktime'] as String),
      lastchecktimeIso8601: json['lastchecktime_iso8601'] == null
          ? null
          : DateTime.parse(json['lastchecktime_iso8601'] as String),
      lastcheckoktime: json['lastcheckoktime'] == null
          ? null
          : DateTime.parse(json['lastcheckoktime'] as String),
      lastcheckoktimeIso8601: json['lastcheckoktime_iso8601'] == null
          ? null
          : DateTime.parse(json['lastcheckoktime_iso8601'] as String),
      lastlocalchecktime: json['lastlocalchecktime'] == null
          ? null
          : DateTime.parse(json['lastlocalchecktime'] as String),
      lastlocalchecktimeIso8601: json['lastlocalchecktime_iso8601'] == null
          ? null
          : DateTime.parse(json['lastlocalchecktime_iso8601'] as String),
      clicktimestamp: json['clicktimestamp'] == null
          ? null
          : DateTime.parse(json['clicktimestamp'] as String),
      clicktimestampIso8601: json['clicktimestamp_iso8601'] == null
          ? null
          : DateTime.parse(json['clicktimestamp_iso8601'] as String),
      clickcount: (json['clickcount'] as num?)?.toInt() ?? 0,
      clicktrend: (json['clicktrend'] as num?)?.toInt() ?? 0,
      geoLat: (json['geo_lat'] as num?)?.toDouble(),
      geoLong: (json['geo_long'] as num?)?.toDouble(),
      hasExtendedInfo: json['has_extended_info'] as bool? ?? false,
    );

Map<String, dynamic> _$RadioStationToJson(
  _RadioStation instance,
) => <String, dynamic>{
  'name': instance.name,
  'stationuuid': instance.stationuuid,
  'changeuuid': instance.changeuuid,
  'url': instance.url,
  'url_resolved': instance.urlResolved,
  'homepage': instance.homepage,
  'favicon': instance.favicon,
  'countrycode': instance.countrycode,
  'state': instance.state,
  'votes': instance.votes,
  'codec': instance.codec,
  'bitrate': instance.bitrate,
  'lastcheckok': instance.lastcheckok,
  'lastchangetime': instance.lastchangetime?.toIso8601String(),
  'lastchangetime_iso8601': instance.lastchangetimeIso8601?.toIso8601String(),
  'lastchecktime': instance.lastchecktime?.toIso8601String(),
  'lastchecktime_iso8601': instance.lastchecktimeIso8601?.toIso8601String(),
  'lastcheckoktime': instance.lastcheckoktime?.toIso8601String(),
  'lastcheckoktime_iso8601': instance.lastcheckoktimeIso8601?.toIso8601String(),
  'lastlocalchecktime': instance.lastlocalchecktime?.toIso8601String(),
  'lastlocalchecktime_iso8601': instance.lastlocalchecktimeIso8601
      ?.toIso8601String(),
  'clicktimestamp': instance.clicktimestamp?.toIso8601String(),
  'clicktimestamp_iso8601': instance.clicktimestampIso8601?.toIso8601String(),
  'clickcount': instance.clickcount,
  'clicktrend': instance.clicktrend,
  'geo_lat': instance.geoLat,
  'geo_long': instance.geoLong,
  'has_extended_info': instance.hasExtendedInfo,
};

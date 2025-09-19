// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_radio_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteRadioStation _$FavoriteRadioStationFromJson(
  Map<String, dynamic> json,
) => _FavoriteRadioStation(
  id: json['id'] as String,
  name: json['name'] as String,
  url: json['url'] as String,
  favicon: json['favicon'] as String,
  dateAdded: json['dateAdded'] == null
      ? null
      : DateTime.parse(json['dateAdded'] as String),
);

Map<String, dynamic> _$FavoriteRadioStationToJson(
  _FavoriteRadioStation instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'url': instance.url,
  'favicon': instance.favicon,
  'dateAdded': instance.dateAdded?.toIso8601String(),
};

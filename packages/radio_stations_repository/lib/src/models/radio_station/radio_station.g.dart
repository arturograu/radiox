// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RadioStation _$RadioStationFromJson(Map<String, dynamic> json) =>
    _RadioStation(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      favicon: json['favicon'] as String?,
    );

Map<String, dynamic> _$RadioStationToJson(_RadioStation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'favicon': instance.favicon,
    };

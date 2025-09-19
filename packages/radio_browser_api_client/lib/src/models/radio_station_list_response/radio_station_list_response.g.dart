// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radio_station_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RadioStationListResponse _$RadioStationListResponseFromJson(
  Map<String, dynamic> json,
) => _RadioStationListResponse(
  stations: (json['stations'] as List<dynamic>)
      .map((e) => RadioStation.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RadioStationListResponseToJson(
  _RadioStationListResponse instance,
) => <String, dynamic>{
  'stations': instance.stations.map((e) => e.toJson()).toList(),
};

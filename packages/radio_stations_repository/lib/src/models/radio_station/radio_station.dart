import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_browser_api_client/radio_browser_api_client.dart' as api;

part 'radio_station.freezed.dart';
part 'radio_station.g.dart';

@freezed
sealed class RadioStation with _$RadioStation {
  const factory RadioStation({
    required String id,
    required String name,
    required String url,
    String? favicon,
  }) = _RadioStation;

  factory RadioStation.fromJson(Map<String, dynamic> json) =>
      _$RadioStationFromJson(json);

  factory RadioStation.fromApi(api.RadioStation radioStation) => RadioStation(
    id: radioStation.stationuuid,
    name: radioStation.name,
    url: radioStation.url,
    favicon: radioStation.favicon,
  );
}

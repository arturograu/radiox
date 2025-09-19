import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_browser_api_client/radio_browser_api_client.dart';

part 'radio_station_list_response.freezed.dart';
part 'radio_station_list_response.g.dart';

@freezed
sealed class RadioStationListResponse with _$RadioStationListResponse {
  factory RadioStationListResponse({
    required List<RadioStation> stations,
  }) = _RadioStationListResponse;

  factory RadioStationListResponse.fromJson(Map<String, dynamic> json) =>
      _$RadioStationListResponseFromJson(json);
}

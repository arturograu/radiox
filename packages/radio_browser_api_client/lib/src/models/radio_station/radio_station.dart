// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'radio_station.freezed.dart';
part 'radio_station.g.dart';

/// Radio station model
@freezed
sealed class RadioStation with _$RadioStation {
  const factory RadioStation({
    required String name,
    required String stationuuid,
    required String url,
    String? changeuuid,
    String? urlResolved,
    String? homepage,
    String? favicon,
    String? countrycode,
    String? state,
    @Default(0) int votes,
    String? codec,
    @Default(0) int bitrate,
    @JsonKey(fromJson: intToBool) @Default(false) bool lastcheckok,
    DateTime? lastchangetime,
    DateTime? lastchangetimeIso8601,
    DateTime? lastchecktime,
    DateTime? lastchecktimeIso8601,
    DateTime? lastcheckoktime,
    DateTime? lastcheckoktimeIso8601,
    DateTime? lastlocalchecktime,
    DateTime? lastlocalchecktimeIso8601,
    DateTime? clicktimestamp,
    DateTime? clicktimestampIso8601,
    @Default(0) int clickcount,
    @Default(0) int clicktrend,
    double? geoLat,
    double? geoLong,
    @Default(false) bool hasExtendedInfo,
  }) = _RadioStation;

  factory RadioStation.fromJson(Map<String, dynamic> json) =>
      _$RadioStationFromJson(json);
}

/// Converts an integer or string to a boolean.
bool intToBool(Object? v) {
  if (v is bool) return v;
  if (v is num) return v != 0;
  if (v is String) return v == '1' || v.toLowerCase() == 'true';
  return false;
}

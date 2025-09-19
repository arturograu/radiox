import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';

part 'favorite_radio_station.freezed.dart';
part 'favorite_radio_station.g.dart';

/// {@template favorite_radio_station}
/// A stable model for storing favorite radio stations in local storage.
/// This model should remain backward compatible to prevent breaking user data.
/// {@endtemplate}
@freezed
sealed class FavoriteRadioStation with _$FavoriteRadioStation {
  const factory FavoriteRadioStation({
    required String id,
    required String name,
    required String url,
    DateTime? dateAdded,
  }) = _FavoriteRadioStation;

  factory FavoriteRadioStation.fromJson(Map<String, dynamic> json) =>
      _$FavoriteRadioStationFromJson(json);

  factory FavoriteRadioStation.fromRadioStation(RadioStation radioStation) =>
      FavoriteRadioStation(
        id: radioStation.id,
        name: radioStation.name,
        url: radioStation.url,
        dateAdded: DateTime.now(),
      );
}

extension FavoriteRadioStationExtension on FavoriteRadioStation {
  /// Converts this favorite radio station back to a RadioStation.
  RadioStation toRadioStation() => RadioStation(
    id: id,
    name: name,
    url: url,
  );
}

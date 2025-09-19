import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';

part 'user.freezed.dart';

@freezed
sealed class User with _$User {
  const factory User({
    @Default([]) List<RadioStation> favoriteRadioStations,
  }) = _User;
}

import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/app/app.dart';
import 'package:radiox/bootstrap.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  bootstrap(
    ({
      required RadioStationsRepository radioStationsRepository,
      required UserRepository userRepository,
      required List<RadioStation> favoriteRadioStations,
    }) => App(
      radioStationsRepository: radioStationsRepository,
      userRepository: userRepository,
      favoriteRadioStations: favoriteRadioStations,
    ),
  );
}

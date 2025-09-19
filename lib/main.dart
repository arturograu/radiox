import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/app/app.dart';
import 'package:radiox/bootstrap.dart';

void main() {
  bootstrap(
    ({required RadioStationsRepository radioStationsRepository}) =>
        App(radioStationsRepository: radioStationsRepository),
  );
}

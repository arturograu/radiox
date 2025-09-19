import 'package:radio_browser_api_client/radio_browser_api_client.dart' as api;
import 'package:radio_stations_repository/radio_stations_repository.dart';

/// {@template radio_stations_repository}
/// Repository to manage radio stations data
/// {@endtemplate}
class RadioStationsRepository {
  /// {@macro radio_stations_repository}
  const RadioStationsRepository({required api.RadioBrowserApiClient apiClient})
    : _apiClient = apiClient;

  final api.RadioBrowserApiClient _apiClient;

  Future<List<RadioStation>> getRadioStations() async {
    final radioStations = await _apiClient.listTopStations();
    return radioStations.map(RadioStation.fromApi).toList();
  }
}

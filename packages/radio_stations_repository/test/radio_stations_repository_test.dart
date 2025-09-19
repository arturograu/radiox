import 'package:mocktail/mocktail.dart';
import 'package:radio_browser_api_client/radio_browser_api_client.dart' as api;
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:test/test.dart';

class MockRadioBrowserApiClient extends Mock
    implements api.RadioBrowserApiClient {}

void main() {
  group('RadioStationsRepository', () {
    final testApiRadioStations = [
      api.RadioStation(
        name: 'Test Radio 1',
        changeuuid: 'change-uuid-1',
        stationuuid: 'station-uuid-1',
        url: 'http://test1.com/stream',
        urlResolved: 'http://test1.com/stream',
        homepage: 'http://test1.com',
        favicon: 'http://test1.com/icon.png',
        countrycode: 'US',
        state: 'California',
        votes: 100,
        codec: 'MP3',
        bitrate: 128,
        lastcheckok: true,
        lastchecktime: DateTime.parse('2023-01-01T12:00:00Z'),
        clickcount: 50,
        clicktrend: 5,
        geoLat: 37.7749,
        geoLong: -122.4194,
        hasExtendedInfo: true,
      ),
      api.RadioStation(
        name: 'Test Radio 2',
        changeuuid: 'change-uuid-2',
        stationuuid: 'station-uuid-2',
        url: 'http://test2.com/stream',
        urlResolved: 'http://test2.com/stream',
        homepage: 'http://test2.com',
        favicon: 'http://test2.com/icon.png',
        countrycode: 'UK',
        state: 'England',
        votes: 200,
        codec: 'AAC',
        bitrate: 256,
        lastcheckok: true,
        lastchecktime: DateTime.parse('2023-01-02T12:00:00Z'),
        clickcount: 75,
        clicktrend: 10,
        geoLat: 51.5074,
        geoLong: -0.1278,
      ),
    ];

    late MockRadioBrowserApiClient mockApiClient;
    late RadioStationsRepository radioStationsRepository;

    setUp(() {
      mockApiClient = MockRadioBrowserApiClient();
      radioStationsRepository = RadioStationsRepository(
        apiClient: mockApiClient,
      );
    });

    group('getRadioStations', () {
      test('returns a list of radio stations', () async {
        when(
          () => mockApiClient.listTopStations(),
        ).thenAnswer((_) async => testApiRadioStations);

        final result = await radioStationsRepository.getRadioStations();

        expect(
          result,
          equals([
            const RadioStation(
              id: 'station-uuid-1',
              name: 'Test Radio 1',
              url: 'http://test1.com/stream',
            ),
            const RadioStation(
              id: 'station-uuid-2',
              name: 'Test Radio 2',
              url: 'http://test2.com/stream',
            ),
          ]),
        );

        verify(() => mockApiClient.listTopStations()).called(1);
      });

      test('returns empty list when API returns empty list', () async {
        when(
          () => mockApiClient.listTopStations(),
        ).thenAnswer((_) async => <api.RadioStation>[]);

        final result = await radioStationsRepository.getRadioStations();

        expect(result, isEmpty);
        verify(() => mockApiClient.listTopStations()).called(1);
      });
    });
  });
}

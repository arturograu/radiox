import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:radio_browser_api_client/radio_browser_api_client.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  group('RadioBrowserApiClient', () {
    const testServer1 = Server(
      name: 'de1.api.radio-browser.info',
      ip: '78.47.61.83',
    );
    const testServer2 = Server(
      name: 'fi1.api.radio-browser.info',
      ip: '195.181.165.88',
    );
    final testServersList = [testServer1, testServer2];

    final testRadioStation = RadioStation(
      name: 'Test Radio Station',
      changeuuid: 'change-uuid-123',
      stationuuid: 'station-uuid-123',
      url: 'http://test.radio.com/stream',
      urlResolved: 'http://resolved.test.radio.com/stream',
      homepage: 'http://test.radio.com',
      favicon: 'http://test.radio.com/favicon.ico',
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
    );

    final testRadioStationsList = [testRadioStation];

    late MockHttpClient httpClient;
    late RadioBrowserApiClient radioBrowserApiClient;

    setUp(() {
      httpClient = MockHttpClient();
      radioBrowserApiClient = RadioBrowserApiClient(
        httpClient: httpClient,
        userAgent: 'test-user-agent/1.0',
      );
    });

    test('constructor returns normally', () {
      expect(
        RadioBrowserApiClient.new,
        returnsNormally,
      );
    });

    test('constructor with custom httpClient and userAgent', () {
      final customClient = MockHttpClient();
      const customUserAgent = 'custom-agent/2.0';

      expect(
        () => RadioBrowserApiClient(
          httpClient: customClient,
          userAgent: customUserAgent,
        ),
        returnsNormally,
      );
    });

    group('initialize', () {
      test('successfully initializes with valid servers list', () async {
        final serversResponse = http.Response(
          jsonEncode(testServersList.map((s) => s.toJson()).toList()),
          HttpStatus.ok,
        );
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/servers')),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => serversResponse);
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/stats')),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => http.Response('{}', HttpStatus.ok));

        await radioBrowserApiClient.initialize();

        verify(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/servers')),
            headers: any(named: 'headers'),
          ),
        ).called(1);
        verify(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/stats')),
            headers: any(named: 'headers'),
          ),
        ).called(greaterThan(0));
      });

      test('falls back to known mirrors when servers list is empty', () async {
        final serversResponse = http.Response('[]', HttpStatus.ok);
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/servers')),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => serversResponse);
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/stats')),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => http.Response('{}', HttpStatus.ok));

        await radioBrowserApiClient.initialize();

        verify(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/stats')),
            headers: any(named: 'headers'),
          ),
        ).called(greaterThan(0));
      });

      test('throws exception when servers list request fails', () async {
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/servers')),
            headers: any(named: 'headers'),
          ),
        ).thenThrow(const SocketException('Network error'));

        expect(
          () => radioBrowserApiClient.initialize(),
          throwsA(
            isA<RadioBrowserApiException>().having(
              (e) => e.message,
              'message',
              'Unexpected servers response format',
            ),
          ),
        );
      });

      test('throws exception when no mirrors are reachable', () async {
        final serversResponse = http.Response(
          jsonEncode(testServersList.map((s) => s.toJson()).toList()),
          HttpStatus.ok,
        );
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/servers')),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => serversResponse);
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/stats')),
            headers: any(named: 'headers'),
          ),
        ).thenThrow(const SocketException('Connection failed'));

        expect(
          () => radioBrowserApiClient.initialize(),
          throwsA(isA<StateError>()),
        );
      });

      test('does not reinitialize if already initialized', () async {
        final serversResponse = http.Response(
          jsonEncode(testServersList.map((s) => s.toJson()).toList()),
          HttpStatus.ok,
        );
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/servers')),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => serversResponse);

        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/stats')),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => http.Response('{}', HttpStatus.ok));

        await radioBrowserApiClient.initialize();

        // Second initialization should not make new requests
        await radioBrowserApiClient.initialize();

        verify(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/servers')),
            headers: any(named: 'headers'),
          ),
        ).called(1);
      });
    });

    group('listTopStations', () {
      setUp(() async {
        final serversResponse = http.Response(
          jsonEncode(testServersList.map((s) => s.toJson()).toList()),
          HttpStatus.ok,
        );
        when(
          () => httpClient.get(
            Uri.https('de1.api.radio-browser.info', '/json/servers'),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => serversResponse);
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path == '/json/stats')),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => http.Response('{}', HttpStatus.ok));
        when(
          () => httpClient.get(
            any(
              that: predicate<Uri>(
                (uri) =>
                    !uri.path.contains('/json/servers') &&
                    !uri.path.contains('/json/stats'),
              ),
            ),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => http.Response('[]', HttpStatus.ok));

        await radioBrowserApiClient.initialize();
      });

      test('makes correct http request with default parameters', () async {
        final response = http.Response(
          jsonEncode(testRadioStationsList.map((s) => s.toJson()).toList()),
          HttpStatus.ok,
        );
        when(
          () => httpClient.get(
            Uri.https(
              'de1.api.radio-browser.info',
              '/json/stations/topclick',
              {'limit': '20', 'hidebroken': 'true'},
            ),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => response);

        await radioBrowserApiClient.listTopStations();

        verify(
          () => httpClient.get(
            any(
              that: predicate<Uri>(
                (uri) =>
                    uri.path.contains('/json/stations/topclick') &&
                    uri.queryParameters['limit'] == '20' &&
                    uri.queryParameters['hidebroken'] == 'true',
              ),
            ),
            headers: any(named: 'headers'),
          ),
        ).called(1);
      });

      test('makes correct http request with custom parameters', () async {
        final response = http.Response(
          jsonEncode(testRadioStationsList.map((s) => s.toJson()).toList()),
          HttpStatus.ok,
        );
        when(
          () => httpClient.get(
            Uri.https(
              'de1.api.radio-browser.info',
              '/json/stations/topclick',
              {'limit': '50'},
            ),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => response);

        await radioBrowserApiClient.listTopStations(
          limit: 50,
          hideBroken: false,
        );

        verify(
          () => httpClient.get(
            any(
              that: predicate<Uri>(
                (uri) =>
                    uri.path.contains('/json/stations/topclick') &&
                    uri.queryParameters['limit'] == '50' &&
                    !uri.queryParameters.containsKey('hidebroken'),
              ),
            ),
            headers: any(named: 'headers'),
          ),
        ).called(1);
      });

      test('returns list of RadioStation on 200 response', () async {
        final response = http.Response(
          jsonEncode(testRadioStationsList.map((s) => s.toJson()).toList()),
          HttpStatus.ok,
        );
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path.contains('topclick'))),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => response);

        final result = await radioBrowserApiClient.listTopStations();

        expect(result, hasLength(1));
        expect(result.first.name, equals('Test Radio Station'));
        expect(result.first.stationuuid, equals('station-uuid-123'));
        expect(result.first.votes, equals(100));
      });

      test('returns empty list on empty response', () async {
        final response = http.Response('[]', HttpStatus.ok);
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path.contains('topclick'))),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => response);

        final result = await radioBrowserApiClient.listTopStations();

        expect(result, isEmpty);
      });

      test('throws RadioBrowserApiException when not initialized', () async {
        final uninitializedClient = RadioBrowserApiClient(
          httpClient: httpClient,
        );

        expect(
          uninitializedClient.listTopStations,
          throwsA(
            isA<RadioBrowserApiException>().having(
              (e) => e.message,
              'message',
              'Client not initialized. Call initialize() first.',
            ),
          ),
        );
      });

      test('throws RadioBrowserApiException on non-200 response', () async {
        final response = http.Response('Not Found', HttpStatus.notFound);

        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path.contains('topclick'))),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => response);

        expect(
          () => radioBrowserApiClient.listTopStations(),
          throwsA(
            isA<RadioBrowserApiException>().having(
              (e) => e.message,
              'message',
              contains('HTTP 404'),
            ),
          ),
        );
      });

      test('throws RadioBrowserApiException on network error', () async {
        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path.contains('topclick'))),
            headers: any(named: 'headers'),
          ),
        ).thenThrow(const SocketException('Network error'));

        expect(
          () => radioBrowserApiClient.listTopStations(),
          throwsA(
            isA<RadioBrowserApiException>().having(
              (e) => e.message,
              'message',
              contains('HTTP GET failed'),
            ),
          ),
        );
      });

      test('throws RadioBrowserApiException on invalid JSON', () async {
        final response = http.Response('invalid json', HttpStatus.ok);

        when(
          () => httpClient.get(
            any(that: predicate<Uri>((uri) => uri.path.contains('topclick'))),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer((_) async => response);

        expect(
          () => radioBrowserApiClient.listTopStations(),
          throwsA(
            isA<RadioBrowserApiException>().having(
              (e) => e.message,
              'message',
              contains('Failed to decode JSON'),
            ),
          ),
        );
      });
    });

    group('RadioBrowserApiException', () {
      test('toString returns correct format', () {
        const exception = RadioBrowserApiException('Test error message');
        expect(
          exception.toString(),
          equals('RadioBrowserApiException: Test error message'),
        );
      });

      test('has correct message property', () {
        const exception = RadioBrowserApiException('Test error message');
        expect(exception.message, equals('Test error message'));
      });
    });
  });
}

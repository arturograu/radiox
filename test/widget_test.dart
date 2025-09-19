import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:radio_browser_api_client/radio_browser_api_client.dart' as api;
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/app/app.dart';

class MockRadioBrowserApiClient extends Mock
    implements api.RadioBrowserApiClient {}

void main() {
  testWidgets('RadioX app smoke test', (WidgetTester tester) async {
    final mockApiClient = MockRadioBrowserApiClient();
    final mockRepository = RadioStationsRepository(apiClient: mockApiClient);

    when(() => mockApiClient.listTopStations()).thenAnswer((_) async => []);

    await tester.pumpWidget(App(radioStationsRepository: mockRepository));

    expect(find.text('RadioX'), findsOneWidget);
  });
}

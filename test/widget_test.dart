import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:radio_browser_api_client/radio_browser_api_client.dart' as api;
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/app/app.dart';
import 'package:user_repository/user_repository.dart';

class MockRadioBrowserApiClient extends Mock
    implements api.RadioBrowserApiClient {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  testWidgets('RadioX app smoke test', (WidgetTester tester) async {
    final mockApiClient = MockRadioBrowserApiClient();
    final mockRadioStationsRepository = RadioStationsRepository(
      apiClient: mockApiClient,
    );
    final mockUserRepository = MockUserRepository();

    when(mockApiClient.listTopStations).thenAnswer((_) async => []);
    when(
      () => mockUserRepository.isFavoriteRadioStation(any()),
    ).thenReturn(false);

    await tester.pumpWidget(
      App(
        radioStationsRepository: mockRadioStationsRepository,
        userRepository: mockUserRepository,
      ),
    );

    expect(find.text('RadioX'), findsOneWidget);
  });
}

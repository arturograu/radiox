import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'package:user_repository/user_repository.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('UserRepository', () {
    const testRadioStation1 = RadioStation(
      name: 'Test Radio 1',
      url: 'http://test1.radio.com/stream',
    );
    const testRadioStation2 = RadioStation(
      name: 'Test Radio 2',
      url: 'http://test2.radio.com/stream',
    );

    late UserRepository userRepository;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() async {
      mockSharedPreferences = MockSharedPreferences();

      // Mock SharedPreferences methods
      when(
        () => mockSharedPreferences.getStringList(any()),
      ).thenReturn(<String>[]);
      when(
        () => mockSharedPreferences.setStringList(any(), any()),
      ).thenAnswer((_) async => true);

      userRepository = UserRepository(sharedPreferences: mockSharedPreferences);
      await userRepository.initialize();
    });

    tearDown(() async {
      await userRepository.dispose();
    });

    test('UserRepositoryException has correct message', () {
      const exception = UserRepositoryException('Test error message');

      expect(exception.message, equals('Test error message'));
      expect(
        exception.toString(),
        equals('UserRepositoryException: Test error message'),
      );
    });

    group('user stream', () {
      test('emits initial user', () async {
        final user = await userRepository.user.first;

        expect(user.favoriteRadioStations, isEmpty);
      });

      test('emits updated user when favorites change', () async {
        final userStream = userRepository.user;
        final users = <User>[];

        // Listen to user changes
        final subscription = userStream.listen(users.add);

        // Wait for initial user
        await Future.delayed(const Duration(milliseconds: 10));

        // Add a favorite
        await userRepository.addFavoriteRadioStation(testRadioStation1);

        // Wait for stream to emit
        await Future.delayed(const Duration(milliseconds: 10));

        expect(users, hasLength(2)); // Initial + updated
        expect(users.last.favoriteRadioStations, equals([testRadioStation1]));

        await subscription.cancel();
      });
    });

    group('favorite radio stations', () {
      test('starts with empty favorites', () {
        expect(userRepository.isFavoriteRadioStation('Test Radio 1'), isFalse);
      });

      test('can add favorite radio station', () async {
        await userRepository.addFavoriteRadioStation(testRadioStation1);

        expect(userRepository.isFavoriteRadioStation('Test Radio 1'), isTrue);
      });

      test('does not add duplicate favorites', () async {
        await userRepository.addFavoriteRadioStation(testRadioStation1);
        await userRepository.addFavoriteRadioStation(testRadioStation1);

        final favorites = await userRepository.favoriteRadioStations.first;
        expect(favorites, equals([testRadioStation1]));
      });

      test('can remove favorite radio station', () async {
        await userRepository.addFavoriteRadioStation(testRadioStation1);
        expect(userRepository.isFavoriteRadioStation('Test Radio 1'), isTrue);

        await userRepository.removeFavoriteRadioStation('Test Radio 1');
        expect(userRepository.isFavoriteRadioStation('Test Radio 1'), isFalse);
      });

      test('removing non-existent favorite does nothing', () async {
        await userRepository.removeFavoriteRadioStation('Non-existent Radio');

        final favorites = await userRepository.favoriteRadioStations.first;
        expect(favorites, isEmpty);
      });

      test('can manage multiple favorites', () async {
        await userRepository.addFavoriteRadioStation(testRadioStation1);
        await userRepository.addFavoriteRadioStation(testRadioStation2);

        expect(userRepository.isFavoriteRadioStation('Test Radio 1'), isTrue);
        expect(userRepository.isFavoriteRadioStation('Test Radio 2'), isTrue);

        final favorites = await userRepository.favoriteRadioStations.first;
        expect(favorites, hasLength(2));
        expect(favorites, containsAll([testRadioStation1, testRadioStation2]));
      });

      test(
        'favoriteRadioStations stream emits when favorites change',
        () async {
          final favoritesStream = userRepository.favoriteRadioStations;
          final favoritesList = <List<RadioStation>>[];

          // Listen to favorites changes
          final subscription = favoritesStream.listen(favoritesList.add);

          // Wait for initial empty list
          await Future.delayed(const Duration(milliseconds: 10));

          // Add favorites
          await userRepository.addFavoriteRadioStation(testRadioStation1);
          await userRepository.addFavoriteRadioStation(testRadioStation2);

          // Wait for streams to emit
          await Future.delayed(const Duration(milliseconds: 10));

          expect(favoritesList, hasLength(3)); // Initial + 2 updates
          expect(favoritesList[0], isEmpty); // Initial
          expect(
            favoritesList[1],
            equals([testRadioStation1]),
          ); // After first add
          expect(
            favoritesList[2],
            equals([testRadioStation1, testRadioStation2]),
          ); // After second add

          await subscription.cancel();
        },
      );

      test('stream does not emit when adding duplicate favorite', () async {
        final favoritesStream = userRepository.favoriteRadioStations;
        final favoritesList = <List<RadioStation>>[];

        // Listen to favorites changes
        final subscription = favoritesStream.listen(favoritesList.add);

        // Wait for initial
        await Future.delayed(const Duration(milliseconds: 10));

        // Add same favorite twice
        await userRepository.addFavoriteRadioStation(testRadioStation1);
        await userRepository.addFavoriteRadioStation(testRadioStation1);

        // Wait for streams
        await Future.delayed(const Duration(milliseconds: 10));

        expect(favoritesList, hasLength(2)); // Initial + 1 update (not 2)
        expect(favoritesList[1], equals([testRadioStation1]));

        await subscription.cancel();
      });
    });

    group('local storage persistence', () {
      test('loads favorites from storage on initialization', () async {
        // Setup mock to return saved favorites as JSON
        final favorite1 = FavoriteRadioStation.fromRadioStation(
          testRadioStation1,
        );
        final favorite2 = FavoriteRadioStation.fromRadioStation(
          testRadioStation2,
        );
        final station1Json = jsonEncode(favorite1.toJson());
        final station2Json = jsonEncode(favorite2.toJson());

        when(
          () => mockSharedPreferences.getStringList('favorite_radio_stations'),
        ).thenReturn([station1Json, station2Json]);

        final newRepository = UserRepository(
          sharedPreferences: mockSharedPreferences,
        );
        await newRepository.initialize();

        expect(newRepository.isFavoriteRadioStation('Test Radio 1'), isTrue);
        expect(newRepository.isFavoriteRadioStation('Test Radio 2'), isTrue);

        await newRepository.dispose();
      });

      test('saves favorites to storage when adding', () async {
        await userRepository.addFavoriteRadioStation(testRadioStation1);

        // Verify that a FavoriteRadioStation JSON was saved
        verify(
          () => mockSharedPreferences.setStringList(
            'favorite_radio_stations',
            any(that: hasLength(1)),
          ),
        ).called(1);
      });

      test('saves favorites to storage when removing', () async {
        await userRepository.addFavoriteRadioStation(testRadioStation1);
        await userRepository.addFavoriteRadioStation(testRadioStation2);

        // Clear previous calls
        clearInteractions(mockSharedPreferences);

        await userRepository.removeFavoriteRadioStation('Test Radio 1');

        // Verify that only one station remains in storage
        verify(
          () => mockSharedPreferences.setStringList(
            'favorite_radio_stations',
            any(that: hasLength(1)),
          ),
        ).called(1);
      });

      test('handles storage errors gracefully', () async {
        when(
          () => mockSharedPreferences.setStringList(any(), any()),
        ).thenThrow(Exception('Storage error'));

        // Should not throw, but handle gracefully
        expect(
          () => userRepository.addFavoriteRadioStation(testRadioStation1),
          throwsA(isA<Exception>()),
        );
      });
    });
  });

  group('User', () {
    const testRadioStation1 = RadioStation(
      name: 'Test Radio 1',
      url: 'http://test1.radio.com/stream',
    );
    const testRadioStation2 = RadioStation(
      name: 'Test Radio 2',
      url: 'http://test2.radio.com/stream',
    );

    test('can be created with favorite radio stations', () {
      const user = User(
        favoriteRadioStations: [testRadioStation1, testRadioStation2],
      );

      expect(
        user.favoriteRadioStations,
        equals([testRadioStation1, testRadioStation2]),
      );
    });

    test('has correct default values', () {
      const user = User();

      expect(user.favoriteRadioStations, isEmpty);
    });

    test('equality works correctly', () {
      const user1 = User(favoriteRadioStations: [testRadioStation1]);
      const user2 = User(favoriteRadioStations: [testRadioStation1]);

      expect(user1, equals(user2));
      expect(user1.hashCode, equals(user2.hashCode));
    });

    test('copyWith works correctly for favorite radio stations', () {
      const originalUser = User(favoriteRadioStations: [testRadioStation1]);

      final updatedUser = originalUser.copyWith(
        favoriteRadioStations: [testRadioStation1, testRadioStation2],
      );

      expect(
        updatedUser.favoriteRadioStations,
        equals([testRadioStation1, testRadioStation2]),
      );
    });

    test('can handle empty favorite radio stations list', () {
      const user = User();

      expect(user.favoriteRadioStations, isEmpty);
      expect(user.favoriteRadioStations, isA<List<RadioStation>>());
    });
  });

  group('FavoriteRadioStation', () {
    const testRadioStation1 = RadioStation(
      name: 'Test Radio 1',
      url: 'http://test1.radio.com/stream',
    );

    test('can be created from RadioStation', () {
      final favorite = FavoriteRadioStation.fromRadioStation(testRadioStation1);

      expect(favorite.name, equals('Test Radio 1'));
      expect(favorite.url, equals('http://test1.radio.com/stream'));
      expect(favorite.dateAdded, isNotNull);
    });

    test('can be converted back to RadioStation', () {
      final favorite = FavoriteRadioStation.fromRadioStation(testRadioStation1);
      final radioStation = favorite.toRadioStation();

      expect(radioStation.name, equals('Test Radio 1'));
      expect(radioStation.url, equals('http://test1.radio.com/stream'));
    });

    test('preserves data through round-trip conversion', () {
      final favorite = FavoriteRadioStation.fromRadioStation(testRadioStation1);
      final radioStation = favorite.toRadioStation();
      final favoriteAgain = FavoriteRadioStation.fromRadioStation(radioStation);

      expect(favoriteAgain.name, equals(favorite.name));
      expect(favoriteAgain.url, equals(favorite.url));
    });

    test('can be serialized to and from JSON', () {
      final favorite = FavoriteRadioStation.fromRadioStation(testRadioStation1);
      final json = favorite.toJson();
      final favoriteFromJson = FavoriteRadioStation.fromJson(json);

      expect(favoriteFromJson.name, equals(favorite.name));
      expect(favoriteFromJson.url, equals(favorite.url));
      expect(favoriteFromJson.dateAdded, equals(favorite.dateAdded));
    });
  });
}

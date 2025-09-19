import 'package:flutter_test/flutter_test.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/radio_player/radio_player.dart';

void main() {
  group('RadioPlayerCubit', () {
    const testRadioStation = RadioStation(
      name: 'Test Radio',
      url: 'http://test.radio.com/stream',
    );

    group('RadioPlayerStatus', () {
      test('has correct enum values', () {
        expect(RadioPlayerStatus.values, contains(RadioPlayerStatus.initial));
        expect(RadioPlayerStatus.values, contains(RadioPlayerStatus.loading));
        expect(RadioPlayerStatus.values, contains(RadioPlayerStatus.playing));
        expect(RadioPlayerStatus.values, contains(RadioPlayerStatus.paused));
        expect(RadioPlayerStatus.values, contains(RadioPlayerStatus.error));

        // Verify stopped status is removed
        expect(RadioPlayerStatus.values.length, equals(5));
      });

      test('boolean getters work correctly', () {
        expect(RadioPlayerStatus.initial.isInitial, isTrue);
        expect(RadioPlayerStatus.loading.isLoading, isTrue);
        expect(RadioPlayerStatus.playing.isPlaying, isTrue);
        expect(RadioPlayerStatus.paused.isPaused, isTrue);
        expect(RadioPlayerStatus.error.isError, isTrue);

        // Verify other statuses are false when checking specific status
        expect(RadioPlayerStatus.initial.isPlaying, isFalse);
        expect(RadioPlayerStatus.playing.isPaused, isFalse);
        expect(RadioPlayerStatus.paused.isError, isFalse);
      });
    });

    group('RadioPlayerState', () {
      test('can be created with required parameters', () {
        const state = RadioPlayerState(
          radioStation: testRadioStation,
          volume: 0.5,
          status: RadioPlayerStatus.playing,
          errorMessage: 'Test error',
        );

        expect(state.radioStation, equals(testRadioStation));
        expect(state.volume, equals(0.5));
        expect(state.status, equals(RadioPlayerStatus.playing));
        expect(state.errorMessage, equals('Test error'));
      });

      test('has correct default values', () {
        const state = RadioPlayerState(radioStation: testRadioStation);

        expect(state.status, equals(RadioPlayerStatus.initial));
        expect(state.volume, equals(0.7));
        expect(state.errorMessage, isNull);
      });

      test('copyWith works correctly', () {
        const originalState = RadioPlayerState(radioStation: testRadioStation);

        final newState = originalState.copyWith(
          status: RadioPlayerStatus.playing,
          volume: 0.8,
          errorMessage: 'Test error',
        );

        expect(newState.radioStation, equals(testRadioStation));
        expect(newState.status, equals(RadioPlayerStatus.playing));
        expect(newState.volume, equals(0.8));
        expect(newState.errorMessage, equals('Test error'));
      });

      test('preserves unchanged values in copyWith', () {
        const originalState = RadioPlayerState(
          radioStation: testRadioStation,
          volume: 0.5,
          status: RadioPlayerStatus.playing,
        );

        final newState = originalState.copyWith(
          errorMessage: 'New error',
        );

        expect(newState.radioStation, equals(testRadioStation));
        expect(newState.volume, equals(0.5));
        expect(newState.status, equals(RadioPlayerStatus.playing));
        expect(newState.errorMessage, equals('New error'));
      });
    });

    group('equality and toString', () {
      test('states with same values are equal', () {
        const state1 = RadioPlayerState(
          radioStation: testRadioStation,
        );
        const state2 = RadioPlayerState(
          radioStation: testRadioStation,
        );

        expect(state1, equals(state2));
        expect(state1.hashCode, equals(state2.hashCode));
      });

      test('states with different values are not equal', () {
        const state1 = RadioPlayerState(
          radioStation: testRadioStation,
        );
        const state2 = RadioPlayerState(
          radioStation: testRadioStation,
          volume: 0.8,
        );

        expect(state1, isNot(equals(state2)));
      });
    });
  });
}

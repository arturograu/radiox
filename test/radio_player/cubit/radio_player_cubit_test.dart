import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/radio_player/radio_player.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {}

void main() {
  group('RadioPlayerCubit', () {
    const testRadioStation = RadioStation(
      name: 'Test Radio',
      url: 'http://test.radio.com/stream',
    );

    late MockAudioPlayer mockAudioPlayer;
    late RadioPlayerCubit radioPlayerCubit;

    setUp(() {
      mockAudioPlayer = MockAudioPlayer();
      radioPlayerCubit = RadioPlayerCubit(
        radioStation: testRadioStation,
        audioPlayer: mockAudioPlayer,
      );

      when(
        () => mockAudioPlayer.playerState,
      ).thenReturn(PlayerState(false, ProcessingState.idle));

      when(() => mockAudioPlayer.dispose()).thenAnswer((_) async {});
    });

    tearDown(() async {
      await radioPlayerCubit.close();
    });

    test('initial state is correct', () {
      expect(
        radioPlayerCubit.state,
        equals(const RadioPlayerState(radioStation: testRadioStation)),
      );
    });

    test('radioStation getter returns correct station', () {
      expect(radioPlayerCubit.state.radioStation, equals(testRadioStation));
    });

    group('handlePlayPause', () {
      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'emits [loading, playing] when play succeeds from initial state',
        setUp: () {
          when(() => mockAudioPlayer.setUrl(any())).thenAnswer((_) async {
            return null;
          });
          when(() => mockAudioPlayer.play()).thenAnswer((_) async {});
        },
        build: () => radioPlayerCubit,
        act: (cubit) => cubit.handlePlayPause(),
        expect: () => [
          const RadioPlayerState(
            status: RadioPlayerStatus.loading,
            radioStation: testRadioStation,
          ),
          const RadioPlayerState(
            status: RadioPlayerStatus.playing,
            radioStation: testRadioStation,
          ),
        ],
        verify: (_) {
          verify(() => mockAudioPlayer.setUrl(testRadioStation.url)).called(1);
          verify(() => mockAudioPlayer.play()).called(1);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'emits [paused] when called while playing',
        seed: () => const RadioPlayerState(
          status: RadioPlayerStatus.playing,
          radioStation: testRadioStation,
        ),
        setUp: () {
          when(() => mockAudioPlayer.pause()).thenAnswer((_) async {});
        },
        build: () => radioPlayerCubit,
        act: (cubit) => cubit.handlePlayPause(),
        expect: () => [
          const RadioPlayerState(
            status: RadioPlayerStatus.paused,
            radioStation: testRadioStation,
          ),
        ],
        verify: (_) {
          verify(() => mockAudioPlayer.pause()).called(1);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'skips setUrl when player is not idle',
        setUp: () {
          when(
            () => mockAudioPlayer.playerState,
          ).thenReturn(PlayerState(false, ProcessingState.ready));
          when(() => mockAudioPlayer.play()).thenAnswer((_) async {});
        },
        build: () => radioPlayerCubit,
        act: (cubit) => cubit.handlePlayPause(),
        expect: () => [
          const RadioPlayerState(
            status: RadioPlayerStatus.loading,
            radioStation: testRadioStation,
          ),
          const RadioPlayerState(
            status: RadioPlayerStatus.playing,
            radioStation: testRadioStation,
          ),
        ],
        verify: (_) {
          verifyNever(() => mockAudioPlayer.setUrl(any()));
          verify(() => mockAudioPlayer.play()).called(1);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'emits [loading, error] when play fails',
        setUp: () {
          when(
            () => mockAudioPlayer.setUrl(any()),
          ).thenThrow(Exception('Network error'));
        },
        build: () => radioPlayerCubit,
        act: (cubit) => cubit.handlePlayPause(),
        expect: () => [
          const RadioPlayerState(
            status: RadioPlayerStatus.loading,
            radioStation: testRadioStation,
          ),
          const RadioPlayerState(
            status: RadioPlayerStatus.error,
            radioStation: testRadioStation,
            errorMessage:
                'Failed to play radio station: Exception: Network error',
          ),
        ],
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'emits [error] when pause fails',
        seed: () => const RadioPlayerState(
          status: RadioPlayerStatus.playing,
          radioStation: testRadioStation,
        ),
        setUp: () {
          when(
            () => mockAudioPlayer.pause(),
          ).thenThrow(Exception('Pause failed'));
        },
        build: () => radioPlayerCubit,
        act: (cubit) => cubit.handlePlayPause(),
        expect: () => [
          const RadioPlayerState(
            status: RadioPlayerStatus.error,
            radioStation: testRadioStation,
            errorMessage:
                'Failed to pause radio station: Exception: Pause failed',
          ),
        ],
      );
    });

    group('stop', () {
      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'emits [stopped] when stop succeeds',
        setUp: () {
          when(() => mockAudioPlayer.stop()).thenAnswer((_) async {});
        },
        build: () => radioPlayerCubit,
        act: (cubit) => cubit.stop(),
        expect: () => [
          const RadioPlayerState(
            status: RadioPlayerStatus.stopped,
            radioStation: testRadioStation,
          ),
        ],
        verify: (_) {
          verify(() => mockAudioPlayer.stop()).called(1);
        },
      );

      blocTest<RadioPlayerCubit, RadioPlayerState>(
        'emits [error] when stop fails',
        setUp: () {
          when(
            () => mockAudioPlayer.stop(),
          ).thenThrow(Exception('Stop failed'));
        },
        build: () => radioPlayerCubit,
        act: (cubit) => cubit.stop(),
        expect: () => [
          const RadioPlayerState(
            status: RadioPlayerStatus.error,
            radioStation: testRadioStation,
            errorMessage:
                'Failed to stop radio station: Exception: Stop failed',
          ),
        ],
      );
    });

    group('close', () {
      test('disposes audio player', () async {
        when(() => mockAudioPlayer.dispose()).thenAnswer((_) async {});

        await radioPlayerCubit.close();

        verify(() => mockAudioPlayer.dispose()).called(1);
      });
    });
  });
}

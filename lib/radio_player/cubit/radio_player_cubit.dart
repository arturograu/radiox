import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'radio_player_cubit.freezed.dart';

class RadioPlayerCubit extends Cubit<RadioPlayerState> {
  RadioPlayerCubit({
    required RadioStation radioStation,
    required UserRepository userRepository,
    AudioPlayer? audioPlayer,
  }) : _audioPlayer = audioPlayer ?? AudioPlayer(),
       _userRepository = userRepository,
       super(
         RadioPlayerState(
           radioStation: radioStation,
         ),
       ) {
    _playerStateSubscription = _audioPlayer.playerStateStream.listen(
      _onPlayerStateChanged,
    );
  }

  final AudioPlayer _audioPlayer;
  final UserRepository _userRepository;
  late final StreamSubscription<PlayerState> _playerStateSubscription;

  void _onPlayerStateChanged(PlayerState playerState) {
    emit(
      state.copyWith(status: playerState.radioPlayerStatus),
    );
  }

  Future<void> handlePlayPause() async {
    try {
      if (state.status.isPlaying) {
        await _audioPlayer.pause();
        return;
      }

      emit(state.copyWith(status: RadioPlayerStatus.loading));
      if (_audioPlayer.playerState.processingState.isIdle) {
        await _audioPlayer.setUrl(state.radioStation.url);
      }
      await _audioPlayer.play();
    } on Exception catch (error) {
      emit(
        state.copyWith(
          status: RadioPlayerStatus.error,
          errorMessage:
              'Failed to ${state.status.isPlaying ? 'pause' : 'play'} '
              'radio station: $error',
        ),
      );
    }
  }

  void volumeUp() {
    final newVolume = (state.volume + 0.1).clamp(0.0, 1.0);
    setVolume(newVolume);
  }

  void volumeDown() {
    final newVolume = (state.volume - 0.1).clamp(0.0, 1.0);
    setVolume(newVolume);
  }

  void setVolume(double volume) {
    try {
      _audioPlayer.setVolume(volume);
      emit(state.copyWith(volume: volume));
    } on Exception catch (error) {
      emit(
        state.copyWith(
          status: RadioPlayerStatus.error,
          errorMessage: 'Failed to set volume: $error',
        ),
      );
    }
  }

  Future<void> markAsFavorite() async {
    await _userRepository.addFavoriteRadioStation(state.radioStation);
  }

  Future<void> unmarkAsFavorite() async {
    await _userRepository.removeFavoriteRadioStation(state.radioStation.id);
  }

  @override
  Future<void> close() async {
    await _audioPlayer.dispose();
    await _playerStateSubscription.cancel();
    return super.close();
  }
}

@freezed
sealed class RadioPlayerState with _$RadioPlayerState {
  const factory RadioPlayerState({
    required RadioStation radioStation,
    @Default(RadioPlayerStatus.initial) RadioPlayerStatus status,
    @Default(0.7) double volume,
    String? errorMessage,
  }) = _RadioPlayerState;
}

enum RadioPlayerStatus {
  initial,
  loading,
  playing,
  paused,
  error;

  bool get isInitial => this == RadioPlayerStatus.initial;
  bool get isLoading => this == RadioPlayerStatus.loading;
  bool get isPlaying => this == RadioPlayerStatus.playing;
  bool get isPaused => this == RadioPlayerStatus.paused;
  bool get isError => this == RadioPlayerStatus.error;
}

extension on PlayerState {
  RadioPlayerStatus get radioPlayerStatus => switch (processingState) {
    ProcessingState.idle => RadioPlayerStatus.initial,
    ProcessingState.loading => RadioPlayerStatus.loading,
    ProcessingState.buffering => RadioPlayerStatus.loading,
    ProcessingState.ready =>
      playing ? RadioPlayerStatus.playing : RadioPlayerStatus.paused,
    ProcessingState.completed => RadioPlayerStatus.playing,
  };
}

extension on ProcessingState {
  bool get isIdle => this == ProcessingState.idle;
}

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
    List<RadioStation> radioStations = const [],
    AudioPlayer? audioPlayer,
  }) : _audioPlayer = audioPlayer ?? AudioPlayer(),
       _userRepository = userRepository,
       super(
         RadioPlayerState(
           radioStation: radioStation,
           radioStations: radioStations,
           currentIndex: radioStations.isEmpty
               ? 0
               : radioStations
                     .indexWhere((station) => station.id == radioStation.id)
                     .clamp(0, radioStations.length - 1),
         ),
       ) {
    _playerStateSubscription = _audioPlayer.playerStateStream.listen(
      _onPlayerStateChanged,
    );
    _initializePlayer();
  }

  final AudioPlayer _audioPlayer;
  final UserRepository _userRepository;
  late StreamSubscription<PlayerState> _playerStateSubscription;

  void _onPlayerStateChanged(PlayerState playerState) {
    emit(
      state.copyWith(status: playerState.radioPlayerStatus),
    );
  }

  void _initializePlayer() {
    // Use Future.microtask to avoid calling async method in constructor
    Future.microtask(() async {
      try {
        emit(state.copyWith(status: RadioPlayerStatus.loading));
        await _audioPlayer.setUrl(state.radioStation.url);
        emit(state.copyWith(status: RadioPlayerStatus.initial));
      } on Exception catch (error) {
        emit(
          state.copyWith(
            status: RadioPlayerStatus.error,
            errorMessage: 'Failed to auto-play radio station: $error',
          ),
        );
      }
    });
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

  Future<void> playNext() async {
    if (!state.hasNext) return;

    final nextIndex = state.currentIndex + 1;
    final nextStation = state.radioStations[nextIndex];
    await _switchToStation(nextStation, nextIndex);
  }

  Future<void> playPrevious() async {
    if (!state.hasPrevious) return;

    final previousIndex = state.currentIndex - 1;
    final previousStation = state.radioStations[previousIndex];
    await _switchToStation(previousStation, previousIndex);
  }

  Future<void> _switchToStation(RadioStation station, int index) async {
    try {
      emit(
        state.copyWith(
          radioStation: station,
          currentIndex: index,
          status: RadioPlayerStatus.loading,
          errorMessage: null,
        ),
      );

      await _audioPlayer.setUrl(station.url);
      emit(state.copyWith(status: RadioPlayerStatus.initial));
    } on Exception catch (error) {
      emit(
        state.copyWith(
          status: RadioPlayerStatus.error,
          errorMessage: 'Failed to switch station: $error',
        ),
      );
    }
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
    @Default([]) List<RadioStation> radioStations,
    @Default(0) int currentIndex,
    @Default(RadioPlayerStatus.initial) RadioPlayerStatus status,
    @Default(0.7) double volume,
    @Default(true) bool isFirstRadioStationPlay,
    String? errorMessage,
  }) = _RadioPlayerState;
  const RadioPlayerState._();

  bool get hasNext =>
      radioStations.isNotEmpty && currentIndex < radioStations.length - 1;
  bool get hasPrevious => radioStations.isNotEmpty && currentIndex > 0;
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

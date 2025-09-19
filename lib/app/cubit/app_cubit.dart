import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'app_cubit.freezed.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(const AppState()) {
    _favoritesSubscription = _userRepository.favoriteRadioStations.listen(
      _onFavoritesChanged,
    );
  }

  final UserRepository _userRepository;
  late final StreamSubscription<List<RadioStation>> _favoritesSubscription;

  void _onFavoritesChanged(List<RadioStation> favoriteRadioStations) {
    emit(state.copyWith(favoriteRadioStations: favoriteRadioStations));
  }

  @override
  Future<void> close() async {
    await _favoritesSubscription.cancel();
    return super.close();
  }
}

@freezed
sealed class AppState with _$AppState {
  const factory AppState({
    @Default([]) List<RadioStation> favoriteRadioStations,
  }) = _AppState;
}

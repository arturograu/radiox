import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required RadioStationsRepository radioStationsRepository})
    : _radioStationsRepository = radioStationsRepository,
      super(const HomeState());

  final RadioStationsRepository _radioStationsRepository;

  Future<void> fetchRadioStations() async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final radioStations = await _radioStationsRepository.getRadioStations();
      emit(
        state.copyWith(status: HomeStatus.loaded, radioStations: radioStations),
      );
    } on Exception catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default([]) List<RadioStation> radioStations,
  }) = _HomeState;
}

enum HomeStatus { initial, loading, loaded, error }

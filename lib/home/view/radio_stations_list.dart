import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/home/home.dart';

class RadioStationsList extends StatelessWidget {
  const RadioStationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => switch (state.status) {
        HomeStatus.initial || HomeStatus.loading => const _LoadingView(),
        HomeStatus.loaded => _SuccessView(radioStations: state.radioStations),
        HomeStatus.error => const _FailureView(),
      },
    );
  }
}

class _FailureView extends StatelessWidget {
  const _FailureView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Failed to load radio stations'));
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView({required this.radioStations});

  final List<RadioStation> radioStations;

  @override
  Widget build(BuildContext context) {
    return radioStations.isEmpty
        ? const Center(child: Text('No radio stations found'))
        : ListView.builder(
            itemCount: radioStations.length,
            itemBuilder: (context, index) {
              final radioStation = radioStations[index];
              return RadioStationCard(
                name: radioStation.name,
                url: radioStation.url,
                onTap: () {
                  // TODO: Navigate to radio station details or start playing
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Playing ${radioStation.name}')),
                  );
                },
              );
            },
          );
  }
}

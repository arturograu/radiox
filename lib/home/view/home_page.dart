import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RadioX')),
      body: BlocProvider(
        create: (_) => HomeCubit(
          radioStationsRepository: context.read<RadioStationsRepository>(),
        )..fetchRadioStations(),
        child: const Column(
          children: [
            FavoritesSection(),
            Expanded(child: RadioStationsList()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RadioX'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: BlocProvider(
        create: (_) => HomeCubit(
          radioStationsRepository: context.read<RadioStationsRepository>(),
        )..fetchRadioStations(),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              FavoritesSection(),
              SizedBox(height: 32),
              _TrendingSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrendingSection extends StatelessWidget {
  const _TrendingSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Trending',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const RadioStationsList(),
      ],
    );
  }
}

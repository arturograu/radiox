import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/home/home.dart';

class App extends StatelessWidget {
  const App({
    required RadioStationsRepository radioStationsRepository,
    super.key,
  }) : _radioStationsRepository = radioStationsRepository;

  final RadioStationsRepository _radioStationsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _radioStationsRepository,
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RadioX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

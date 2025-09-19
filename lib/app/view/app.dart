import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/app/app.dart';
import 'package:radiox/home/home.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    required RadioStationsRepository radioStationsRepository,
    required UserRepository userRepository,
    super.key,
  }) : _radioStationsRepository = radioStationsRepository,
       _userRepository = userRepository;

  final RadioStationsRepository _radioStationsRepository;
  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _radioStationsRepository),
        RepositoryProvider.value(value: _userRepository),
      ],
      child: BlocProvider(
        create: (_) => AppCubit(userRepository: _userRepository),
        child: const _AppView(),
      ),
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

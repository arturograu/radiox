import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/radio_player/radio_player.dart';
import 'package:user_repository/user_repository.dart';

class RadioPlayerPage extends StatelessWidget {
  const RadioPlayerPage({required this.radioStation, super.key});

  final RadioStation radioStation;

  static Route<void> route(RadioStation radioStation) {
    return MaterialPageRoute(
      builder: (context) => RadioPlayerPage(radioStation: radioStation),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(radioStation.name), centerTitle: true),
      body: BlocProvider(
        create: (context) => RadioPlayerCubit(
          radioStation: radioStation,
          userRepository: context.read<UserRepository>(),
        ),
        child: const RadioPlayerView(),
      ),
    );
  }
}

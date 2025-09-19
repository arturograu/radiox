import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_browser_api_client/radio_browser_api_client.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:user_repository/user_repository.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  FutureOr<Widget> Function({
    required RadioStationsRepository radioStationsRepository,
    required UserRepository userRepository,
  })
  builder,
) async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = const AppBlocObserver();

  final radioBrowserApiClient = RadioBrowserApiClient();
  await radioBrowserApiClient.initialize();

  final radioStationsRepository = RadioStationsRepository(
    apiClient: radioBrowserApiClient,
  );

  final userRepository = UserRepository();
  await userRepository.initialize();

  runApp(
    await builder(
      radioStationsRepository: radioStationsRepository,
      userRepository: userRepository,
    ),
  );
}

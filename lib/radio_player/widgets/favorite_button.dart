import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/app/app.dart';
import 'package:radiox/radio_player/radio_player.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({required this.radioStation, super.key});

  final RadioStation radioStation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          previous.favoriteRadioStations != current.favoriteRadioStations,
      builder: (context, state) {
        final cubit = context.read<RadioPlayerCubit>();
        final isFavorite = state.favoriteRadioStations.contains(radioStation);
        final theme = Theme.of(context);

        return IconButton(
          onPressed: isFavorite ? cubit.unmarkAsFavorite : cubit.markAsFavorite,
          tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              state.favoriteRadioStations.contains(radioStation)
                  ? Icons.favorite
                  : Icons.favorite_border,
              key: ValueKey(state.favoriteRadioStations.contains(radioStation)),
              color: state.favoriteRadioStations.contains(radioStation)
                  ? Colors.red
                  : theme.colorScheme.onSurface.withValues(alpha: 0.7),
              size: 28,
            ),
          ),
          style: IconButton.styleFrom(
            backgroundColor: theme.colorScheme.surface,
            side: BorderSide(
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
            ),
            padding: const EdgeInsets.all(12),
          ),
        );
      },
    );
  }
}

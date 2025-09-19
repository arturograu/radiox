import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radiox/radio_player/radio_player.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      buildWhen: (previous, current) =>
          previous.isFavorite != current.isFavorite,
      builder: (context, state) {
        final cubit = context.read<RadioPlayerCubit>();
        final theme = Theme.of(context);

        return IconButton(
          onPressed: cubit.toggleFavorite,
          tooltip: state.isFavorite
              ? 'Remove from favorites'
              : 'Add to favorites',
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              state.isFavorite ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(state.isFavorite),
              color: state.isFavorite
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

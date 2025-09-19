import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radiox/app/app.dart';
import 'package:radiox/home/widgets/widgets.dart';
import 'package:radiox/radio_player/radio_player.dart';

class FavoritesSection extends StatelessWidget {
  const FavoritesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          previous.favoriteRadioStations != current.favoriteRadioStations,
      builder: (context, state) {
        if (state.favoriteRadioStations.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _FavoritesSectionHeader(),
            const SizedBox(height: 12),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: state.favoriteRadioStations.length,
                itemBuilder: (context, index) {
                  final radioStation = state.favoriteRadioStations[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index < state.favoriteRadioStations.length - 1
                          ? 12
                          : 0,
                    ),
                    child: FavoriteRadioStationCard(
                      radioStation: radioStation,
                      onTap: () {
                        Navigator.push(
                          context,
                          RadioPlayerPage.route(radioStation),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}

class _FavoritesSectionHeader extends StatelessWidget {
  const _FavoritesSectionHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            'Your Favorites',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

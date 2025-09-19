import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/app/app.dart';
import 'package:radiox/radio_player/radio_player.dart';
import 'package:radiox/shared/widgets/widgets.dart';

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
            const SizedBox(height: 16),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: state.favoriteRadioStations.length,
                itemBuilder: (context, index) {
                  final radioStation = state.favoriteRadioStations[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index < state.favoriteRadioStations.length - 1
                          ? 12
                          : 0,
                    ),
                    child: FavoriteGenrePill(
                      radioStation: radioStation,
                      onTap: () {
                        Navigator.push(
                          context,
                          RadioPlayerPage.route(
                            radioStation,
                            radioStations: state.favoriteRadioStations,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        'Favorites',
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class FavoriteGenrePill extends StatelessWidget {
  const FavoriteGenrePill({
    required this.radioStation,
    required this.onTap,
    super.key,
  });

  final RadioStation radioStation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.blue.shade300,
      Colors.purple.shade400,
      Colors.green.shade400,
      Colors.orange.shade400,
      Colors.red.shade400,
      Colors.teal.shade400,
    ];
    final gradientColor = colors[radioStation.name.hashCode % colors.length];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              gradientColor,
              gradientColor.withValues(alpha: 0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(22),
              ),
              child: RadioStationImage(
                imageUrl: radioStation.favicon,
                size: 44,
                fallbackIconSize: 20,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                radioStation.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radio_stations_repository/radio_stations_repository.dart';
import 'package:radiox/app/app.dart';
import 'package:radiox/radio_player/radio_player.dart';
import 'package:radiox/shared/widgets/widgets.dart';

class RadioPlayerView extends StatelessWidget {
  const RadioPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RadioPlayerCubit, RadioPlayerState>(
      listenWhen: (previous, current) =>
          previous.status != current.status && current.status.isError,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errorMessage ?? 'An error occurred'),
            backgroundColor: Colors.red,
          ),
        );
      },
      child: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            _LargeStationImage(),
            SizedBox(height: 32),
            _StationTitle(),
            SizedBox(height: 32),
            _PlayerControls(),
            SizedBox(height: 32),
            VolumeControls(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _LargeStationImage extends StatelessWidget {
  const _LargeStationImage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      buildWhen: (previous, current) =>
          previous.radioStation != current.radioStation,
      builder: (context, state) {
        final colors = [
          [Colors.orange.shade400, Colors.red.shade500],
          [Colors.purple.shade400, Colors.blue.shade600],
          [Colors.green.shade400, Colors.teal.shade600],
          [Colors.pink.shade400, Colors.purple.shade600],
          [Colors.blue.shade400, Colors.indigo.shade600],
          [Colors.amber.shade400, Colors.orange.shade600],
        ];
        final colorPair =
            colors[state.radioStation.name.hashCode % colors.length];

        return Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colorPair,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colorPair[0].withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: -40,
                right: -40,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: RadioStationImage(
                      imageUrl: state.radioStation.favicon,
                      size: 160,
                      borderRadius: 16,
                      fallbackIconSize: 60,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StationTitle extends StatelessWidget {
  const _StationTitle();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      buildWhen: (previous, current) =>
          previous.radioStation != current.radioStation,
      builder: (context, state) {
        final theme = Theme.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _StatusDisplay(),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    state.radioStation.name,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _FavoriteIcon(radioStation: state.radioStation),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _FavoriteIcon extends StatelessWidget {
  const _FavoriteIcon({required this.radioStation});

  final RadioStation radioStation;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          previous.favoriteRadioStations != current.favoriteRadioStations,
      builder: (context, state) {
        final cubit = context.read<RadioPlayerCubit>();
        final isFavorite = state.favoriteRadioStations.contains(radioStation);

        return GestureDetector(
          onTap: isFavorite ? cubit.unmarkAsFavorite : cubit.markAsFavorite,
          child: SizedBox(
            width: 48,
            height: 48,
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey.shade600,
              size: 24,
            ),
          ),
        );
      },
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.currentIndex != current.currentIndex ||
          previous.radioStations.length != current.radioStations.length,
      builder: (context, state) {
        final cubit = context.read<RadioPlayerCubit>();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (state.radioStations.isNotEmpty) ...[
              _ControlButton(
                icon: Icons.skip_previous,
                onPressed: state.hasPrevious && !state.status.isLoading
                    ? cubit.playPrevious
                    : null,
                size: 60,
                iconSize: 24,
              ),
              const SizedBox(width: 24),
            ],
            _ControlButton(
              icon: state.status.icon,
              onPressed: state.status.isLoading ? null : cubit.handlePlayPause,
              size: 80,
              iconSize: 32,
              isPrimary: true,
              isLoading: state.status.isLoading,
            ),
            if (state.radioStations.isNotEmpty) ...[
              const SizedBox(width: 24),
              _ControlButton(
                icon: Icons.skip_next,
                onPressed: state.hasNext && !state.status.isLoading
                    ? cubit.playNext
                    : null,
                size: 60,
                iconSize: 24,
              ),
            ],
          ],
        );
      },
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton({
    required this.icon,
    required this.onPressed,
    required this.size,
    required this.iconSize,
    this.isPrimary = false,
    this.isLoading = false,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final double iconSize;
  final bool isPrimary;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: isPrimary ? 20 : 8,
            offset: Offset(0, isPrimary ? 8 : 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(size / 2),
          onTap: onPressed,
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: iconSize * 0.75,
                    height: iconSize * 0.75,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.grey.shade700,
                      ),
                    ),
                  )
                : Icon(
                    icon,
                    size: iconSize,
                    color: onPressed != null
                        ? Colors.grey.shade700
                        : Colors.grey.shade400,
                  ),
          ),
        ),
      ),
    );
  }
}

class _StatusDisplay extends StatelessWidget {
  const _StatusDisplay();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.errorMessage != current.errorMessage,
      builder: (context, state) {
        return Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: state.status.dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              state.status.displayText,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
          ],
        );
      },
    );
  }
}

extension on RadioPlayerStatus {
  IconData get icon => switch (this) {
    RadioPlayerStatus.playing => Icons.pause,
    RadioPlayerStatus.paused => Icons.play_arrow,
    RadioPlayerStatus.initial => Icons.play_arrow,
    RadioPlayerStatus.loading => Icons.hourglass_empty,
    RadioPlayerStatus.error => Icons.error,
  };

  Color get dotColor => switch (this) {
    RadioPlayerStatus.playing => Colors.red,
    RadioPlayerStatus.paused => Colors.orange,
    RadioPlayerStatus.initial => Colors.grey,
    RadioPlayerStatus.loading => Colors.blue,
    RadioPlayerStatus.error => Colors.red,
  };

  String get displayText => switch (this) {
    RadioPlayerStatus.initial => 'READY',
    RadioPlayerStatus.loading => 'LOADING',
    RadioPlayerStatus.playing => 'LIVE',
    RadioPlayerStatus.paused => 'PAUSED',
    RadioPlayerStatus.error => 'ERROR',
  };
}

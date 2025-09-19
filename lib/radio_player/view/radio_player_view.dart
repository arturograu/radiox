import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: const Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _RadioStationInfo(),
            SizedBox(height: 24),
            _FavoriteButtonWrapper(),
            SizedBox(height: 48),
            _PlayerControls(),
            SizedBox(height: 32),
            VolumeControls(),
            SizedBox(height: 32),
            _StatusDisplay(),
          ],
        ),
      ),
    );
  }
}

class _RadioStationInfo extends StatelessWidget {
  const _RadioStationInfo();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      buildWhen: (previous, current) =>
          previous.radioStation != current.radioStation,
      builder: (context, state) {
        final theme = Theme.of(context);

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                RadioStationImage(
                  imageUrl: state.radioStation.favicon,
                  size: 120,
                ),
                const SizedBox(height: 16),
                Text(
                  state.radioStation.name,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (state.radioStation.url.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Streaming from: ${Uri.parse(state.radioStation.url).host}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _FavoriteButtonWrapper extends StatelessWidget {
  const _FavoriteButtonWrapper();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      buildWhen: (previous, current) =>
          previous.radioStation != current.radioStation,
      builder: (context, state) {
        return FavoriteButton(radioStation: state.radioStation);
      },
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        final cubit = context.read<RadioPlayerCubit>();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControlButton(
              icon: state.status.icon,
              onPressed: state.status.isLoading ? null : cubit.handlePlayPause,
              tooltip: state.status.buttonTooltip,
              isPrimary: true,
              isLoading: state.status.isLoading,
            ),
          ],
        );
      },
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
        final theme = Theme.of(context);

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: state.status.color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: state.status.color.withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            state.status.text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: state.status.color,
              fontWeight: FontWeight.w500,
            ),
          ),
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

  String get buttonTooltip => switch (this) {
    RadioPlayerStatus.playing => 'Pause',
    RadioPlayerStatus.paused => 'Play',
    RadioPlayerStatus.initial => 'Play',
    RadioPlayerStatus.loading => 'Loading...',
    RadioPlayerStatus.error => 'Error occurred',
  };

  Color get color => switch (this) {
    RadioPlayerStatus.playing => Colors.green,
    RadioPlayerStatus.paused => Colors.orange,
    RadioPlayerStatus.initial => Colors.grey,
    RadioPlayerStatus.loading => Colors.blue,
    RadioPlayerStatus.error => Colors.red,
  };

  String get text => switch (this) {
    RadioPlayerStatus.initial => 'Ready to play',
    RadioPlayerStatus.loading => 'Loading...',
    RadioPlayerStatus.playing => 'Now playing',
    RadioPlayerStatus.paused => 'Paused',
    RadioPlayerStatus.error => 'Error occurred',
  };
}

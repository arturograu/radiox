import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:radiox/radio_player/radio_player.dart';

class VolumeControls extends StatelessWidget {
  const VolumeControls({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      buildWhen: (previous, current) => previous.volume != current.volume,
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _VolumeSlider(volume: state.volume),
                const SizedBox(height: 12),
                _VolumeButtons(volume: state.volume),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VolumeSlider extends StatelessWidget {
  const _VolumeSlider({required this.volume});

  final double volume;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RadioPlayerCubit>();
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.volume_down,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 8,
              ),
            ),
            child: Slider(
              value: volume,
              onChanged: cubit.setVolume,
              divisions: 10,
              label: '${(volume * 100).round()}%',
            ),
          ),
        ),
        const SizedBox(width: 16),
        Icon(
          Icons.volume_up,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ],
    );
  }
}

class _VolumeButtons extends StatelessWidget {
  const _VolumeButtons({required this.volume});

  final double volume;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RadioPlayerCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ControlButton(
          icon: Icons.volume_down,
          onPressed: volume > 0.0 ? cubit.volumeDown : null,
          tooltip: 'Volume Down',
        ),
        _VolumeDisplay(volume: volume),
        ControlButton(
          icon: Icons.volume_up,
          onPressed: volume < 1.0 ? cubit.volumeUp : null,
          tooltip: 'Volume Up',
        ),
      ],
    );
  }
}

class _VolumeDisplay extends StatelessWidget {
  const _VolumeDisplay({required this.volume});

  final double volume;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        '${(volume * 100).round()}%',
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}

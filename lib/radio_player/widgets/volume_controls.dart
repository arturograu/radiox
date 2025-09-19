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
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
          ),
          child: _VolumeSlider(volume: state.volume),
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
      children: [
        Icon(
          Icons.volume_down,
          color: Colors.grey.shade400,
          size: 20,
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              activeTrackColor: theme.colorScheme.primary,
              inactiveTrackColor: Colors.grey.shade300,
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 6,
              ),
              thumbColor: theme.colorScheme.primary,
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
            ),
            child: Slider(
              value: volume,
              onChanged: cubit.setVolume,
              divisions: 20,
            ),
          ),
        ),
        Icon(
          Icons.volume_up,
          color: Colors.grey.shade400,
          size: 20,
        ),
      ],
    );
  }
}

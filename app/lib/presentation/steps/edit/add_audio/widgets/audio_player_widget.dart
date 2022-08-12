import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/steps/record_audio/record_audio_cubit.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/hooks/sound_player_hook.dart';

/// Widget to playback the audio recording
class AudioPlayerWidget extends HookWidget {
  final String audioPath;
  const AudioPlayerWidget({super.key, required this.audioPath});

  @override
  Widget build(BuildContext context) {
    final player = useSoundPlayer();
    return BlocBuilder<RecordAudioCubit, RecordAudioState>(
      builder: (context, state) {
        return ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(175, 50),
            primary: Colors.white,
            onPrimary: Colors.black,
          ),
          onPressed: () async {
            context.read<RecordAudioCubit>().setIsPlaying(isPlaying: true);
            await player.togglePlaying(
              audioPath,
              () => context
                  .read<RecordAudioCubit>()
                  .setIsPlaying(isPlaying: player.isPlaying),
            );
          },
          icon: Icon(state.isPlaying ? Icons.stop : Icons.play_arrow),
          label: Text(state.isPlaying ? "Stop Playing" : "Play Recording"),
        );
      },
    );
  }
}

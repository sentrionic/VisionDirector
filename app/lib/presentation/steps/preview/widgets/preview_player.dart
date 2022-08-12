import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/scenarios/preview_scenario/preview_scenario_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/widgets/player_wrapper.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/hooks/sound_player_hook.dart';
import 'package:vision_director/presentation/steps/preview/widgets/previews/player_preview_wrapper.dart';
import 'package:vision_director/presentation/steps/preview/widgets/previews/preview_video_player.dart';

class PreviewPlayer extends HookWidget {
  final Step? current;
  const PreviewPlayer({
    super.key,
    this.current,
  });

  @override
  Widget build(BuildContext context) {
    final soundPlayer = useSoundPlayer();

    // Display an empty screen
    if (current == null) {
      return const PlayerWrapper(
        child: SizedBox(),
      );
    }

    final step = current!;

    // No media placeholder, allow for audio playback.
    if (step.media == null) {
      return BlocConsumer<PreviewScenarioCubit, PreviewScenarioState>(
        listenWhen: (p, c) => p.isPlaying != c.isPlaying,
        listener: (context, state) {
          state.isPlaying && soundPlayer.hasAudio
              ? soundPlayer.resume()
              : soundPlayer.pause();
        },
        buildWhen: (p, c) => p.initialized != c.initialized,
        builder: (context, state) {
          // Continue timer if its started.
          if (state.initialized) {
            context.read<PreviewScenarioCubit>().toggleTimer();
            if (step.audio != null) {
              soundPlayer.play(step.audio!.fileUrl, () {});
            }
          }
          return _NoMediaPlaceholder(
            step: step,
          );
        },
      );
    }

    final file = step.media!;

    if (file.mimeType.contains("video")) {
      return PreviewVideoPlayer(
        step: step,
        url: file.fileUrl,
        player: soundPlayer,
        key: UniqueKey(),
      );
    }

    // Preview image for duration
    return PlayerPreviewWrapper(
      step: step,
      child: BlocConsumer<PreviewScenarioCubit, PreviewScenarioState>(
        listenWhen: (p, c) => p.isPlaying != c.isPlaying,
        listener: (context, state) {
          // Toggle audio playback
          state.isPlaying && soundPlayer.hasAudio
              ? soundPlayer.resume()
              : soundPlayer.pause();
        },
        buildWhen: (p, c) => p.initialized != c.initialized,
        builder: (context, state) => CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(),
          imageUrl: file.fileUrl,
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) {
            // If preview is playing, start the timer and play the audio.
            if (state.initialized) {
              context.read<PreviewScenarioCubit>().toggleTimer();
              if (step.audio != null) {
                soundPlayer.play(step.audio!.fileUrl, () {});
                soundPlayer.pause();
              }
            }
            return Image(image: imageProvider);
          },
        ),
      ),
    );
  }
}

class _NoMediaPlaceholder extends StatelessWidget {
  final Step step;
  const _NoMediaPlaceholder({required this.step});

  @override
  Widget build(BuildContext context) {
    return PlayerPreviewWrapper(
      step: step,
      child: const SizedBox.expand(
        child: Center(
          child: Text(
            "Needs more information",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/scenarios/preview_scenario/preview_scenario_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/helpers/sound_player.dart';
import 'package:vision_director/presentation/steps/preview/widgets/previews/player_preview_wrapper.dart';

class PreviewVideoPlayer extends StatelessWidget {
  final Step step;
  final String url;
  final SoundPlayer player;
  const PreviewVideoPlayer({
    super.key,
    required this.url,
    required this.step,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    return PlayerPreviewWrapper(
      step: step,
      child: BlocBuilder<PreviewScenarioCubit, PreviewScenarioState>(
        buildWhen: (p, c) => p.initialized != c.initialized,
        builder: (context, state) {
          // Initialize video controller
          final controller = BetterPlayerController(
            BetterPlayerConfiguration(
              controlsConfiguration:
                  buildConfig(enableControls: !state.initialized),
              errorBuilder: (context, errorMessage) =>
                  Text(errorMessage ?? "Something went wrong"),
              autoPlay: state.initialized,
            ),
          );
          // Setup the video file
          controller
              .setupDataSource(
            BetterPlayerDataSource(
              BetterPlayerDataSourceType.network,
              url,
              // cacheConfiguration: const BetterPlayerCacheConfiguration(
              //   useCache: true,
              //   key: "testCacheKey",
              // ),
            ),
          )
              .then((_) {
            // If the timeline is playing, resume the timer on load and play
            // both the video and the audio
            if (state.initialized) {
              context.read<PreviewScenarioCubit>().toggleTimer();
              if (step.audio != null) {
                player.play(step.audio!.fileUrl, () {});
                player.pause();
              }
            }
          });
          return BlocListener<PreviewScenarioCubit, PreviewScenarioState>(
            listenWhen: (p, c) => p.isPlaying != c.isPlaying,
            listener: (context, state) {
              // If the timer gets toggled, toggle video and audio as well
              if (state.isPlaying) {
                controller.play();
                if (player.hasAudio) player.resume();
              } else {
                controller.pause();
                if (player.hasAudio) player.pause();
              }
            },
            child: BetterPlayer(
              controller: controller..setVolume(0),
            ),
          );
        },
      ),
    );
  }

  /// Returns an instance of [BetterPlayerControlsConfiguration] that disables most controls.
  ///
  /// * [enableControls] should be `true` if the user is allowed to start/stop and drag the progress bar.
  BetterPlayerControlsConfiguration buildConfig({
    required bool enableControls,
  }) {
    return BetterPlayerControlsConfiguration(
      showControlsOnInitialize: false,
      controlsHideTime: Duration.zero,
      enableOverflowMenu: false,
      enableSubtitles: false,
      enableQualities: false,
      enableSkips: false,
      enablePip: false,
      enablePlayPause: enableControls,
      enableProgressBarDrag: enableControls,
      showControls: enableControls,
    );
  }
}

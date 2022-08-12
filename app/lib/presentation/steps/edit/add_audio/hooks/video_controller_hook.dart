import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/utils/better_player_configuration.dart';

/// [Hook] to initialize and dispose a [BetterPlayerController].
///
/// Returns an instance of the [BetterPlayerController].
///
/// * [step] is the remote step.
/// * [input] is the local step. It has a higher priority.
BetterPlayerController useVideoController(Step step, StepInput input) {
  return use(_VideoControllerHook(step: step, input: input));
}

class _VideoControllerHook extends Hook<BetterPlayerController> {
  final Step step;
  final StepInput input;

  const _VideoControllerHook({
    required this.step,
    required this.input,
  });

  @override
  HookState<BetterPlayerController, Hook<BetterPlayerController>>
      createState() => _VideoControllerHookState();
}

class _VideoControllerHookState
    extends HookState<BetterPlayerController, _VideoControllerHook> {
  late BetterPlayerController _betterPlayerController;
  BetterPlayerDataSource? _betterPlayerDataSource;

  @override
  void initHook() {
    super.initHook();

    // If the local file is not `null` and a video, prefer it over the remote one.
    if (hook.input.media != null &&
        hook.input.media!.mimeType.contains("video")) {
      _betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.file,
        hook.input.media!.file.getOrCrash().path,
      );
    } else if (hook.step.media != null &&
        hook.step.media!.mimeType.contains("video")) {
      _betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        hook.step.media!.fileUrl,
      );
    }

    _betterPlayerController = BetterPlayerController(
      getBetterPlayerConfiguration(),
      betterPlayerDataSource: _betterPlayerDataSource,
    );
  }

  @override
  BetterPlayerController build(BuildContext context) => _betterPlayerController;

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }
}

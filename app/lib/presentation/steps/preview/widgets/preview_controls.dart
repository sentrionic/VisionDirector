import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vision_director/application/scenarios/preview_scenario/preview_scenario_cubit.dart';
import 'package:vision_director/application/steps/current_step_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';
import 'package:vision_director/presentation/common/widgets/control_button.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';

class PreviewControls extends StatelessWidget {
  final List<Step> steps;
  const PreviewControls({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<PreviewScenarioCubit, PreviewScenarioState>(
      buildWhen: (p, c) =>
          p.isPlaying != c.isPlaying || p.totalDuration != c.totalDuration,
      builder: (context, state) {
        return SizedBox(
          height: 130,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                // Timer Duration
                _TotalTimeLabel(
                  steps: steps,
                  seconds: state.totalDuration,
                ),
                const Divider(thickness: 1),
                // Playback controls
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ControlButton(
                        onClick: () =>
                            context.read<PreviewScenarioCubit>().toggleTimer(),
                        icon: state.isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ControlButton(
                        onClick: () {
                          // Stop the timer and go back to the title step.
                          context.read<PreviewScenarioCubit>().reset();
                          context
                              .read<CurrentStepPreviewCubit>()
                              .setCurrent(l10n.labelTitleStep);
                        },
                        icon: Icons.stop,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ControlButton(
                        onClick: () => context
                            .read<PreviewScenarioCubit>()
                            .toggleDisplayName(),
                        icon: Icons.display_settings_outlined,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TotalTimeLabel extends StatelessWidget {
  final List<Step> steps;
  final int seconds;
  const _TotalTimeLabel({
    required this.steps,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    // Sum up the duration of all steps.
    final duration = steps.fold<int>(
      0,
      (p, c) => p + (c.duration.inSeconds),
    );
    return Center(
      child: Text(
        "${getDurationString(seconds)} / ${getDurationString(duration + Guidelines.autoGeneratedLength)}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: duration > Guidelines.maxTotalDuration
              ? ThemeColors.brandRed
              : Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
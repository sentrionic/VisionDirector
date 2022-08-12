import 'dart:math';

import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/scenarios/preview_scenario/preview_scenario_cubit.dart';
import 'package:vision_director/application/steps/current_step_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';
import 'package:vision_director/presentation/steps/preview/widgets/preview_step_list_item.dart';

class PreviewStepList extends HookWidget {
  final List<Step> steps;
  const PreviewStepList({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final l10n = context.l10n;
    // The width of the timeline items plus their margin.
    const itemWidthPlusMargin = 110.0;

    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: BlocConsumer<PreviewScenarioCubit, PreviewScenarioState>(
          listenWhen: (p, c) => p.index != c.index,
          listener: (context, state) {
            // Keep the currently active step in the middle
            if (scrollController.hasClients) {
              final index = max(state.index, 0);
              scrollController.animateTo(
                index * itemWidthPlusMargin,
                duration: const Duration(milliseconds: 1),
                curve: Curves.ease,
              );
            }
          },
          buildWhen: (p, c) =>
              p.isPlaying != c.isPlaying || p.initialized != c.initialized,
          builder: (context, state) => ColoredBox(
            color: Colors.black26,
            child: Row(
              children: [
                // Title
                _NonStepItem(
                  label: l10n.labelTitleStep,
                  isPlaying: state.isPlaying,
                ),
                // Steps
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: steps.length,
                  itemBuilder: (context, index) {
                    final step = steps[index];
                    return PreviewStepListItem(
                      key: ValueKey(step),
                      step: step,
                      isInitialized: state.initialized,
                    );
                  },
                ),
                // Credits
                _NonStepItem(
                  label: l10n.labelCreditsStep,
                  isPlaying: state.initialized,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NonStepItem extends StatelessWidget {
  final String label;
  final bool isPlaying;
  const _NonStepItem({
    required this.label,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final current = context.watch<CurrentStepPreviewCubit>().state;
    final isActive = label == current;
    const boxSize = 100.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: isPlaying
              ? null
              : () => context.read<CurrentStepPreviewCubit>().setCurrent(label),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: boxSize,
            height: boxSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black45,
              border: isActive
                  ? Border.all(
                      color: ThemeColors.themeBlue,
                      width: 3,
                    )
                  : null,
            ),
            child: Center(
              child: Text(
                label[0],
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 36,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "${Guidelines.titleLength}s",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

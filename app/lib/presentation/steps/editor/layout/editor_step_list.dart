import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_argument.dart';
import 'package:vision_director/presentation/steps/create/create_step_screen.dart';
import 'package:vision_director/presentation/steps/editor/layout/editor_step_list_item.dart';

class EditorStepList extends HookWidget {
  final Scenario scenario;
  final List<Step> steps;
  final Step? current;
  const EditorStepList({
    super.key,
    required this.scenario,
    required this.steps,
    this.current,
  });

  @override
  Widget build(BuildContext context) {
    const itemSizePlusMargin = 108.0;
    final index = current != null ? steps.indexOf(current!) : 0;
    // Automatically go to the active item.
    final controller =
        useScrollController(initialScrollOffset: index * itemSizePlusMargin);
    return Expanded(
      child: ColoredBox(
        color: Colors.black26,
        child: ImplicitlyAnimatedReorderableList<Step>(
          removeDuration: Duration.zero,
          controller: controller,
          scrollDirection: Axis.horizontal,
          items: steps,
          shrinkWrap: true,
          areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
          onReorderFinished: (item, from, to, newItems) =>
              context.read<StepListCubit>().changeStepPosition(
                    newItems,
                    scenario.id,
                    item.id,
                    to,
                  ),
          header: Row(
            children: const [
              _NonStepItem(
                label: "Title",
                duration: Guidelines.titleLength,
              ),
            ],
          ),
          footer: Row(
            children: [
              const _NonStepItem(
                label: "Credits",
                duration: Guidelines.creditsLength,
              ),
              // Button to add steps
              _AddStepButton(
                scenario: scenario,
                stepCount: steps.length,
              ),
            ],
          ),
          itemBuilder: (context, itemAnimation, item, index) {
            return Reorderable(
              key: ValueKey(item),
              builder: (context, dragAnimation, inDrag) {
                return ScaleTransition(
                  scale:
                      Tween<double>(begin: 1, end: 0.95).animate(dragAnimation),
                  child: EditorStepListItem(
                    step: item,
                    elevation: dragAnimation.value * 4,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _NonStepItem extends StatelessWidget {
  final String label;
  final int duration;
  const _NonStepItem({
    required this.label,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black45,
          ),
          child: const Center(
            child: Text(
              "Auto Generated",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "${duration}s",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _AddStepButton extends StatelessWidget {
  final Scenario scenario;
  final int stepCount;
  const _AddStepButton({
    required this.scenario,
    required this.stepCount,
  });

  @override
  Widget build(BuildContext context) {
    const boxSize = 100.0;
    final isFull = stepCount >= Guidelines.maxSteps;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black45,
          ),
          child: InkWell(
            onTap: isFull
                ? null
                : () => Navigator.of(context).pushNamed(
                      CreateStepScreen.routeName,
                      arguments: ScenarioArgument(scenario),
                    ),
            child: isFull
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dynamic_feed,
                        size: 40,
                        color: Colors.grey[700],
                      ),
                      Text(
                        "Full",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  )
                : const Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.white,
                  ),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          "",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

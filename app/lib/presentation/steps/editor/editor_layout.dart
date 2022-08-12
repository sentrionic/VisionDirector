import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/steps/current_step_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/steps/editor/layout/editor_header.dart';
import 'package:vision_director/presentation/steps/editor/layout/editor_info.dart';
import 'package:vision_director/presentation/steps/editor/layout/editor_preview.dart';
import 'package:vision_director/presentation/steps/editor/layout/editor_step_list.dart';
import 'package:vision_director/presentation/steps/editor/layout/widgets/websocket_hook.dart';

class EditorLayout extends HookWidget {
  final Scenario scenario;
  final List<Step> steps;
  const EditorLayout({super.key, required this.scenario, required this.steps});

  @override
  Widget build(BuildContext context) {
    useSocketHook(context, scenario.id);
    return BlocBuilder<CurrentStepCubit, String>(
      buildWhen: (p, c) => p != c,
      builder: (context, state) {
        final current = context.read<StepListCubit>().getCurrentStep(state);
        return Column(
          children: [
            EditorHeader(current: current),
            const EditorPreview(),
            EditorInfo(current: current),
            EditorStepList(
              scenario: scenario,
              steps: steps,
              current: current,
            ),
          ],
        );
      },
    );
  }
}

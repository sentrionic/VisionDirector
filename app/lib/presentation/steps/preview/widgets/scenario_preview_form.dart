import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/scenarios/preview_scenario/preview_scenario_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/steps/current_step_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_argument.dart';
import 'package:vision_director/presentation/steps/export/export/export_screen.dart';
import 'package:vision_director/presentation/steps/preview/widgets/scenario_preview_layout.dart';

class ScenarioPreviewForm extends StatelessWidget {
  const ScenarioPreviewForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scenario = context.read<ScenarioListCubit>().getCurrentScenario();
    final steps = context.read<StepListCubit>().getStepList();

    // Set the amount of steps to be previewed.
    context.read<PreviewScenarioCubit>().init(steps.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(
              ExportScreen.routeName,
              arguments: ScenarioArgument(scenario!),
            ),
            child: const Text(
              'Export',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      body: BlocListener<PreviewScenarioCubit, PreviewScenarioState>(
        listenWhen: (p, c) => p.index != c.index,
        listener: (context, state) {
          // Negative index indicates title step
          if (state.index < 0) {
            context
                .read<CurrentStepPreviewCubit>()
                .setCurrent(l10n.labelTitleStep);
            // Load the step info of the current step
          } else if (state.index < steps.length) {
            final step = steps[state.index];
            context.read<CurrentStepPreviewCubit>().setCurrent(step.id);
            context.read<PreviewScenarioCubit>()
              ..setDuration(step.duration.inSeconds)
              ..toggleTimer();
            // Load the credits
          } else {
            context
                .read<CurrentStepPreviewCubit>()
                .setCurrent(l10n.labelCreditsStep);
            context
                .read<PreviewScenarioCubit>()
                .setDuration(Guidelines.creditsLength);
          }
        },
        child: PreviewLayout(scenario: scenario!, steps: steps),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/application/steps/toggle_multiple_steps/toggle_multiple_steps_cubit.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/card_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/saving_progress_overlay.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class ManageStepsForm extends HookWidget {
  final String scenarioId;
  const ManageStepsForm({
    super.key,
    required this.scenarioId,
  });

  @override
  Widget build(BuildContext context) {
    // Only run once on initial build
    useEffect(
      () {
        final steps = context.read<StepListCubit>().getStepList();
        context.read<ToggleMultipleStepsCubit>().initialize(steps);
        return null;
      },
      [],
    );

    return BlocConsumer<ToggleMultipleStepsCubit, ToggleMultipleStepsState>(
      listener: (context, state) {
        state.stepFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  orElse: () => "Server Error. Please try again later",
                ),
              ).show(context);
            },
            (_) {
              buildSuccesFlushbar(message: "Successfully updated the steps")
                  .show(context);
            },
          ),
        );
      },
      builder: (context, state) => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text("Manage Steps"),
              actions: [
                IconButton(
                  onPressed: () => context
                      .read<ToggleMultipleStepsCubit>()
                      .submitList(scenarioId),
                  icon: const Icon(Icons.save),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 25, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Step Name",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Locked?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SpacedDivider(),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final step = state.steps[index];
                      return CardWrapper(
                        child: SwitchListTile(
                          title: Text(step.name),
                          value: step.isLocked,
                          activeColor: ThemeColors.themeBlue,
                          onChanged: (value) => context
                              .read<ToggleMultipleStepsCubit>()
                              .changeValue(
                                step.id,
                                isLocked: value,
                              ),
                        ),
                      );
                    },
                    itemCount: state.steps.length,
                  ),
                ],
              ),
            ),
          ),
          SavingInProgressOverlay(isSaving: state.isSubmitting),
        ],
      ),
    );
  }
}

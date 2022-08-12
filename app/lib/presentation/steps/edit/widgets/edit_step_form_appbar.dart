import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/edit_step/edit_step_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/presentation/common/step_widgets/guidelines_screen.dart';
import 'package:vision_director/presentation/common/widgets/show_confirmation_dialog.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class EditStepFormAppbar extends StatelessWidget with PreferredSizeWidget {
  final String stepId;
  final String scenarioId;
  final bool isDirty;

  const EditStepFormAppbar({
    super.key,
    required this.stepId,
    required this.scenarioId,
    required this.isDirty,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        tooltip: "Close",
        onPressed: isDirty
            ? () => showConfirmationDialog(
                  context,
                  title: "Discard Changes",
                  body: "Are you sure you want to discard your changes?",
                  buttonPrompt: "Discard",
                  buttonColor: ThemeColors.themeBlue,
                  onSubmit: () {
                    // Unlock the step
                    context.read<EditStepCubit>().toggleLockStep(
                          scenarioId,
                          stepId,
                          isLocked: false,
                        );
                    // Close dialog and pop back
                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= 2);
                  },
                )
            : () {
                // Unlock the step
                context.read<EditStepCubit>().toggleLockStep(
                      scenarioId,
                      stepId,
                      isLocked: false,
                    );
                Navigator.of(context).pop();
              },
        icon: const Icon(Icons.close),
      ),
      title: const Text("Edit Step"),
      actions: [
        const OpenGuidelinesButton(),
        IconButton(
          tooltip: "Save",
          onPressed: () {
            FocusScope.of(context).unfocus();
            context.read<EditStepCubit>().submitEditStep(
                  scenarioId,
                  stepId,
                  context.read<StepListCubit>().getTotalDuration(),
                );
          },
          icon: const Icon(Icons.save),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

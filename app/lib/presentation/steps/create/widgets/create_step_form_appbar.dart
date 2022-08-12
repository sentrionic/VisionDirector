import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/create_step/create_step_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/common/step_widgets/guidelines_screen.dart';
import 'package:vision_director/presentation/common/widgets/show_confirmation_dialog.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class CreateStepFormAppbar extends StatelessWidget with PreferredSizeWidget {
  final Scenario scenario;
  final int currentDuration;
  const CreateStepFormAppbar({
    super.key,
    required this.scenario,
    required this.currentDuration,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Add Step"),
      leading: IconButton(
        tooltip: "Close",
        icon: const Icon(Icons.close),
        onPressed: () => showConfirmationDialog(
          context,
          title: "Discard Changes",
          body: "Are you sure you want to discard your changes?",
          buttonPrompt: "Discard",
          buttonColor: ThemeColors.themeBlue,
          onSubmit: () {
            FocusScope.of(context).unfocus();
            // Close dialog and pop back
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          },
        ),
      ),
      actions: [
        const OpenGuidelinesButton(),
        TextButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            context.read<CreateStepCubit>().createStep(
                  scenario.id,
                  currentDuration,
                );
          },
          child: const Text(
            'Done',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

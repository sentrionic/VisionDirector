import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/domain/common/template.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/common/step_widgets/guidelines_screen.dart';
import 'package:vision_director/presentation/common/widgets/show_confirmation_dialog.dart';
import 'package:vision_director/presentation/common/widgets/upload_progress_widget.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_argument.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_steps/widgets/show_template_dialog.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_steps/widgets/step_list_widget.dart';
import 'package:vision_director/presentation/steps/editor/editor_screen.dart';

class AddStepsForm extends StatelessWidget {
  final Scenario scenario;

  const AddStepsForm({
    super.key,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    final project = context.read<ProjectListCubit>().getCurrentProject();
    return BlocBuilder<CreateStepsCubit, CreateStepsState>(
      builder: (_, state) {
        return state.isDownloading
            ? UploadProgress(
                progress: state.progress,
                isUploading: false,
              )
            : Scaffold(
                appBar: _AppBar(scenario: scenario),
                floatingActionButton: state.steps.isEmpty
                    ? ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  ShowTemplatesDialog(project: project!),
                              fullscreenDialog: true,
                            ),
                          )
                              .then((value) {
                            if (value != null) {
                              final template = value as Template;
                              context
                                  .read<CreateStepsCubit>()
                                  .setFromTemplate(template.steps);
                            }
                          });
                        },
                        icon: const Icon(Icons.copy),
                        label: const Text("From Template"),
                      )
                    : null,
                body: const StepListWidget(),
              );
      },
    );
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  final Scenario scenario;

  const _AppBar({required this.scenario});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(scenario.name.getOrCrash()),
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
            // Close dialog and pop back
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          },
        ),
      ),
      actions: [
        const OpenGuidelinesButton(),
        TextButton(
          onPressed: () => showConfirmationDialog(
            context,
            title: "Skip Setup",
            body: "Are you sure you want to skip the setup process?",
            buttonPrompt: "Skip",
            buttonColor: ThemeColors.themeBlue,
            onSubmit: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed(
                EditorScreen.routeName,
                arguments: ScenarioArgument(scenario),
              );
            },
          ),
          child: const Text(
            'Skip',
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

import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/steps/edit_step/edit_step_cubit.dart';
import 'package:vision_director/domain/core/utils.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/step_widgets/file_error_message.dart';
import 'package:vision_director/presentation/common/widgets/show_confirmation_dialog.dart';
import 'package:vision_director/presentation/common/widgets/upload_progress_widget.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/steps/edit/widgets/edit_step_form_appbar.dart';
import 'package:vision_director/presentation/steps/edit/widgets/edit_step_form_info.dart';
import 'package:vision_director/presentation/steps/edit/widgets/edit_step_form_options.dart';
import 'package:vision_director/presentation/steps/edit/widgets/local_editor_player.dart';
import 'package:vision_director/presentation/steps/shared/editor_player.dart';

class EditStepFormBody extends HookWidget {
  final Step step;
  const EditStepFormBody({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    final textEditingController =
        useTextEditingController(text: step.name.getOrCrash());
    final scenarioId = context.read<ScenarioListCubit>().getCurrentScenarioId();

    return BlocBuilder<EditStepCubit, EditStepState>(
      buildWhen: (p, c) =>
          p.isSubmitting != c.isSubmitting ||
          p.progress != c.progress ||
          p.input.media != c.input.media,
      builder: (context, state) {
        // Valid if the file does not contain an error and the duration is within the guidelines
        final isValid = (state.input.media?.failureOption.isNone() ?? true) &&
            isWithinGuidelines(state.input.duration);
        return state.isSubmitting
            ? UploadProgress(progress: state.progress)
            : WillPopScope(
                onWillPop: state.isDirty
                    ? () async {
                        showConfirmationDialog(
                          context,
                          title: "Discard Changes",
                          body:
                              "Are you sure you want to discard your changes?",
                          buttonPrompt: "Discard",
                          buttonColor: ThemeColors.themeBlue,
                          onSubmit: () {
                            // Unlock the step
                            context.read<EditStepCubit>().toggleLockStep(
                                  scenarioId,
                                  step.id,
                                  isLocked: false,
                                );
                            // Close dialog and pop back
                            int count = 0;
                            Navigator.of(context).popUntil((_) => count++ >= 2);
                          },
                        );
                        return true;
                      }
                    : () async {
                        // Unlock the step
                        context.read<EditStepCubit>().toggleLockStep(
                              scenarioId,
                              step.id,
                              isLocked: false,
                            );
                        return true;
                      },
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: EditStepFormAppbar(
                    stepId: step.id,
                    scenarioId: scenarioId,
                    isDirty: state.isDirty,
                  ),
                  body: Form(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        // Step Name
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Name',
                            ),
                            controller: textEditingController,
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(fontSize: 18),
                            autocorrect: false,
                            onChanged: (value) => context
                                .read<EditStepCubit>()
                                .nameChanged(value),
                            validator: (_) => context
                                .read<EditStepCubit>()
                                .state
                                .input
                                .name
                                .value
                                .fold(
                                  (f) => f.maybeMap(
                                    exceedingLength: (_) => "Name is too long",
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Media Preview or Placeholder
                        if (state.input.media == null)
                          EditorPlayer(
                            current: step,
                          )
                        else ...[
                          DecoratedBox(
                            decoration: BoxDecoration(
                              border: !isValid
                                  ? const Border(
                                      top: BorderSide(
                                        color: ThemeColors.brandRed,
                                      ),
                                      left: BorderSide(
                                        color: ThemeColors.brandRed,
                                      ),
                                      right: BorderSide(
                                        color: ThemeColors.brandRed,
                                      ),
                                    )
                                  : null,
                            ),
                            child: LocalEditorPlayer(input: state.input.media!),
                          ),
                          if (!isValid) FileErrorMessage(step: state.input),
                        ],
                        const SizedBox(
                          height: 10,
                        ),
                        EditStepFormInfo(step: step),
                        Container(
                          height: 20,
                          color: Colors.black26,
                        ),
                        // Optionsbar
                        EditStepFormOptions(step: step),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}

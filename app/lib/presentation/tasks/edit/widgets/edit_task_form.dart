import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';

import 'package:vision_director/application/tasks/edit_task/edit_task_cubit.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/markdown_editor.dart';
import 'package:vision_director/presentation/common/widgets/saving_progress_overlay.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/tasks/create/widgets/additional_info_label.dart';
import 'package:vision_director/presentation/tasks/create/widgets/assign_deadline_tile.dart';
import 'package:vision_director/presentation/tasks/create/widgets/assign_member_tile.dart';
import 'package:vision_director/presentation/tasks/create/widgets/assign_step_tile.dart';

class EditTaskForm extends HookWidget {
  final Task task;
  const EditTaskForm({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final titleController =
        useTextEditingController(text: task.title.getOrCrash());
    final bodyController =
        useTextEditingController(text: task.body?.getValue() ?? "");
    final showPreview = useState(false);
    final scenarioId = context.read<ScenarioListCubit>().getCurrentScenarioId();

    return BlocConsumer<EditTaskCubit, EditTaskState>(
      listener: (context, state) {
        state.taskFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  orElse: () => "Server Error. Try again later.",
                ),
              ).show(context);
            },
            (task) {
              Navigator.of(context).pop(task);
              buildSuccesFlushbar(message: "Successfully edited the task")
                  .show(context);
            },
          ),
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text("Edit Task"),
                leading: IconButton(
                  tooltip: "Close",
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: [
                  IconButton(
                    tooltip: "Edit",
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.read<EditTaskCubit>().submitEditTask(
                            scenarioId,
                            task.id,
                          );
                    },
                    icon: const Icon(Icons.save),
                  ),
                ],
              ),
              bottomSheet: MarkdownEditor(controller: bodyController),
              body: Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: FormWrapper(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    if (task.isMain) ...[
                      const InfoLabel(label: "Title Locked"),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                    TextFormField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      readOnly: task.isMain,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) =>
                          context.read<EditTaskCubit>().titleChanged(value),
                      validator: (_) =>
                          context.read<EditTaskCubit>().state.title.value.fold(
                                (f) => f.maybeMap(
                                  empty: (_) => "Title must not be empty",
                                  orElse: () => null,
                                ),
                                (_) => null,
                              ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Markdown Toggle
                    SwitchListTile(
                      title: const Text("Preview"),
                      value: showPreview.value,
                      activeColor: ThemeColors.themeBlue,
                      onChanged: (value) => showPreview.value = value,
                      contentPadding: const EdgeInsets.only(left: 3),
                    ),
                    // Display Markdown
                    if (showPreview.value)
                      ColoredBox(
                        color: ThemeColors.inputBackground,
                        child: Markdown(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          selectable: true,
                          data: state.body.getValue(),
                        ),
                      )
                    // Display text input
                    else
                      TextFormField(
                        controller: bodyController,
                        decoration: const InputDecoration(
                          labelText: 'Leave a comment (optional)',
                        ),
                        minLines: 4,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        autocorrect: false,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) =>
                            context.read<EditTaskCubit>().bodyChanged(value),
                        validator: (_) =>
                            context.read<EditTaskCubit>().state.body.value.fold(
                                  (f) => f.maybeMap(
                                    exceedingSize: (_) => "Body is too long",
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    SwitchListTile(
                      title: const Text("Completed?"),
                      value: state.isCompleted,
                      onChanged: (value) => context
                          .read<EditTaskCubit>()
                          .isCompletedChanged(isCompleted: value),
                      activeColor: ThemeColors.themeBlue,
                      contentPadding: const EdgeInsets.only(left: 3),
                    ),
                    if (task.isMain) ...[
                      const Text(
                        "Setting this step as completed will also set the related step as completed.",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                    ],
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AdditionalInfoLabel(),
                    const SizedBox(
                      height: 10,
                    ),
                    AssignMemberTile(
                      onClick: (assignee) => context
                          .read<EditTaskCubit>()
                          .assigneeChanged(assignee),
                      assignee: state.assignee,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    if (!task.isMain)
                      AssignStepTile(
                        onClick: (step) =>
                            context.read<EditTaskCubit>().stepChanged(step),
                        step: state.step,
                      ),
                    const SizedBox(
                      height: 2,
                    ),
                    AssignDeadlineTile(
                      onClick: (time) =>
                          context.read<EditTaskCubit>().deadlineChanged(time),
                      time: state.deadline,
                    ),
                    const SizedBox(
                      height: kBottomNavigationBarHeight,
                    ),
                  ],
                ),
              ),
            ),
            SavingInProgressOverlay(isSaving: state.isSubmitting),
          ],
        );
      },
    );
  }
}

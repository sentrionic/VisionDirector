import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:vision_director/application/tasks/create_task/create_task_cubit.dart';
import 'package:vision_director/domain/tasks/value_objects.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/markdown_editor.dart';
import 'package:vision_director/presentation/common/widgets/saving_progress_overlay.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/tasks/create/widgets/additional_info_label.dart';
import 'package:vision_director/presentation/tasks/create/widgets/assign_deadline_tile.dart';
import 'package:vision_director/presentation/tasks/create/widgets/assign_member_tile.dart';
import 'package:vision_director/presentation/tasks/create/widgets/assign_step_tile.dart';

class CreateTaskForm extends HookWidget {
  final String scenarioId;
  const CreateTaskForm({
    super.key,
    required this.scenarioId,
  });

  @override
  Widget build(BuildContext context) {
    final showPreview = useState(false);
    final controller = useTextEditingController();

    return BlocConsumer<CreateTaskCubit, CreateTaskState>(
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
            (_) {
              Navigator.of(context).pop();
              buildSuccesFlushbar(message: "Successfully created the task")
                  .show(context);
            },
          ),
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                title: const Text("Create Task"),
                leading: IconButton(
                  tooltip: "Close",
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: [
                  IconButton(
                    tooltip: "Create",
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.read<CreateTaskCubit>().submitTask(scenarioId);
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
              bottomSheet: MarkdownEditor(controller: controller),
              body: SizedBox.expand(
                child: Form(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: FormWrapper(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const InfoLabel(label: "Required"),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Title',
                        ),
                        autocorrect: false,
                        textInputAction: TextInputAction.next,
                        onChanged: (value) =>
                            context.read<CreateTaskCubit>().titleChanged(value),
                        validator: (_) => context
                            .read<CreateTaskCubit>()
                            .state
                            .title
                            .value
                            .fold(
                              (f) => f.maybeMap(
                                empty: (_) => "Title must not be empty",
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                      ),
                      const SpacedDivider(),
                      const AdditionalInfoLabel(),
                      SwitchListTile(
                        title: const Text("Preview"),
                        contentPadding: const EdgeInsets.only(left: 2),
                        value: showPreview.value,
                        activeColor: ThemeColors.themeBlue,
                        onChanged: (value) => showPreview.value = value,
                      ),
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
                      else
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Leave a comment (optional)',
                          ),
                          controller: controller,
                          minLines: 4,
                          maxLines: null,
                          maxLength: TaskBody.maxLength,
                          keyboardType: TextInputType.multiline,
                          autocorrect: false,
                          textInputAction: TextInputAction.done,
                          onChanged: (value) => context
                              .read<CreateTaskCubit>()
                              .bodyChanged(value),
                          validator: (_) => context
                              .read<CreateTaskCubit>()
                              .state
                              .body
                              .value
                              .fold(
                                (f) => f.maybeMap(
                                  exceedingSize: (_) => "Body is too long",
                                  orElse: () => null,
                                ),
                                (_) => null,
                              ),
                        ),
                      const SpacedDivider(),
                      const InfoLabel(label: "Assignments"),
                      const SizedBox(
                        height: 10,
                      ),
                      AssignMemberTile(
                        onClick: (assignee) => context
                            .read<CreateTaskCubit>()
                            .assigneeChanged(assignee),
                        assignee: state.assignee,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      AssignStepTile(
                        onClick: (step) =>
                            context.read<CreateTaskCubit>().stepChanged(step),
                        step: state.step,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      AssignDeadlineTile(
                        onClick: (deadline) => context
                            .read<CreateTaskCubit>()
                            .deadlineChanged(deadline),
                        time: state.deadline,
                      ),
                      const SizedBox(
                        height: kBottomNavigationBarHeight + 20,
                      ),
                    ],
                  ),
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

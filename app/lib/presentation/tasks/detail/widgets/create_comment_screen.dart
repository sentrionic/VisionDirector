import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:vision_director/application/tasks/create_comment/create_comment_cubit.dart';
import 'package:vision_director/domain/common/value_objects.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/markdown_editor.dart';
import 'package:vision_director/presentation/common/widgets/saving_progress_overlay.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class CreateCommentScreen extends StatelessWidget {
  static const routeName = "/create-comment";

  final Scenario scenario;
  final Task task;
  const CreateCommentScreen({
    super.key,
    required this.scenario,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateCommentCubit>(),
      child: _CreateCommentForm(scenarioId: scenario.id, taskId: task.id),
    );
  }
}

class _CreateCommentForm extends HookWidget {
  final String scenarioId;
  final String taskId;
  const _CreateCommentForm({
    required this.scenarioId,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return BlocConsumer<CreateCommentCubit, CreateCommentState>(
      listener: (context, state) {
        state.commentFailureOrSuccessOption.fold(
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
              buildSuccesFlushbar(message: "Successfully posted the comment")
                  .show(context);
            },
          ),
        );
      },
      builder: (context, state) => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text("Comment"),
              actions: [
                IconButton(
                  tooltip: "Submit",
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context.read<CreateCommentCubit>().submitCreateComment(
                          scenarioId,
                          taskId,
                        );
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
            bottomSheet: MarkdownEditor(controller: controller),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListTile(
                      title: const Text("Preview"),
                      contentPadding: const EdgeInsets.only(left: 2),
                      trailing: Switch(
                        value: state.showPreview,
                        activeColor: ThemeColors.themeBlue,
                        onChanged: (value) => context
                            .read<CreateCommentCubit>()
                            .toggleShowPreview(showPreview: value),
                      ),
                    ),
                  ),
                  if (state.showPreview) ...[
                    ColoredBox(
                      color: ThemeColors.inputBackground,
                      child: Markdown(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        selectable: true,
                        data: state.body.getValue(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ] else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Leave a comment',
                        ),
                        controller: controller,
                        minLines: 4,
                        maxLines: null,
                        maxLength: CommentBody.maxLength,
                        keyboardType: TextInputType.multiline,
                        autocorrect: false,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) => context
                            .read<CreateCommentCubit>()
                            .bodyChanged(value),
                        validator: (_) => context
                            .read<CreateCommentCubit>()
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
                    ),
                  const SizedBox(
                    height: 40,
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

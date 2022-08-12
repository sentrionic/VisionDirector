import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/tasks/comment_list/comment_list_cubit.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/utils/date_utils.dart';
import 'package:vision_director/presentation/common/widgets/initials_avatar.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_task_argument.dart';
import 'package:vision_director/presentation/core/screen_arguments/task_argument.dart';
import 'package:vision_director/presentation/tasks/detail/widgets/chat_hook.dart';
import 'package:vision_director/presentation/tasks/detail/widgets/comment_list_widget.dart';
import 'package:vision_director/presentation/tasks/detail/widgets/create_comment_screen.dart';
import 'package:vision_director/presentation/tasks/edit/edit_task_screen.dart';

class TaskDetailScreen extends HookWidget {
  static const routeName = '/task-detail';

  final Task task;
  final Scenario? scenario;
  const TaskDetailScreen({super.key, required this.task, this.scenario});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ScenarioListCubit>()),
        BlocProvider(
          create: (_) => getIt<CommentListCubit>()
            ..getComments(scenario?.id ?? "", task.id),
        ),
      ],
      child: _TaskDetailBody(
        task: task,
        scenario: scenario,
      ),
    );
  }
}

class _TaskDetailBody extends HookWidget {
  final Task task;
  // If null, the user came from the home screen
  final Scenario? scenario;
  const _TaskDetailBody({required this.task, this.scenario});

  @override
  Widget build(BuildContext context) {
    // Used for updating the task if values change
    final hook = useState(task);
    useChatHook(context, scenario?.id ?? "", task.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(hook.value.title.getOrCrash()),
        leading: IconButton(
          tooltip: "Back",
          // Update the value in the list
          onPressed: () => Navigator.of(context).pop(hook.value),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          if (scenario != null)
            IconButton(
              tooltip: "Edit",
              onPressed: () => Navigator.of(context)
                  .pushNamed(
                EditTaskScreen.routeName,
                arguments: TaskArgument(hook.value),
              )
                  .then((value) {
                if (value != null) {
                  hook.value = value as Task;
                }
              }),
              icon: const Icon(Icons.edit),
            ),
        ],
      ),
      floatingActionButton: scenario != null
          ? ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pushNamed(
                CreateCommentScreen.routeName,
                arguments: ScenarioTaskArgument(
                  scenario,
                  task,
                ),
              ),
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
              ),
              label: Text(
                "Comment".toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _StatusChip(
                    isCompleted: hook.value.isCompleted,
                    assignee: hook.value.assignee,
                  ),
                  if (task.isMain)
                    const Icon(Icons.star_border)
                  else
                    Text(getTimeAgo(hook.value.createdAt)),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (hook.value.body != null &&
                hook.value.body!.getOrCrash().isNotEmpty)
              ColoredBox(
                color: ThemeColors.inputBackground,
                child: Markdown(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  selectable: true,
                  data: hook.value.body!.getOrCrash(),
                ),
              )
            else
              const Text(
                "Nothing here",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            const SpacedDivider(),
            ListTile(
              title: hook.value.assignee != null
                  ? Text("Assigned to ${hook.value.assignee!.username}")
                  : const Text("Not assigned to anyone yet"),
              leading: const Icon(Icons.person),
              trailing: hook.value.assignee != null
                  ? InitialsAvatar(name: hook.value.assignee!.username)
                  : null,
            ),
            ListTile(
              leading: const Icon(Icons.list_alt_outlined),
              title: hook.value.step != null
                  ? Text("Assigned to ${hook.value.step!.name.getOrCrash()}")
                  : const Text("Not assigned to a step yet"),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: hook.value.deadline != null
                  ? Text(
                      "To be completed until ${getFormattedDate(hook.value.deadline!)}",
                    )
                  : const Text("No deadline set yet"),
            ),
            const SpacedDivider(),
            if (scenario != null) ...[
              const Text(
                "Comments",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CommentListWidget(),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final Collaborator? assignee;
  final bool isCompleted;
  const _StatusChip({required this.isCompleted, this.assignee});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Chip(
        avatar: Icon(_getIcon()),
        label: Text(_getStatus()),
      ),
    );
  }

  IconData _getIcon() {
    if (!isCompleted && assignee == null) {
      return Icons.history_toggle_off_outlined;
    } else if (!isCompleted) {
      return Icons.hourglass_bottom_outlined;
    } else {
      return Icons.done;
    }
  }

  String _getStatus() {
    if (!isCompleted && assignee == null) {
      return "Todo";
    } else if (!isCompleted) {
      return "In Progress";
    } else {
      return "Done";
    }
  }
}

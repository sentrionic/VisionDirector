import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:vision_director/application/tasks/main_task/main_task_cubit.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/common/widgets/initials_avatar.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/screen_arguments/task_argument.dart';
import 'package:vision_director/presentation/tasks/edit/edit_task_screen.dart';

class MainTaskScreen extends StatelessWidget {
  static const routeName = "/main-task";

  final Scenario scenario;
  final Step step;
  const MainTaskScreen({
    super.key,
    required this.scenario,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MainTaskCubit>()
        ..getMainTask(scenarioId: scenario.id, stepId: step.id),
      child: const _MainTaskBody(),
    );
  }
}

class _MainTaskBody extends StatelessWidget {
  const _MainTaskBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainTaskCubit, MainTaskState>(
      builder: (context, state) => state.map(
        initial: (_) => _LoadingScaffold(child: Container()),
        loadInProgress: (_) => const _LoadingScaffold(
          child: CenterLoadingIndicator(),
        ),
        loadSuccess: (state) => _LoadSuccessBody(task: state.task),
        loadFailure: (state) => const _LoadingScaffold(
          child: ErrorIndicator(),
        ),
      ),
    );
  }
}

class _LoadSuccessBody extends HookWidget {
  final Task task;
  const _LoadSuccessBody({required this.task});

  @override
  Widget build(BuildContext context) {
    final hook = useState(task);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Additional Info"),
        actions: [
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _StatusChip(
                    isCompleted: hook.value.isCompleted,
                    assignee: hook.value.assignee,
                  ),
                  if (hook.value.isMain) const Icon(Icons.star_border),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (hook.value.body?.getValue().isNotEmpty ?? false)
              ColoredBox(
                color: ThemeColors.inputBackground,
                child: Markdown(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  selectable: true,
                  data: hook.value.body!.getValue(),
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

class _LoadingScaffold extends StatelessWidget {
  final Widget child;
  const _LoadingScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Additional Info"),
      ),
      body: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/tasks/task_list/task_list_cubit.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/presentation/common/widgets/card_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/common/widgets/initials_avatar.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';

class KanbanListBody extends StatelessWidget {
  const KanbanListBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskListCubit>();
    return BlocBuilder<TaskListCubit, TaskListState>(
      builder: (context, state) => state.map(
        initial: (_) => Container(),
        loadInProgress: (_) => const CenterLoadingIndicator(),
        loadSuccess: (state) => Center(
          child: Row(
            children: [
              _BoardColumn(
                label: "Todo",
                tasks: cubit.getTodoTasks(),
              ),
              const SizedBox(
                width: 5,
              ),
              _BoardColumn(
                label: "In Progress",
                tasks: cubit.getInProgressTasks(),
              ),
              const SizedBox(
                width: 5,
              ),
              _BoardColumn(
                label: "Completed",
                tasks: cubit.getCompletedTasks(),
              ),
            ],
          ),
        ),
        loadFailure: (state) => const ErrorIndicator(),
      ),
    );
  }
}

/// Represents a column of a kanban board.
///
/// * [label] is the label of the board column.
/// * [tasks] are the tasks that belong to the column.
class _BoardColumn extends StatelessWidget {
  final String label;
  final List<Task> tasks;
  const _BoardColumn({
    required this.label,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ColoredBox(
        color: Colors.black45,
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              _BoardTitle(title: label),
              const SpacedDivider(),
              ...tasks.map((e) => _BoardTile(task: e)).toList()
            ],
          ),
        ),
      ),
    );
  }
}

/// Represents a Todo Item in the board column.
class _BoardTile extends StatelessWidget {
  final Task task;
  const _BoardTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: ListTile(
        title: Text(task.title.getOrCrash()),
        trailing: task.assignee != null
            ? InitialsAvatar(name: task.assignee!.username)
            : null,
      ),
    );
  }
}

/// Represents the title of the board.
class _BoardTitle extends StatelessWidget {
  final String title;
  const _BoardTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

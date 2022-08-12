import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/tasks/task_list/task_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_argument.dart';
import 'package:vision_director/presentation/tasks/kanban/kanban_screen.dart';
import 'package:vision_director/presentation/tasks/overview/widgets/create_task_fab.dart';
import 'package:vision_director/presentation/tasks/overview/widgets/filter_tasks_menu.dart';
import 'package:vision_director/presentation/tasks/overview/widgets/task_list_item.dart';
import 'package:vision_director/presentation/tasks/overview/widgets/task_websocket_hook.dart';

class TaskListBody extends HookWidget {
  final Scenario scenario;
  const TaskListBody({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    useTaskSocketHook(context, scenario.id);
    return RefreshIndicator(
      onRefresh: () =>
          context.read<TaskListCubit>().getTasks(scenarioId: scenario.id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tasks"),
          actions: [
            const FilterTasksMenu(),
            IconButton(
              tooltip: "Go to kanban",
              onPressed: () => Navigator.of(context).pushNamed(
                KanbanScreen.routeName,
                arguments: ScenarioArgument(scenario),
              ),
              icon: const Icon(Icons.dashboard),
            ),
          ],
        ),
        floatingActionButton: CreateTaskFab(
          scenario: scenario,
        ),
        body: BlocBuilder<TaskListCubit, TaskListState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => const CenterLoadingIndicator(),
              loadSuccess: (state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: state.filteredTasks.isEmpty
                      ? const _EmptyTaskList()
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            final task = state.filteredTasks[index];
                            return TaskListItem(
                              task: task,
                              scenario: scenario,
                            );
                          },
                          itemCount: state.filteredTasks.length,
                        ),
                );
              },
              loadFailure: (state) => const ErrorIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class _EmptyTaskList extends StatelessWidget {
  const _EmptyTaskList();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Nothing here yet",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/tasks/task_list/task_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/tasks/overview/widgets/task_list_item.dart';

class StepDetailBody extends StatelessWidget {
  final StepTask stepTask;
  final Scenario scenario;
  const StepDetailBody({
    super.key,
    required this.scenario,
    required this.stepTask,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListCubit, TaskListState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const CenterLoadingIndicator(),
          loadSuccess: (state) => RefreshIndicator(
            onRefresh: () => context.read<TaskListCubit>().getTasks(
                  scenarioId: scenario.id,
                  stepId: stepTask.id,
                ),
            child: state.tasks.isEmpty
                ? const _EmptyStepTaskList()
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];
                      return TaskListItem(task: task);
                    },
                    itemCount: state.tasks.length,
                  ),
          ),
          loadFailure: (_) => const ErrorIndicator(),
        );
      },
    );
  }
}

class _EmptyStepTaskList extends StatelessWidget {
  const _EmptyStepTaskList();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No tasks assigned yet.\nCreate one in the task screen.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

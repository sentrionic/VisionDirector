import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/step_task_list/step_task_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/steps/overview/widgets/step_list_item.dart';

class StepListBody extends StatelessWidget {
  final Scenario scenario;
  const StepListBody({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepTaskListCubit, StepTaskListState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const CenterLoadingIndicator(),
          loadSuccess: (state) => RefreshIndicator(
            onRefresh: () =>
                context.read<StepTaskListCubit>().getStepTasks(scenario.id),
            child: state.stepTasks.isEmpty
                ? const _EmptyStepList()
                : ListView.builder(
                    itemBuilder: (context, index) {
                      final step = state.stepTasks[index];
                      return StepTaskListItem(
                        stepTask: step,
                        scenario: scenario,
                      );
                    },
                    itemCount: state.stepTasks.length,
                  ),
          ),
          loadFailure: (_) => const ErrorIndicator(),
        );
      },
    );
  }
}

class _EmptyStepList extends StatelessWidget {
  const _EmptyStepList();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No steps created yet.\nCreate one in the editor screen.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

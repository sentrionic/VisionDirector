import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/tasks/task_list/task_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/step.dart';

import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/steps/overview/widgets/step_detail_body.dart';

class StepTaskDetailScreen extends StatelessWidget {
  static const routeName = '/steptasks-detail';
  final Scenario scenario;
  final StepTask stepTask;

  const StepTaskDetailScreen({
    super.key,
    required this.scenario,
    required this.stepTask,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Fetch tasks that are related to this step
      create: (_) => getIt<TaskListCubit>()
        ..getTasks(
          scenarioId: scenario.id,
          stepId: stepTask.id,
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(scenario.name.getOrCrash()),
        ),
        body: StepDetailBody(
          scenario: scenario,
          stepTask: stepTask,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/step_task_list/step_task_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';

import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/steps/overview/widgets/step_list_body.dart';

class StepTasksScreen extends StatelessWidget {
  static const routeName = '/steps';
  final Scenario scenario;

  const StepTasksScreen({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StepTaskListCubit>()..getStepTasks(scenario.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(scenario.name.getOrCrash()),
        ),
        body: StepListBody(
          scenario: scenario,
        ),
      ),
    );
  }
}

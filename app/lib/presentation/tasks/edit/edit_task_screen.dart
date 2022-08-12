import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/application/tasks/edit_task/edit_task_cubit.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/tasks/edit/widgets/edit_task_form.dart';

class EditTaskScreen extends StatelessWidget {
  static const routeName = '/edit-task';

  final Task task;
  const EditTaskScreen({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for editing the given task
        BlocProvider(create: (_) => getIt<EditTaskCubit>()..initialize(task)),
        // Used for getting the project's members
        BlocProvider(create: (_) => getIt<ProjectListCubit>()),
        // Used for getting the scenario's steps.
        BlocProvider(create: (_) => getIt<StepListCubit>()),
        // Used for getting the current scenario.
        BlocProvider(create: (_) => getIt<ScenarioListCubit>()),
      ],
      child: EditTaskForm(
        task: task,
      ),
    );
  }
}

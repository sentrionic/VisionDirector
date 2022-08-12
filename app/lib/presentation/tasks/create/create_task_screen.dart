import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/application/tasks/create_task/create_task_cubit.dart';
import 'package:vision_director/application/tasks/task_list/task_list_cubit.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/tasks/create/widgets/create_task_form.dart';

class CreateTaskScreen extends StatelessWidget {
  static const routeName = '/create-task';

  final String scenarioId;
  const CreateTaskScreen({
    super.key,
    required this.scenarioId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for creating the new task.
        BlocProvider(create: (_) => getIt<CreateTaskCubit>()),
        // Used for getting the project's members.
        BlocProvider(create: (_) => getIt<ProjectListCubit>()),
        // Used for getting the scenario's steps.
        BlocProvider(create: (_) => getIt<StepListCubit>()),
        // Used for adding the new step to the state.
        BlocProvider(create: (_) => getIt<TaskListCubit>()),
      ],
      child: CreateTaskForm(
        scenarioId: scenarioId,
      ),
    );
  }
}

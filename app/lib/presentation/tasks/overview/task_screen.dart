import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/tasks/task_list/task_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/tasks/overview/widgets/task_list_body_widget.dart';

class TaskScreen extends StatelessWidget {
  static const routeName = '/tasks';

  final Scenario scenario;
  const TaskScreen({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for getting the project's members
        BlocProvider(create: (_) => getIt<ProjectListCubit>()),
        // Used for fetching the tasks and adding new ones
        BlocProvider(
          create: (_) =>
              getIt<TaskListCubit>()..getTasks(scenarioId: scenario.id),
        ),
      ],
      child: TaskListBody(
        scenario: scenario,
      ),
    );
  }
}

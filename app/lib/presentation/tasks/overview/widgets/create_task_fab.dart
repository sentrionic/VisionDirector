import 'package:flutter/material.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_argument.dart';
import 'package:vision_director/presentation/tasks/create/create_task_screen.dart';

class CreateTaskFab extends StatelessWidget {
  final Scenario scenario;
  const CreateTaskFab({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.post_add,
        color: Colors.white,
      ),
      onPressed: () => Navigator.of(context).pushNamed(
        CreateTaskScreen.routeName,
        arguments: ScenarioArgument(scenario),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';

import 'package:vision_director/domain/projects/project.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/core/screen_arguments/project_argument.dart';
import 'package:vision_director/presentation/scenarios/create/create_scenario_screen.dart';

class CreateScenarioFab extends StatelessWidget {
  final Project project;
  const CreateScenarioFab({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        Navigator.of(context)
            .pushNamed(
          CreateScenarioScreen.routeName,
          arguments: ProjectArgument(project),
        )
            .then((value) {
          if (value != null) {
            context.read<ScenarioListCubit>().addNewScenario(value as Scenario);
          }
        });
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

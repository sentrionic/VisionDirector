import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';

import 'package:vision_director/domain/projects/project.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/scenarios/overview/widgets/create_scenario_fab.dart';
import 'package:vision_director/presentation/scenarios/overview/widgets/scenario_list_body_widget.dart';

class ScenarioScreen extends StatelessWidget {
  static const routeName = '/scenarios';

  final Project project;
  const ScenarioScreen({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ScenarioListCubit>()..getScenarios(project.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(project.name),
        ),
        body: ScenarioListBody(projectId: project.id),
        floatingActionButton: CreateScenarioFab(
          project: project,
        ),
      ),
    );
  }
}

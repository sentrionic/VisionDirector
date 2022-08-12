import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/scenarios/create_scenario/create_scenario_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/scenarios/create/widgets/create_scenario_form.dart';

class CreateScenarioScreen extends StatelessWidget {
  static const routeName = '/create-scenario';

  final String projectId;

  const CreateScenarioScreen({
    super.key,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for creating the new scenario
        BlocProvider(create: (_) => getIt<CreateScenarioCubit>()),
        // Used for adding the new scenario to the list
        BlocProvider(create: (_) => getIt<ScenarioListCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Scenario"),
          leading: IconButton(
            tooltip: "Close",
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: CreateScenarioForm(
          projectId: projectId,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/steps/create_step/create_step_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/steps/create/widgets/create_step_form.dart';

class CreateStepScreen extends StatelessWidget {
  static const routeName = '/add-step';

  final Scenario scenario;

  const CreateStepScreen({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for creating the step.
        BlocProvider(create: (_) => getIt<CreateStepCubit>()),
        // Used for getting the project's members.
        BlocProvider(create: (_) => getIt<ProjectListCubit>()),
        // Used for adding the new step to the state.
        BlocProvider(create: (_) => getIt<StepListCubit>()),
      ],
      child: CreateStepForm(
        scenario: scenario,
      ),
    );
  }
}

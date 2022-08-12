import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/steps/delete_step/delete_step_cubit.dart';
import 'package:vision_director/application/steps/edit_step/edit_step_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/steps/edit/edit_step_form.dart';

class EditStepScreen extends StatelessWidget {
  static const routeName = '/edit-step';

  final Step step;
  const EditStepScreen({
    super.key,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for editing the step.
        BlocProvider(create: (_) => getIt<EditStepCubit>()..initialize(step)),
        // Used for deleting the step.
        BlocProvider(create: (_) => getIt<DeleteStepCubit>()),
        // Used for getting the current scenario.
        BlocProvider(create: (_) => getIt<ScenarioListCubit>()),
        // Used for updating the state or removing the step from the state.
        BlocProvider(create: (_) => getIt<StepListCubit>()),
        // Used for getting the project's members.
        BlocProvider(create: (_) => getIt<ProjectListCubit>()),
      ],
      child: EditStepForm(
        step: step,
      ),
    );
  }
}

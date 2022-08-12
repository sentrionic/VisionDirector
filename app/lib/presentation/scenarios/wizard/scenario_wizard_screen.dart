import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_argument.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_data/add_step_data_form.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_steps/add_steps_form.dart';
import 'package:vision_director/presentation/steps/editor/editor_screen.dart';

class ScenarioWizardScreen extends StatelessWidget {
  static const routeName = '/initial-wizard';

  final Scenario scenario;

  const ScenarioWizardScreen({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for creating the steps
        BlocProvider(create: (_) => getIt<CreateStepsCubit>()),
        // Used for getting project members
        BlocProvider(create: (_) => getIt<ProjectListCubit>()),
      ],
      child: _ScenarioWizardFlow(
        scenario: scenario,
      ),
    );
  }
}

class _ScenarioWizardFlow extends StatelessWidget {
  final Scenario scenario;

  const _ScenarioWizardFlow({required this.scenario});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateStepsCubit, CreateStepsState>(
      listener: (context, state) => state.stepFailureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) {
            buildErrorFlushbar(
              message: failure.maybeMap(
                tooLong: (_) => "You are over the time limit. Keep it shorter.",
                orElse: () => "Server Error. Try again later.",
              ),
            ).show(context);
          },
          (_) {
            Navigator.of(context).pushReplacementNamed(
              EditorScreen.routeName,
              arguments: ScenarioArgument(scenario),
            );
          },
        ),
      ),
      buildWhen: (previous, current) => previous.page != current.page,
      builder: (context, state) => state.page == 0
          // Display the form to add steps
          ? AddStepsForm(scenario: scenario)
          // Display the form to add additional info to the steps
          : AddStepDataForm(scenario: scenario),
    );
  }
}

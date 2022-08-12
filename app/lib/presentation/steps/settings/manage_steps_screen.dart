import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/application/steps/toggle_multiple_steps/toggle_multiple_steps_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/steps/settings/widgets/manage_steps_form.dart';

class ManageStepsScreen extends StatelessWidget {
  static const routeName = "/manage-steps";

  final Scenario scenario;
  const ManageStepsScreen({
    super.key,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for getting the steps to manage
        BlocProvider(create: (_) => getIt<StepListCubit>()),
        // Used for managing the steps.
        BlocProvider(create: (_) => getIt<ToggleMultipleStepsCubit>()),
      ],
      child: ManageStepsForm(
        scenarioId: scenario.id,
      ),
    );
  }
}

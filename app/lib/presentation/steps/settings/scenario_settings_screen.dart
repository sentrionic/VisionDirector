import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/scenarios/edit_scenario/edit_scenario_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/steps/settings/widgets/scenario_settings_form.dart';

class ScenarioSettingsScreen extends StatelessWidget {
  static const routeName = '/scenario-settings';

  final Scenario scenario;
  const ScenarioSettingsScreen({
    super.key,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditScenarioCubit>()..initialize(scenario),
      child: ScenarioSettingsForm(scenario: scenario),
    );
  }
}

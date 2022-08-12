import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vision_director/application/scenarios/create_scenario/create_scenario_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/linear_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/long_button.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_argument.dart';
import 'package:vision_director/presentation/scenarios/wizard/scenario_wizard_screen.dart';

class CreateScenarioForm extends StatelessWidget {
  final String projectId;
  const CreateScenarioForm({
    super.key,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateScenarioCubit, CreateScenarioState>(
      listener: (context, state) {
        state.scenarioFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  orElse: () => "Server Error. Try again later.",
                ),
              ).show(context);
            },
            (scenario) {
              // Set the new currently open scenario here and add the new scenario
              // as the result of the screen replacement
              context.read<ScenarioListCubit>().setCurrentScenario(scenario.id);
              Navigator.of(context).pushReplacementNamed(
                ScenarioWizardScreen.routeName,
                result: scenario,
                arguments: ScenarioArgument(scenario),
              );
            },
          ),
        );
      },
      builder: (context, state) {
        return SizedBox.expand(
          child: Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: FormWrapper(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Start Visualising",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const InfoLabel(label: "Scenario Name"),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  autocorrect: false,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) =>
                      context.read<CreateScenarioCubit>().nameChanged(value),
                  validator: (_) =>
                      context.read<CreateScenarioCubit>().state.name.value.fold(
                            (f) => f.maybeMap(
                              empty: (_) => "Name must not be empty",
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "A scenario name should be a short and descriptive text of the goal to be fullfilled.",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "EXAMPLES",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  "Create Scenario",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  "Invite Members to Project",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                LongButton(
                  onClick: () => context
                      .read<CreateScenarioCubit>()
                      .createScenario(projectId),
                  label: "Create",
                ),
                if (state.isSubmitting) const LinearLoadingIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/steps/delete_step/delete_step_cubit.dart';
import 'package:vision_director/application/steps/edit_step/edit_step_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/utils/setup_hive.dart';
import 'package:vision_director/presentation/steps/edit/edit_onboarding_screen.dart';
import 'package:vision_director/presentation/steps/edit/widgets/edit_step_form_body.dart';

class EditStepForm extends HookWidget {
  final Step step;
  const EditStepForm({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    // Only lock the lock on first build
    useEffect(
      () {
        final scenarioId =
            context.read<ScenarioListCubit>().getCurrentScenarioId();
        context
            .read<EditStepCubit>()
            .toggleLockStep(scenarioId, step.id, isLocked: true);
        return null;
      },
      [],
    );

    // Used to update the step with the response
    final current = useState(step);
    final box = Hive.box(HiveBoxes.onboardingBox);
    final boxValue = box.get(HiveBoxes.onboardingEditor) as bool?;
    final showOnboarding = useState(boxValue ?? true);

    return showOnboarding.value
        ? EditOnboardingScreen(toggleShow: () => showOnboarding.value = false)
        : MultiBlocListener(
            listeners: [
              BlocListener<EditStepCubit, EditStepState>(
                listenWhen: (p, c) =>
                    p.stepFailureOrSuccessOption !=
                    c.stepFailureOrSuccessOption,
                listener: (context, state) {
                  state.stepFailureOrSuccessOption.fold(
                    () {},
                    (either) => either.fold(
                      (failure) {
                        failure.map(
                          mediaChanged: (_) => _showInfoDialog(context),
                          tooLong: (_) => buildErrorFlushbar(
                            message:
                                "You are over the time limit. Keep it shorter.",
                          ).show(context),
                          unexpected: (_) => buildErrorFlushbar(
                            message: "Server Error. Try again later.",
                          ).show(context),
                        );
                      },
                      (step) {
                        // Update the input with the new data
                        context.read<EditStepCubit>().reset(step);
                        current.value = step;
                        buildSuccesFlushbar(
                          message: "Successfully updated the step",
                        ).show(context);
                      },
                    ),
                  );
                },
              ),
              BlocListener<DeleteStepCubit, DeleteStepState>(
                listener: (context, state) {
                  state.maybeMap(
                    deleteFailure: (state) {
                      buildErrorFlushbar(
                        message: state.failure.maybeMap(
                          orElse: () => "Server Error. Try again later",
                        ),
                      ).show(context);
                    },
                    deleteSuccess: (_) {
                      int count = 0;
                      Navigator.of(context).popUntil((_) => count++ >= 2);
                      buildSuccesFlushbar(
                        message: "Successfully removed the step",
                      ).show(context);
                    },
                    orElse: () {},
                  );
                },
              ),
            ],
            child: EditStepFormBody(
              step: current.value,
            ),
          );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Important"),
        content: const Text(
          "This scene contains recorded audio. You might need to need to re-record it. If the video is shorter than the audio it will be cut short.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "Ok",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

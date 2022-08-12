import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/create_step/create_step_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/core/utils.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/upload_progress_widget.dart';
import 'package:vision_director/presentation/steps/create/widgets/create_step_form_appbar.dart';
import 'package:vision_director/presentation/steps/create/widgets/create_step_form_body.dart';

class CreateStepForm extends StatelessWidget {
  final Scenario scenario;
  const CreateStepForm({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateStepCubit, CreateStepState>(
      listener: (context, state) {
        state.stepFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  tooLong: (value) => "You are over the time limit.",
                  orElse: () => "Server Error. Try again later.",
                ),
              ).show(context);
            },
            (_) {
              Navigator.of(context).pop();
              buildSuccesFlushbar(message: "Successfully created the step")
                  .show(context);
            },
          ),
        );
      },
      builder: (context, state) {
        // No errors and within time limit.
        final currentDuration =
            context.read<StepListCubit>().getTotalDuration() +
                Guidelines.autoGeneratedLength;
        return _showUploadProgress(state)
            ? UploadProgress(progress: state.progress)
            : Scaffold(
                appBar: CreateStepFormAppbar(
                  scenario: scenario,
                  currentDuration: currentDuration,
                ),
                body: CreateStepFormBody(
                  currentDuration: currentDuration,
                  isValid: isValid(state.step, currentDuration),
                ),
              );
      },
    );
  }

  /// Returns `true` if there's an upload in progress and if no error exists after the upload
  bool _showUploadProgress(CreateStepState state) =>
      state.isSubmitting ||
      state.stepFailureOrSuccessOption.isSome() &&
          state.stepFailureOrSuccessOption
              .getOrElse(() => right(unit))
              .isRight();

  /// Returns `true` if there is no error and the duration is set correctly.
  bool isValid(StepInput step, int currentDuration) =>
      (step.media?.failureOption.isNone() ?? true) &&
      step.duration.inSeconds + currentDuration <=
          Guidelines.maxTotalDuration &&
      isWithinGuidelines(step.duration);
}

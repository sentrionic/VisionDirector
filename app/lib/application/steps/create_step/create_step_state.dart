part of 'create_step_cubit.dart';

/// * [step] is the input dto of the step.
/// * [progress] is the upload progress.
@freezed
class CreateStepState with _$CreateStepState {
  const factory CreateStepState({
    required StepInput step,
    required double progress,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption,
  }) = _CreateStepState;

  factory CreateStepState.initial() => CreateStepState(
        step: StepInput.empty(),
        progress: 0.0,
        showErrorMessages: false,
        isSubmitting: false,
        stepFailureOrSuccessOption: none(),
      );
}

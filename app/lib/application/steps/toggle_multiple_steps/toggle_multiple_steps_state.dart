part of 'toggle_multiple_steps_cubit.dart';

@freezed
class ToggleMultipleStepsState with _$ToggleMultipleStepsState {
  const factory ToggleMultipleStepsState({
    required List<ToggleStep> steps,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption,
  }) = _ToggleMultipleStepsState;

  factory ToggleMultipleStepsState.initial() => ToggleMultipleStepsState(
        steps: [],
        showErrorMessages: false,
        isSubmitting: false,
        stepFailureOrSuccessOption: none(),
      );
}

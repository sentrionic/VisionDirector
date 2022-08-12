part of 'edit_step_cubit.dart';

/// * [progress] is the current upload progress.
/// * [isDirty] `true` if at least one value got changed.
@freezed
class EditStepState with _$EditStepState {
  const factory EditStepState({
    required StepInput input,
    required double progress,
    required bool isDirty,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<StepFailure, Step>> stepFailureOrSuccessOption,
  }) = _EditStepState;

  factory EditStepState.initial() => EditStepState(
        input: StepInput.empty(),
        progress: 0.0,
        isDirty: false,
        showErrorMessages: false,
        isSubmitting: false,
        stepFailureOrSuccessOption: none(),
      );
}

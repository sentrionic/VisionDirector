part of 'create_steps_cubit.dart';

/// * [steps] is a list of step dto.
/// * [page] is the form's current page.
/// * [progress] is the upload progress.
@freezed
class CreateStepsState with _$CreateStepsState {
  const factory CreateStepsState({
    required List<StepInput> steps,
    required int page,
    required double progress,
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool isDownloading,
    required Option<Either<StepFailure, Unit>> stepFailureOrSuccessOption,
  }) = _CreateStepState;

  factory CreateStepsState.initial() => CreateStepsState(
        steps: [],
        page: 0,
        progress: 0.0,
        showErrorMessages: false,
        isSubmitting: false,
        isDownloading: false,
        stepFailureOrSuccessOption: none(),
      );
}

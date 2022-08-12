part of 'delete_step_cubit.dart';

@freezed
class DeleteStepState with _$DeleteStepState {
  const factory DeleteStepState.initial() = _Initial;
  const factory DeleteStepState.actionInProgress() = _ActionInProgress;
  const factory DeleteStepState.deleteFailure(StepFailure failure) =
      _DeleteFailure;
  const factory DeleteStepState.deleteSuccess() = _DeleteSuccess;
}

part of 'user_steps_cubit.dart';

@freezed
class UserStepsState with _$UserStepsState {
  const factory UserStepsState.initial() = _Initial;
  const factory UserStepsState.loadInProgress() = _LoadInProgress;
  const factory UserStepsState.loadSuccess(List<ScenarioStep> steps) =
      _LoadSuccess;
  const factory UserStepsState.loadFailure(StepFailure failure) = _LoadFailure;
}

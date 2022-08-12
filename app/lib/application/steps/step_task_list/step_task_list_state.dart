part of 'step_task_list_cubit.dart';

@freezed
class StepTaskListState with _$StepTaskListState {
  const factory StepTaskListState.initial() = _Initial;
  const factory StepTaskListState.loadInProgress() = _LoadInProgress;
  const factory StepTaskListState.loadSuccess(List<StepTask> stepTasks) =
      _LoadSuccess;
  const factory StepTaskListState.loadFailure(StepFailure failure) =
      _LoadFailure;
}

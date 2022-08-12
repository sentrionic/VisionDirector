part of 'user_tasks_cubit.dart';

@freezed
class UserTasksState with _$UserTasksState {
  const factory UserTasksState.initial() = _Initial;
  const factory UserTasksState.loadInProgress() = _LoadInProgress;
  const factory UserTasksState.loadSuccess(
    List<ScenarioTask> tasks,
    List<ScenarioTask> filteredTasks,
  ) = _LoadSuccess;
  const factory UserTasksState.loadFailure(TaskFailure failure) = _LoadFailure;
}

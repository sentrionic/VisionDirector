part of 'task_list_cubit.dart';

@freezed
class TaskListState with _$TaskListState {
  const factory TaskListState.initial() = _Initial;
  const factory TaskListState.loadInProgress() = _LoadInProgress;
  const factory TaskListState.loadSuccess(
    List<Task> tasks,
    List<Task> filteredTasks,
  ) = _LoadSuccess;
  const factory TaskListState.loadFailure(TaskFailure failure) = _LoadFailure;
}

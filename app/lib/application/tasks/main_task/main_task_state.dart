part of 'main_task_cubit.dart';

@freezed
class MainTaskState with _$MainTaskState {
  const factory MainTaskState.initial() = _Initial;
  const factory MainTaskState.loadInProgress() = _LoadInProgress;
  const factory MainTaskState.loadSuccess(Task task) = _LoadSuccess;
  const factory MainTaskState.loadFailure(TaskFailure failure) = _LoadFailure;
}

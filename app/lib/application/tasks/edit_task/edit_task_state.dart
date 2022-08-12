part of 'edit_task_cubit.dart';

@freezed
class EditTaskState with _$EditTaskState {
  const factory EditTaskState({
    required TaskTitle title,
    required TaskBody body,
    Step? step,
    Collaborator? assignee,
    DateTime? deadline,
    required bool isCompleted,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<TaskFailure, Task>> taskFailureOrSuccessOption,
  }) = _EditTaskState;

  factory EditTaskState.initial() => EditTaskState(
        title: TaskTitle(''),
        body: TaskBody(''),
        showErrorMessages: false,
        isSubmitting: false,
        isCompleted: false,
        taskFailureOrSuccessOption: none(),
      );
}

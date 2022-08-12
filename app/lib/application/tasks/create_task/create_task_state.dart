part of 'create_task_cubit.dart';

@freezed
class CreateTaskState with _$CreateTaskState {
  const factory CreateTaskState({
    required TaskTitle title,
    required TaskBody body,
    Step? step,
    Collaborator? assignee,
    DateTime? deadline,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<TaskFailure, Unit>> taskFailureOrSuccessOption,
  }) = _CreateTaskState;

  factory CreateTaskState.initial() => CreateTaskState(
        title: TaskTitle(''),
        body: TaskBody(''),
        showErrorMessages: false,
        isSubmitting: false,
        taskFailureOrSuccessOption: none(),
      );
}

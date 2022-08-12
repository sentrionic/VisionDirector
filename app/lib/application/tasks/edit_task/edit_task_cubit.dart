import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/tasks/i_task_repository.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/domain/tasks/task_failure.dart';
import 'package:vision_director/domain/tasks/value_objects.dart';

part 'edit_task_state.dart';
part 'edit_task_cubit.freezed.dart';

/// [EditTaskCubit] handles the update of a [Task].
@injectable
class EditTaskCubit extends Cubit<EditTaskState> {
  final ITaskRepository _repository;

  EditTaskCubit(this._repository) : super(EditTaskState.initial());

  /// Initializes the state from the given [task].
  void initialize(Task task) {
    emit(
      state.copyWith(
        title: task.title,
        body: task.body ?? TaskBody(""),
        isCompleted: task.isCompleted,
        assignee: task.assignee,
        deadline: task.deadline != null ? DateTime.parse(task.deadline!) : null,
        step: task.step,
      ),
    );
  }

  /// Updates the [EditTaskState]'s [TaskTitle] value and resets the error.
  void titleChanged(String title) {
    emit(
      state.copyWith(
        title: TaskTitle(title),
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditTaskState]'s [TaskBody] value and resets the error.
  void bodyChanged(String body) {
    emit(
      state.copyWith(
        body: TaskBody(body),
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditTaskState]'s [Assignee] value and resets the error.
  void assigneeChanged(Collaborator? assignee) {
    emit(
      state.copyWith(
        assignee: assignee,
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditTaskState]'s [Step] value and resets the error.
  void stepChanged(Step? step) {
    emit(
      state.copyWith(
        step: step,
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditTaskState]'s [isCompleted] value and resets the error.
  void isCompletedChanged({required bool isCompleted}) {
    emit(
      state.copyWith(
        isCompleted: isCompleted,
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditTaskState]'s [deadline] value and resets the error.
  void deadlineChanged(DateTime? deadline) {
    emit(
      state.copyWith(
        deadline: deadline,
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Submits the request to edit the task for the given [taskId].
  ///
  /// Emits the created [Task] if successful and a [TaskFailure] otherwise.
  Future<void> submitEditTask(String scenarioId, String taskId) async {
    Either<TaskFailure, Task>? failureOrSuccess;

    final isTitleValid = state.title.isValid();
    final isBodyValid = state.body.isValid();

    if (isTitleValid && isBodyValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          taskFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.editTask(
        scenarioId,
        taskId,
        state.title.getOrCrash(),
        state.body.getOrCrash(),
        state.step?.id,
        state.assignee?.id,
        state.deadline,
        isCompleted: state.isCompleted,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        taskFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}

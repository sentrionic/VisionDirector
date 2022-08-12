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

part 'create_task_state.dart';
part 'create_task_cubit.freezed.dart';

/// [CreateTaskCubit] handles the creation of a [Task].
@injectable
class CreateTaskCubit extends Cubit<CreateTaskState> {
  final ITaskRepository _repository;

  CreateTaskCubit(this._repository) : super(CreateTaskState.initial());

  /// Updates the [CreateTaskState]'s [TaskTitle] value and resets the error.
  void titleChanged(String title) {
    emit(
      state.copyWith(
        title: TaskTitle(title),
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [CreateTaskState]'s [TaskBody] value and resets the error.
  void bodyChanged(String body) {
    emit(
      state.copyWith(
        body: TaskBody(body),
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [CreateTaskState]'s [Assignee] value and resets the error.
  void assigneeChanged(Collaborator? assignee) {
    emit(
      state.copyWith(
        assignee: assignee,
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [CreateTaskState]'s [Step] value and resets the error.
  void stepChanged(Step? step) {
    emit(
      state.copyWith(
        step: step,
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [CreateTaskState]'s [deadline] value and resets the error.
  void deadlineChanged(DateTime? deadline) {
    emit(
      state.copyWith(
        deadline: deadline,
        taskFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Submits the request to create the task.
  ///
  /// Emits the created [Task] if successful and a [TaskFailure] otherwise.
  /// * [scenarioId] is the id of the scenario the task belongs to.
  Future<void> submitTask(String scenarioId) async {
    Either<TaskFailure, Unit>? failureOrSuccess;

    final isTitleValid = state.title.isValid();
    final isBodyValid = state.body.isValid();

    if (isTitleValid && isBodyValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          taskFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.createTask(
        scenarioId,
        state.title.getOrCrash(),
        state.body.getOrCrash(),
        state.step?.id,
        state.assignee?.id,
        state.deadline,
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

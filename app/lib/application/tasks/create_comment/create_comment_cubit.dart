import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/common/value_objects.dart';
import 'package:vision_director/domain/tasks/i_task_repository.dart';
import 'package:vision_director/domain/tasks/task_failure.dart';
import 'package:vision_director/domain/tasks/value_objects.dart';

part 'create_comment_state.dart';
part 'create_comment_cubit.freezed.dart';

/// [CreateCommentCubit] handles the creation of a [Comment].
@injectable
class CreateCommentCubit extends Cubit<CreateCommentState> {
  final ITaskRepository _repository;
  CreateCommentCubit(this._repository) : super(CreateCommentState.initial());

  /// Updates the [CreateCommentCubit]'s [TaskBody] value and resets the error.
  void bodyChanged(String body) => emit(
        state.copyWith(
          body: CommentBody(body),
          commentFailureOrSuccessOption: none(),
        ),
      );

  /// Toggles the [CreateCommentCubit]'s [showPreview] value and emits it.
  void toggleShowPreview({required bool showPreview}) =>
      emit(state.copyWith(showPreview: showPreview));

  /// Submits the request to create the comment.
  ///
  /// Emits [Unit] if successful and a [TaskFailure] otherwise.
  /// * [scenarioId] is the id of the scenario the task belongs to.
  /// * [taskId] is the id of the task the comment belongs to.
  Future<void> submitCreateComment(String scenarioId, String taskId) async {
    Either<TaskFailure, Unit>? failureOrSuccess;

    final isBodyValid = state.body.isValid();

    if (isBodyValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          commentFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.createComment(
        scenarioId,
        taskId,
        state.body.getOrCrash(),
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        commentFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}

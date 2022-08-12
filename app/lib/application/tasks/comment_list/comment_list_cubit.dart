import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/common/comment.dart';
import 'package:vision_director/domain/tasks/i_task_repository.dart';
import 'package:vision_director/domain/tasks/task_failure.dart';

part 'comment_list_state.dart';
part 'comment_list_cubit.freezed.dart';

/// [CommentListCubit] manages the current task's [Comment]s.
@injectable
class CommentListCubit extends Cubit<CommentListState> {
  final ITaskRepository _repository;
  CommentListCubit(this._repository) : super(const CommentListState.initial());

  /// Fetches the comments for the given [taskId].
  ///
  /// Emits [CommentListState.loadSuccess] if successful and [CommentListState.loadFailure] otherwise.
  Future<void> getComments(String scenarioId, String taskId) async {
    emit(const CommentListState.loadInProgress());
    final failureOrTasks = await _repository.getComments(
      scenarioId,
      taskId,
    );

    emit(
      failureOrTasks.fold(
        (f) => CommentListState.loadFailure(f),
        (comments) => CommentListState.loadSuccess(comments),
      ),
    );
  }

  /// Adds the new [comment] to the [CommentListState].
  void addComment(Comment comment) {
    state.maybeWhen(
      loadSuccess: (comments) async {
        emit(CommentListState.loadSuccess([...comments, comment]));
      },
      orElse: () {},
    );
  }
}

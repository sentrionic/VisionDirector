part of 'comment_list_cubit.dart';

@freezed
class CommentListState with _$CommentListState {
  const factory CommentListState.initial() = _Initial;
  const factory CommentListState.loadInProgress() = _LoadInProgress;
  const factory CommentListState.loadSuccess(List<Comment> comments) =
      _LoadSuccess;
  const factory CommentListState.loadFailure(TaskFailure failure) =
      _LoadFailure;
}

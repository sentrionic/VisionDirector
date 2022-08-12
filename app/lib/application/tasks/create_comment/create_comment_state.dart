part of 'create_comment_cubit.dart';

@freezed
class CreateCommentState with _$CreateCommentState {
  const factory CreateCommentState({
    required CommentBody body,
    required bool showPreview,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<TaskFailure, Unit>> commentFailureOrSuccessOption,
  }) = _CreateCommentState;

  factory CreateCommentState.initial() => CreateCommentState(
        body: CommentBody(''),
        showPreview: false,
        showErrorMessages: false,
        isSubmitting: false,
        commentFailureOrSuccessOption: none(),
      );
}

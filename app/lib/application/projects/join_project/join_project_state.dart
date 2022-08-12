part of 'join_project_cubit.dart';

@freezed
class JoinProjectState with _$JoinProjectState {
  const factory JoinProjectState({
    required InviteLink inviteLink,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ProjectFailure, Project>>
        projectFailureOrSuccessOption,
  }) = _JoinProjectState;

  factory JoinProjectState.initial() => JoinProjectState(
        inviteLink: InviteLink(''),
        showErrorMessages: false,
        isSubmitting: false,
        projectFailureOrSuccessOption: none(),
      );
}

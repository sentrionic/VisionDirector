import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/projects/i_project_repository.dart';
import 'package:vision_director/domain/projects/project.dart';
import 'package:vision_director/domain/projects/project_failure.dart';
import 'package:vision_director/domain/projects/value_objects.dart';

part 'join_project_cubit.freezed.dart';
part 'join_project_state.dart';

/// [JoinProjectCubit] handles the process of joining a [Project].
@injectable
class JoinProjectCubit extends Cubit<JoinProjectState> {
  final IProjectRepository _repository;
  JoinProjectCubit(this._repository) : super(JoinProjectState.initial());

  /// Updates the [JoinProjectState]'s [InviteLink] value and resets the error.
  Future<void> linkChanged(String link) async {
    emit(
      state.copyWith(
        inviteLink: InviteLink(link),
        projectFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Submits the request to join the project.
  ///
  /// Emits the joined [Project] if successful and the [ProjectFailure] otherwise
  Future<void> submitJoinProject() async {
    Either<ProjectFailure, Project>? failureOrSuccess;

    final isInviteValid = state.inviteLink.isValid();

    if (isInviteValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          projectFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.joinProject(
        state.inviteLink.getOrCrash(),
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        projectFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}

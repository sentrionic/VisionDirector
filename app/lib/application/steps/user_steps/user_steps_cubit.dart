import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/step_failure.dart';

part 'user_steps_state.dart';
part 'user_steps_cubit.freezed.dart';

@injectable
class UserStepsCubit extends Cubit<UserStepsState> {
  final IStepRepository _repository;
  UserStepsCubit(this._repository) : super(const UserStepsState.initial());

  /// Fetches the current user's assigned steps.
  ///
  /// Emits [UserStepsState.loadSuccess] if successful and [UserStepsState.loadFailure] otherwise.
  Future<void> getUsersSteps() async {
    emit(const UserStepsState.loadInProgress());
    final failureOrSteps = await _repository.getUsersSteps();
    emit(
      failureOrSteps.fold(
        (f) => UserStepsState.loadFailure(f),
        (steps) => UserStepsState.loadSuccess(steps),
      ),
    );
  }
}

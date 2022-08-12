import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/step_failure.dart';

part 'step_task_list_state.dart';
part 'step_task_list_cubit.freezed.dart';

/// [StepTaskListCubit] manages the current scenario's [StepTask]s.
@injectable
class StepTaskListCubit extends Cubit<StepTaskListState> {
  final IStepRepository _repository;

  StepTaskListCubit(this._repository)
      : super(const StepTaskListState.initial());

  /// Fetches the steptasks for the given scenario [scenarioId].
  ///
  /// Emits [StepTaskListState.loadSuccess] if successful and [StepTaskListState.loadFailure] otherwise.
  Future<void> getStepTasks(String scenarioId) async {
    emit(const StepTaskListState.loadInProgress());
    final failureOrSteps = await _repository.getStepTasks(scenarioId);
    emit(
      failureOrSteps.fold(
        (f) => StepTaskListState.loadFailure(f),
        (steps) => StepTaskListState.loadSuccess(steps),
      ),
    );
  }
}

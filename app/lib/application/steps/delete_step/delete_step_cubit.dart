import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/domain/steps/step_failure.dart';

part 'delete_step_cubit.freezed.dart';

part 'delete_step_state.dart';

/// [DeleteStepCubit] handles the deletion of a step.
@injectable
class DeleteStepCubit extends Cubit<DeleteStepState> {
  final IStepRepository _repository;

  DeleteStepCubit(this._repository) : super(const DeleteStepState.initial());

  /// Deletes the step in the network and emits either [unit] on success or [StepFailure].
  ///
  /// * [scenarioId] is the id of the scenario.
  /// * [stepId] is the id of the step.
  Future<void> deleteStep(String scenarioId, String stepId) async {
    emit(const DeleteStepState.actionInProgress());
    final possibleFailure = await _repository.deleteStep(scenarioId, stepId);
    emit(
      possibleFailure.fold(
        (f) => DeleteStepState.deleteFailure(f),
        (_) => const DeleteStepState.deleteSuccess(),
      ),
    );
  }
}

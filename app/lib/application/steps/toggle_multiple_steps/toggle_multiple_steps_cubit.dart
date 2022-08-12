import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/step_failure.dart';

part 'toggle_multiple_steps_state.dart';
part 'toggle_multiple_steps_cubit.freezed.dart';

/// [ToggleMultipleStepsCubit] manages the locking of steps.
@injectable
class ToggleMultipleStepsCubit extends Cubit<ToggleMultipleStepsState> {
  final IStepRepository _repository;
  ToggleMultipleStepsCubit(this._repository)
      : super(ToggleMultipleStepsState.initial());

  /// Initializes the [ToggleMultipleStepsState] with the given [steps] and emits it.
  void initialize(List<Step> steps) => emit(
        state.copyWith(
          steps: steps
              .map(
                (e) => ToggleStep(
                  id: e.id,
                  name: e.name.getOrCrash(),
                  isLocked: e.isLocked,
                ),
              )
              .toList(),
        ),
      );

  /// Updates the [isLocked] value of the step with the given [id].
  void changeValue(String id, {required bool isLocked}) => emit(
        state.copyWith(
          steps: state.steps
              .map((e) => e.id == id ? e.copyWith(isLocked: isLocked) : e)
              .toList(),
        ),
      );

  /// Changes the `isLocked` status of the edited steps on the network.
  ///
  /// Emits a [StepFailure] on failure and [Unit] on success.
  Future<void> submitList(String scenarioId) async {
    Either<StepFailure, Unit>? failureOrSuccess;

    emit(
      state.copyWith(
        isSubmitting: true,
        stepFailureOrSuccessOption: none(),
      ),
    );

    failureOrSuccess = await _repository.toggleLockMultipleSteps(
      scenarioId,
      state.steps,
    );

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        stepFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}

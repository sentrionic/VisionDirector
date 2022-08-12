import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/scenarios/i_scenario_repository.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/scenarios/scenario_failure.dart';
import 'package:vision_director/domain/scenarios/value_objects.dart';

part 'edit_scenario_state.dart';
part 'edit_scenario_cubit.freezed.dart';

/// [EditScenarioCubit] handles the edit of a given [Scenario].
@injectable
class EditScenarioCubit extends Cubit<EditScenarioState> {
  final IScenarioRepository _repository;

  EditScenarioCubit(this._repository) : super(EditScenarioState.initial());

  /// Sets the initial [ScenarioName], description and [Status] values of the to be edited scenario in the [EditScenarioState].
  Future<void> initialize(Scenario scenario) async {
    emit(
      state.copyWith(
        name: scenario.name,
        description: scenario.description,
        status: scenario.status,
        scenarioFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditScenarioState]'s [ScenarioName] value and resets the error.
  Future<void> nameChanged(String name) async {
    emit(
      state.copyWith(
        name: ScenarioName(name),
        scenarioFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditScenarioState]'s description value and resets the error.
  Future<void> descriptionChanged(String description) async {
    emit(
      state.copyWith(
        description: ScenarioDescription(description),
        scenarioFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditScenarioState]'s [Status] value and resets the error.
  Future<void> statusChanged(Status status) async {
    emit(
      state.copyWith(
        status: status,
        scenarioFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Submits the request to edit the scenario.
  ///
  /// Emits [unit] if successful and a [ScenarioFailure] otherwise.
  Future<void> submitEditScenario(String scenarioId) async {
    Either<ScenarioFailure, Unit>? failureOrSuccess;

    final isNameValid = state.name.isValid();
    final isDescriptionValid = state.description?.isValid() ?? true;

    if (isNameValid && isDescriptionValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          scenarioFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.editScenario(
        scenarioId,
        state.name.getOrCrash(),
        state.description?.getOrCrash(),
        state.status,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        scenarioFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}

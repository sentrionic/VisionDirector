import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/scenarios/i_scenario_repository.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/scenarios/scenario_failure.dart';
import 'package:vision_director/domain/scenarios/value_objects.dart';

part 'create_scenario_state.dart';
part 'create_scenario_cubit.freezed.dart';

/// [CreateScenarioCubit] handles the creation of a [Scenario].
@injectable
class CreateScenarioCubit extends Cubit<CreateScenarioState> {
  final IScenarioRepository _repository;

  CreateScenarioCubit(this._repository) : super(CreateScenarioState.initial());

  /// Updates the [CreateScenarioState]'s [ScenarioName] value and resets the error.
  void nameChanged(String name) {
    emit(
      state.copyWith(
        name: ScenarioName(name),
        scenarioFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Submits the request to create the scenario.
  ///
  /// Emits the newly created [Scenario] if successful and a [ScenarioFailure] otherwise.
  Future<void> createScenario(String projectId) async {
    Either<ScenarioFailure, Scenario>? failureOrSuccess;

    final isNameValid = state.name.isValid();

    if (isNameValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          scenarioFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.createScenario(
        projectId,
        state.name.getOrCrash(),
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

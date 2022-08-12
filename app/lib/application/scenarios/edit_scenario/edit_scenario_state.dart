part of 'edit_scenario_cubit.dart';

@freezed
class EditScenarioState with _$EditScenarioState {
  const factory EditScenarioState({
    required ScenarioName name,
    ScenarioDescription? description,
    Status? status,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ScenarioFailure, Unit>>
        scenarioFailureOrSuccessOption,
  }) = _EditScenarioState;

  factory EditScenarioState.initial() => EditScenarioState(
        name: ScenarioName(''),
        description: ScenarioDescription(''),
        showErrorMessages: false,
        isSubmitting: false,
        scenarioFailureOrSuccessOption: none(),
      );
}

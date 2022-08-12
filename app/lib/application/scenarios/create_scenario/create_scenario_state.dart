part of 'create_scenario_cubit.dart';

@freezed
class CreateScenarioState with _$CreateScenarioState {
  const factory CreateScenarioState({
    required ScenarioName name,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ScenarioFailure, Scenario>>
        scenarioFailureOrSuccessOption,
  }) = _CreateScenarioState;

  factory CreateScenarioState.initial() => CreateScenarioState(
        name: ScenarioName(''),
        showErrorMessages: false,
        isSubmitting: false,
        scenarioFailureOrSuccessOption: none(),
      );
}

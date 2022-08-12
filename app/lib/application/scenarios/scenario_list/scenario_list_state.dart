part of 'scenario_list_cubit.dart';

@freezed
class ScenarioListState with _$ScenarioListState {
  const factory ScenarioListState.initial() = _Initial;
  const factory ScenarioListState.loadInProgress() = _LoadInProgress;

  /// Successfully fetched the scenarios.
  ///
  /// * [scenarios] the list of scenarios for the current project
  /// * [current] is the id of the currently open [Scenario]
  const factory ScenarioListState.loadSuccess(
    List<Scenario> scenarios,
    String current,
  ) = _LoadSuccess;
  const factory ScenarioListState.loadFailure(ScenarioFailure failure) =
      _LoadFailure;
}

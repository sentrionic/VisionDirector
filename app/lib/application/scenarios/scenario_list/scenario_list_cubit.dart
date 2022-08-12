import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/scenarios/i_scenario_repository.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/scenarios/scenario_failure.dart';
import 'package:vision_director/infrastructure/scenarios/scenario_dto.dart';

part 'scenario_list_state.dart';
part 'scenario_list_cubit.freezed.dart';

/// [ScenarioListCubit] manages the current project's [Scenario]s.
@injectable
class ScenarioListCubit extends HydratedCubit<ScenarioListState> {
  final IScenarioRepository _repository;

  ScenarioListCubit(this._repository)
      : super(const ScenarioListState.initial());

  /// Fetches the scenarios for the given project [id].
  ///
  /// Emits [ScenarioListState.loadSuccess] if successful and [ScenarioListState.loadFailure] otherwise.
  Future<void> getScenarios(String id) async {
    emit(const ScenarioListState.loadInProgress());
    final failureOrScenarios = await _repository.getScenarios(id);
    emit(
      failureOrScenarios.fold(
        (f) => ScenarioListState.loadFailure(f),
        (scenarios) => ScenarioListState.loadSuccess(scenarios, ""),
      ),
    );
  }

  /// Adds a new [Scenario] to the [ScenarioListState] and sets it as the new current scenario.
  void addNewScenario(Scenario scenario) {
    state.maybeWhen(
      loadSuccess: (scenarios, _) async {
        final data = [scenario, ...scenarios];

        emit(ScenarioListState.loadSuccess(data, scenario.id));
      },
      orElse: () {},
    );
  }

  /// Returns the id of the currently open scenario.
  String getCurrentScenarioId() {
    return state.maybeWhen(
      loadSuccess: (_, id) => id,
      orElse: () => "",
    );
  }

  /// Returns the currently open [Scenario] or `null`.
  Scenario? getCurrentScenario() {
    return state.maybeWhen(
      loadSuccess: (scenarios, id) =>
          scenarios.where((e) => e.id == id).firstOrNull,
      orElse: () => null,
    );
  }

  /// Sets the given [id] as current [Scenario] in the [ScenarioListState].
  void setCurrentScenario(String id) {
    state.maybeWhen(
      loadSuccess: (scenarios, _) => emit(
        ScenarioListState.loadSuccess([...scenarios], id),
      ),
      orElse: () {},
    );
  }

  /// Updates the provided [scenario] in the [ScenarioListState] and emits the new list.
  void updateScenario(Scenario scenario) {
    state.maybeWhen(
      loadSuccess: (scenarios, id) async {
        final data =
            scenarios.map((e) => e.id == scenario.id ? scenario : e).toList();
        emit(ScenarioListState.loadSuccess(data, id));
      },
      orElse: () {},
    );
  }

  @override
  ScenarioListState? fromJson(Map<String, dynamic> json) {
    final jsonMap = json['scenarios'] as List<dynamic>;
    final id = json['scenarioId'] as String;
    final list =
        jsonMap.map((e) => ScenarioDto.fromJson(e).toDomain()).toList();
    return ScenarioListState.loadSuccess(list, id);
  }

  @override
  Map<String, dynamic>? toJson(ScenarioListState state) {
    return state.maybeWhen(
      loadSuccess: (scenarios, id) => {
        'scenarios':
            scenarios.map((e) => ScenarioDto.fromDomain(e).toJson()).toList(),
        "scenarioId": id,
      },
      orElse: () => null,
    );
  }
}

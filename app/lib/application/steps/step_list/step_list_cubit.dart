import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/step_failure.dart';
import 'package:vision_director/infrastructure/steps/step_dto.dart';

part 'step_list_state.dart';
part 'step_list_cubit.freezed.dart';

/// [StepListCubit] manages the current scenario's [Step]s.
@injectable
class StepListCubit extends HydratedCubit<StepListState> {
  final IStepRepository _repository;

  StepListCubit(this._repository) : super(const StepListState.initial());

  /// Fetches the steps for the given scenario [scenarioId].
  ///
  /// Emits [StepListState.loadSuccess] if successful and [StepListState.loadFailure] otherwise.
  Future<void> getSteps(String scenarioId) async {
    emit(const StepListState.loadInProgress());
    final failureOrSteps = await _repository.getSteps(scenarioId);
    emit(
      failureOrSteps.fold(
        (f) => StepListState.loadFailure(f),
        (steps) => StepListState.loadSuccess(steps),
      ),
    );
  }

  /// Adds the new [Step]s to the [StepListState].
  void addNewSteps(List<Step> newSteps) {
    state.maybeWhen(
      loadSuccess: (steps) async {
        final data = [...steps, ...newSteps];

        emit(StepListState.loadSuccess(data));
      },
      orElse: () {},
    );
  }

  /// Returns the [Step] for the given [id] or `null`
  Step? getCurrentStep(String id) {
    return state.maybeWhen(
      loadSuccess: (steps) => steps.where((s) => s.id == id).firstOrNull,
      orElse: () => null,
    );
  }

  /// Returns the sum of all durations in the [StepListState] in seconds.
  int getTotalDuration() {
    return state.maybeWhen(
      loadSuccess: (steps) => steps.fold<int>(
        0,
        (p, c) => p + c.duration.inSeconds,
      ),
      orElse: () => 0,
    );
  }

  /// Locally changes the position of the steps in the [StepListState].
  /// Emits the new position of the dragged step to the network.
  ///
  /// * [changedSteps] is the newly ordered list of steps.
  /// * [scenarioId] is the id of the scenario the step belongs to.
  /// * [id] is the id of the step whose position got changed.
  /// * [position] is the new position.
  void changeStepPosition(
    List<Step> changedSteps,
    String scenarioId,
    String id,
    int position,
  ) {
    state.maybeWhen(
      loadSuccess: (steps) async {
        // Update the position value of the steps
        final data =
            changedSteps.mapIndexed((i, s) => s.copyWith(position: i)).toList();
        emit(StepListState.loadSuccess(data));

        // Update the position in the network
        await _repository.changePosition(scenarioId, id, position);
      },
      orElse: () {},
    );
  }

  /// Changes the position of the given [step] and updates all affected steps in the list.
  /// Emits the newly ordered list.
  void updateStepPositions(Step step) {
    state.maybeWhen(
      loadSuccess: (steps) async {
        // Remove the step from the list to reinsert it in the correct position
        final data = steps.where((s) => s.id != step.id).toList();
        data.insert(step.position, step);
        // Update the position value of the steps
        final list =
            data.mapIndexed((i, s) => s.copyWith(position: i)).toList();
        emit(StepListState.loadSuccess(list));
      },
      orElse: () {},
    );
  }

  /// Removes the given [step] from the list and emits the updates list.
  void removeStep(Step step) {
    state.maybeWhen(
      loadSuccess: (steps) async {
        final data = steps.where((s) => s.id != step.id).toList();
        // Update the position value of the steps
        final list =
            data.mapIndexed((i, s) => s.copyWith(position: i)).toList();
        emit(StepListState.loadSuccess(list));
      },
      orElse: () {},
    );
  }

  /// Updates the given [step] in the list and emits the updated list.
  void updateStep(Step step) {
    state.maybeWhen(
      loadSuccess: (steps) async {
        final data = steps.map((e) => e.id == step.id ? step : e).toList();
        emit(StepListState.loadSuccess(data));
      },
      orElse: () {},
    );
  }

  /// Updates the given [updatedSteps] in the list and emits the updated list.
  void updateSteps(List<Step> updatedSteps) {
    state.maybeWhen(
      loadSuccess: (steps) async {
        final data = steps
            .map(
              (e) => updatedSteps.where((u) => u.id == e.id).firstOrNull != null
                  ? updatedSteps.where((u) => u.id == e.id).first
                  : e,
            )
            .toList();
        emit(StepListState.loadSuccess(data));
      },
      orElse: () {},
    );
  }

  /// Sets the [isLocked] value for the step for the given [id] and emits the updated list.
  void toggleStepLock(String id, {required bool isLocked}) {
    state.maybeWhen(
      loadSuccess: (steps) async {
        final data = steps
            .map((e) => e.id == id ? e.copyWith(isLocked: isLocked) : e)
            .toList();
        emit(StepListState.loadSuccess(data));
      },
      orElse: () {},
    );
  }

  /// Returns the steps stored in the [StepListState].
  List<Step> getStepList() => state.maybeWhen(
        loadSuccess: (steps) => steps,
        orElse: () => [],
      );

  @override
  StepListState? fromJson(Map<String, dynamic> json) {
    final jsonMap = json['steps'] as List<dynamic>;
    final list = jsonMap.map((e) => StepDto.fromJson(e).toDomain()).toList();
    return StepListState.loadSuccess(list);
  }

  @override
  Map<String, dynamic>? toJson(StepListState state) {
    return state.maybeWhen(
      loadSuccess: (steps) =>
          {'steps': steps.map((e) => StepDto.fromDomain(e).toJson()).toList()},
      orElse: () => null,
    );
  }
}

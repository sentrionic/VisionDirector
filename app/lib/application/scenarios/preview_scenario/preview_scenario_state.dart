part of 'preview_scenario_cubit.dart';

/// * [index] The index of the currently playing step.
/// * [count] The timer's counter.
/// * [duration] The current step's duration in seconds.
/// * [totalDuration] The duration of all steps in the scenario.
/// * [initialized] `True` when the timer got started.
/// * [isPlaying] `True` if the timer is currently playing.
@freezed
class PreviewScenarioState with _$PreviewScenarioState {
  const factory PreviewScenarioState({
    required int index,
    required int count,
    required int duration,
    required int totalDuration,
    required bool initialized,
    required bool isPlaying,
    required bool displayName,
  }) = _PreviewScenarioState;

  factory PreviewScenarioState.initial() => const PreviewScenarioState(
        // Any index smaller then -1 since -1 is emitted to indicate the title.
        index: -2,
        count: 0,
        duration: Guidelines.titleLength,
        initialized: false,
        isPlaying: false,
        totalDuration: 0,
        displayName: false,
      );
}

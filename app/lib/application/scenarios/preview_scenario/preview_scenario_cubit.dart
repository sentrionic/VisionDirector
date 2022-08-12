import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:vision_director/domain/core/constants.dart';

part 'preview_scenario_state.dart';
part 'preview_scenario_cubit.freezed.dart';

/// [PreviewScenarioCubit] handles previewing the current scenario.
@injectable
class PreviewScenarioCubit extends Cubit<PreviewScenarioState> {
  // Has to be outside of the state to init with a callback
  late final PausableTimer _timer;
  PreviewScenarioCubit() : super(PreviewScenarioState.initial());

  /// Initializes the timer to allow playback
  void init(int runs) {
    _timer = PausableTimer(const Duration(seconds: 1), () {
      // Increment the count and total duration every second
      emit(
        state.copyWith(
          count: state.count + 1,
          totalDuration: state.totalDuration + 1,
        ),
      );

      // Continue the timer
      if (state.count < state.duration && state.index <= runs) {
        _timer
          ..reset()
          ..start();
        // Timer is over current items duration, so change the index to the next item
      } else if (state.index <= runs) {
        _timer
          ..reset()
          ..start();
        emit(
          state.copyWith(
            count: 0,
            index: state.index + 1,
          ),
        );
        // Preview reached the credits
      } else {
        reset();
      }
    });
  }

  /// Toggles between playing and pausing the timer.
  void toggleTimer() {
    if (!state.initialized) emit(state.copyWith(index: -1));
    if (_timer.isPaused) {
      emit(
        state.copyWith(
          initialized: true,
          isPlaying: true,
        ),
      );
      _timer.start();
    } else {
      emit(state.copyWith(isPlaying: false));
      _timer.pause();
    }
  }

  /// Resets the timer and the [PreviewScenarioState].
  void reset() {
    _timer.pause();
    _timer.reset();
    emit(
      state.copyWith(
        count: 0,
        totalDuration: 0,
        index: -1,
        duration: 5,
        initialized: false,
        isPlaying: false,
      ),
    );
  }

  /// Sets the duration of the current step in the [PreviewScenarioState].
  void setDuration(int duration) => emit(state.copyWith(duration: duration));

  /// Toggles the [PreviewScenarioState]'s [displayName] property and emits it.
  void toggleDisplayName() =>
      emit(state.copyWith(displayName: !state.displayName));

  /// Returns `true` if the timer is playing.
  bool isPlaying() => !_timer.isPaused;
}

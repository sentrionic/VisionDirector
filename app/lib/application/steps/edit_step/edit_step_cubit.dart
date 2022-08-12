import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/step_failure.dart';
import 'package:vision_director/domain/steps/value_objects.dart';

part 'edit_step_cubit.freezed.dart';
part 'edit_step_state.dart';

/// [EditStepCubit] handles the update of a [Step]
@injectable
class EditStepCubit extends Cubit<EditStepState> {
  final IStepRepository _repository;

  EditStepCubit(this._repository) : super(EditStepState.initial());

  /// Initializes the state from the given [step].
  Future<void> initialize(Step step) async {
    emit(state.copyWith(input: StepInput.fromStep(step)));
  }

  /// Sets the state to the initial state and initializes it with the given [step].
  Future<void> reset(Step step) async {
    emit(EditStepState.initial());
    initialize(step);
  }

  /// Updates the [EditStepState]'s [StepName] value and resets the error.
  void nameChanged(String name) {
    emit(
      state.copyWith(
        input: state.input.copyWith(
          name: StepName(name),
        ),
        isDirty: true,
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditStepState]'s [Annotation] value and resets the error.
  void annotationChanged(String annotation) {
    emit(
      state.copyWith(
        input: state.input.copyWith(
          annotation: Annotation(annotation),
        ),
        isDirty: true,
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditStepState]'s [duration] value and resets the error.
  ///
  /// * [duration] is the Duration in seconds.
  void durationChanged(int duration) {
    emit(
      state.copyWith(
        input: state.input.copyWith(
          duration: Duration(seconds: duration),
        ),
        isDirty: true,
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditStepState]'s [audio] value and resets the error.
  ///
  /// * [audio] is the new audio file.
  void audioChanged(File audio) {
    emit(
      state.copyWith(
        input: state.input.copyWith(
          audio: MediaInput(file: StepMedia(audio), mimeType: "audio"),
        ),
        isDirty: true,
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [EditStepState]'s [audio] value.
  ///
  /// * [media] is the new audio file.
  void changeMedia(File media, Duration duration, String mimeType) {
    emit(
      state.copyWith(
        input: state.input.copyWith(
          media: MediaInput(file: StepMedia(media), mimeType: mimeType),
          duration: duration,
        ),
        isDirty: true,
        stepFailureOrSuccessOption: none(),
      ),
    );

    if (state.input.audio != null) {
      emit(
        state.copyWith(
          stepFailureOrSuccessOption:
              optionOf(left(const StepFailure.mediaChanged())),
        ),
      );
    }
  }

  /// Resets the [EditStepState]'s [media], thumbnail values
  /// and the [duration] to the default duration.
  void resetMedia() {
    emit(
      state.copyWith(
        input: state.input.copyWith(
          media: null,
          thumbnail: null,
          duration: const Duration(seconds: Guidelines.defaultDuration),
        ),
      ),
    );
  }

  /// Resets the [EditStepState]'s [audio] value.
  void resetAudio() {
    emit(
      state.copyWith(
        input: state.input.copyWith(
          audio: null,
        ),
        isDirty: true,
      ),
    );
  }

  /// Updates the [EditStepState]'s [thumbnail] value.
  void changeThumbnail(String? thumbnail) {
    emit(
      state.copyWith(
        input: state.input.copyWith(
          thumbnail: thumbnail,
        ),
      ),
    );
  }

  /// Updates the [EditStepState]'s [transition] value.
  void changeTransition(StepTransition transition) => emit(
        state.copyWith(
          input: state.input.copyWith(transition: transition),
          isDirty: true,
        ),
      );

  /// Updates the [EditStepState]'s [media]'s [isPortrait] value.
  void changeIsPortrait({required bool isPortrait}) {
    emit(
      state.copyWith(
        input: state.input.copyWith(
          media: state.input.media!.copyWith(isPortrait: isPortrait),
        ),
      ),
    );
  }

  /// Updates the [EditStepState]'s [assignee] value.
  void assigneeChanged(Collaborator? assignee) {
    emit(
      state.copyWith(
        input: state.input.copyWith(
          assignee: assignee,
        ),
      ),
    );
  }

  /// Locks or unlocks the step on the network.
  ///
  /// * [scenarioId] is the id of the scenario the step belongs to.
  /// * [stepId] is the id of the step to be toggled.
  /// * [isLocked] `true` if the step should be locked for others.
  Future<void> toggleLockStep(
    String scenarioId,
    String stepId, {
    required bool isLocked,
  }) async {
    await _repository.toggleLockStep(scenarioId, stepId, isLocked: isLocked);
  }

  /// Submits the request to create the step.
  ///
  /// Emits [unit] if successful and a [StepFailure] otherwise.
  /// * [scenarioId] is the id of the scenario the step belongs to.
  /// * [stepId] is the id of the step to be edited.
  /// * [totalDuration] is the current duration of all other steps.
  Future<void> submitEditStep(
    String scenarioId,
    String stepId,
    int totalDuration,
  ) async {
    Either<StepFailure, Step>? failureOrSuccess;

    final isValid = state.input.failureOption.isNone();

    final overLimit = totalDuration + state.input.duration.inSeconds >
        Guidelines.maxTotalDuration;

    if (overLimit) {
      failureOrSuccess = left(const StepFailure.tooLong());
    }

    if (isValid && !overLimit) {
      emit(
        state.copyWith(
          isSubmitting: true,
          stepFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.editStep(
        scenarioId,
        stepId,
        state.input,
        (sent, total) => emit(state.copyWith(progress: sent / total * 100)),
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        isDirty: failureOrSuccess?.isLeft() ?? true,
        showErrorMessages: true,
        stepFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}

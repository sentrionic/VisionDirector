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

part 'create_step_state.dart';
part 'create_step_cubit.freezed.dart';

/// [CreateStepCubit] handles the creation of a single [Step].
@injectable
class CreateStepCubit extends Cubit<CreateStepState> {
  final IStepRepository _repository;
  CreateStepCubit(this._repository) : super(CreateStepState.initial());

  /// Updates the [CreateStepState]'s [StepName] value and resets the error.
  void changeName(String name) {
    emit(
      state.copyWith(
        step: state.step.copyWith(
          name: StepName(name),
        ),
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [CreateStepState]'s [Annotation] value and resets the error.
  void changeAnnotation(String annotation) {
    emit(
      state.copyWith(
        step: state.step.copyWith(
          annotation: Annotation(annotation),
        ),
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [CreateStepState]'s [MediaInput] value and resets the error.
  void changeMedia(File media, Duration duration, String mimeType) {
    emit(
      state.copyWith(
        step: state.step.copyWith(
          media: MediaInput(file: StepMedia(media), mimeType: mimeType),
          duration: duration,
        ),
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Sets the [CreateStepState]'s [MediaInput] value and thumbnail to `null`
  /// and the [duration] to the default duration.
  void resetMedia() {
    emit(
      state.copyWith(
        step: state.step.copyWith(
          media: null,
          thumbnail: null,
          duration: const Duration(seconds: Guidelines.defaultDuration),
        ),
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Updates the [CreateStepState]'s [Assignee] value.
  void changeAssignedMember(Collaborator? assignee) {
    emit(
      state.copyWith(
        step: state.step.copyWith(
          assignee: assignee,
        ),
      ),
    );
  }

  /// Updates the [CreateStepState]'s [Thumbnail] value.
  void changeThumbnail(String? thumbnail) {
    emit(
      state.copyWith(
        step: state.step.copyWith(
          thumbnail: thumbnail,
        ),
      ),
    );
  }

  /// Updates the [CreateStepState]'s [MediaInput]s [isPortrait] value.
  void changeIsPortrait({required bool isPortrait}) {
    emit(
      state.copyWith(
        step: state.step.copyWith(
          media: state.step.media!.copyWith(isPortrait: isPortrait),
        ),
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Submits the request to create the step.
  ///
  /// Emits [unit] if successful and a [StepFailure] otherwise.
  /// * [scenarioId] is the id of the scenario the step belongs to.
  /// * [totalDuration] is the current duration of all other steps.
  Future<void> createStep(String scenarioId, int totalDuration) async {
    Either<StepFailure, Unit>? failureOrSuccess;

    final isValid = state.step.failureOption.isNone();

    final overLimit = totalDuration + state.step.duration.inSeconds >
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

      // Uses the same endpoint as [CreateStepsCubit], so create an array
      failureOrSuccess = await _repository.createSteps(
        scenarioId,
        [state.step],
        (sent, total) => emit(state.copyWith(progress: sent / total * 100)),
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        stepFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}

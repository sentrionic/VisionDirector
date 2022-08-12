import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/domain/common/template.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/step_failure.dart';
import 'package:vision_director/domain/steps/value_objects.dart';
import 'package:vision_director/presentation/common/utils/media_utils.dart';

part 'create_steps_cubit.freezed.dart';

part 'create_steps_state.dart';

/// [CreateStepsCubit] handles the creation of multiple [Step]s.
@injectable
class CreateStepsCubit extends Cubit<CreateStepsState> {
  final IStepRepository _repository;

  CreateStepsCubit(this._repository) : super(CreateStepsState.initial());

  /// Adds a step to the [CreateStepsState]'s list of steps and resets the error.
  ///
  /// Emits the new list.
  void addStep(StepInput step) {
    emit(
      state.copyWith(
        steps: state.steps.where((e) => e.id == step.id).firstOrNull != null
            ? [...state.steps]
            : [...state.steps, step],
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Sets the steps in the [CreateStepsState] to the provided steps.
  ///
  /// Emits the new list.
  Future<void> setFromTemplate(List<TemplateStep> steps) async {
    emit(state.copyWith(isDownloading: true));

    final appDirectory = await getApplicationDocumentsDirectory();
    final mediaDirectory =
        "${appDirectory.path}/${AppConstants.mediaDirectory}";

    final List<StepInput> list = [];

    for (var i = 0; i < steps.length; i++) {
      final step = steps[i];
      var input = step.toStepInput();

      if (step.media != null) {
        if (!File('$mediaDirectory/${step.media!.fileName}').existsSync()) {
          final file = await File('$mediaDirectory/${step.media!.fileName}')
              .create(recursive: true);
          await _repository.downloadMedia(
            step.media!.fileUrl,
            file.path,
            (sent, total) => emit(state.copyWith(progress: sent / total * 100)),
          );

          input = input.copyWith(
            media: MediaInput(
              file: StepMedia(file),
              mimeType: step.media!.mimeType,
            ),
          );
        } else {
          input = input.copyWith(
            media: MediaInput(
              file: StepMedia(File('$mediaDirectory/${step.media!.fileName}')),
              mimeType: step.media!.mimeType,
            ),
          );
        }
      }

      list.add(input);
    }

    emit(
      state.copyWith(
        steps: list,
        isDownloading: false,
      ),
    );

    generateThumbnails();
  }

  Future<void> generateThumbnails() async {
    final List<StepInput> list = [];
    for (final step in state.steps) {
      if (step.media != null && step.media!.mimeType.contains("video")) {
        final thumbnail =
            await getThumbnail(step.media!.file.getOrCrash().path);
        list.add(
          step.copyWith(thumbnail: thumbnail),
        );
      } else {
        list.add(step);
      }
    }

    emit(state.copyWith(steps: list));
  }

  /// Removes the given step from the [CreateStepsState]'s list of steps.
  ///
  /// Emits the new list.
  void removeStep(String id) {
    emit(
      state.copyWith(
        steps: state.steps.where((c) => c.id != id).toList(),
        stepFailureOrSuccessOption: none(),
      ),
    );
  }

  /// Replaces the old list with the new [list] and emits the change.
  void setNewList(List<StepInput> list) {
    emit(state.copyWith(steps: list));
  }

  /// Updates the [CreateStepsCubit]'s [StepName] value for the step of the
  /// given [id].
  void changeName(String id, String name) {
    emit(
      state.copyWith(
        steps: state.steps
            .map((e) => e.id == id ? e.copyWith(name: StepName(name)) : e)
            .toList(),
      ),
    );
  }

  /// Updates the [CreateStepsCubit]'s [annotation] value for the step of the
  /// given [id].
  void changeAnnotation(String id, String annotation) {
    emit(
      state.copyWith(
        steps: state.steps
            .map(
              (e) => e.id == id
                  ? e.copyWith(
                      annotation: Annotation(annotation),
                    )
                  : e,
            )
            .toList(),
      ),
    );
  }

  /// Updates the [CreateStepsCubit]'s [MediaInput] value for the step of the
  /// given [id].
  ///
  /// * [id] is the id of the step that gets updated.
  /// * [duration] is the [Duration] of the given media in seconds.
  /// * [mimeType] is the mimeType of the file.
  void changeMedia(String id, File media, Duration duration, String mimeType) {
    emit(
      state.copyWith(
        steps: state.steps
            .map(
              (e) => e.id == id
                  ? e.copyWith(
                      media: MediaInput(
                        file: StepMedia(media),
                        mimeType: mimeType,
                      ),
                      duration: duration,
                    )
                  : e,
            )
            .toList(),
      ),
    );
  }

  /// Resets the [CreateStepsCubit]'s [MediaInput] and [thumbnail] values
  ///  for the step of the given [id] and sets the duration to the default value.
  void resetMedia(String id) {
    emit(
      state.copyWith(
        steps: state.steps
            .map(
              (e) => e.id == id
                  ? e.copyWith(
                      media: null,
                      thumbnail: null,
                      duration:
                          const Duration(seconds: Guidelines.defaultDuration),
                    )
                  : e,
            )
            .toList(),
      ),
    );
  }

  /// Updates the [CreateStepsCubit]'s [Assignee] value for the step of the
  /// given [id].
  void changeAssignedMember(String id, Collaborator assignee) {
    emit(
      state.copyWith(
        steps: state.steps
            .map((e) => e.id == id ? e.copyWith(assignee: assignee) : e)
            .toList(),
      ),
    );
  }

  /// Updates the [CreateStepsCubit]'s [thumbnail] value for the step of the
  /// given [id].
  void changeThumbnail(String id, String? thumbnail) {
    emit(
      state.copyWith(
        steps: state.steps
            .map((e) => e.id == id ? e.copyWith(thumbnail: thumbnail) : e)
            .toList(),
      ),
    );
  }

  /// Updates the [CreateStepsCubit]'s [MediaInput]s [isPortrait] value for the
  /// step of the given [id].
  void changeIsPortrait(String id, {required bool isPortrait}) {
    emit(
      state.copyWith(
        steps: state.steps
            .map(
              (e) => e.id == id
                  ? e.copyWith(
                      media: e.media!.copyWith(
                        isPortrait: isPortrait,
                      ),
                    )
                  : e,
            )
            .toList(),
      ),
    );
  }

  /// Moves to the Form's next page.
  void incrementPage() => emit(state.copyWith(page: state.page + 1));

  /// Returns to the Form's previous page.
  void decrementPage() => emit(state.copyWith(page: state.page - 1));

  /// Submits the request to create the steps.
  ///
  /// Emits [unit] if successful and a [StepFailure] otherwise.
  Future<void> createSteps(String scenarioId) async {
    Either<StepFailure, Unit>? failureOrSuccess;

    // Check if any step contains an error
    final isValid = !state.steps
        .map((e) => e.failureOption.isNone())
        .toList()
        .contains(false);

    // Check if it's over the time limit
    final overLimit =
        state.steps.fold<int>(0, (p, e) => p + e.duration.inSeconds) >
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

      failureOrSuccess = await _repository.createSteps(
        scenarioId,
        state.steps,
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

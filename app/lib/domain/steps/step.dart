import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/core/failures.dart';
import 'package:vision_director/domain/core/utils.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/value_objects.dart';

part 'step.freezed.dart';

/// [Step] represents the network's step model.
///
/// * [id] is the step's unique id.
/// * [name] is the step's name.
/// * [createdAt] the step's creation date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [updatedAt] the step's update date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [duration] is the duration of the media in the finished video in seconds.
/// * [position] is the position of the step in the timeline.
/// * [isLocked] `true` if the step is currently being worked on.
/// * [isCompleted] `true` if the step is complete.
/// * [transition] is the transition effect going to this step.
/// * [media] is the step's media.
/// * [audio] is the step's audio.
/// * [thumbnail] is an url to a frame of the media.
/// * [annotation] is an optional text appearing in the video.
/// * [assignee] is an optional member assigned to this step.
@freezed
class Step with _$Step {
  const Step._();

  const factory Step({
    required String id,
    required StepName name,
    required String createdAt,
    required String updatedAt,
    required Duration duration,
    required int position,
    required bool isLocked,
    required bool isCompleted,
    required StepTransition transition,
    Media? media,
    Media? audio,
    String? thumbnail,
    Annotation? annotation,
    Collaborator? assignee,
  }) = _Step;
}

/// [StepTransition] defines the transition effect going to this step.
///
/// * [fadeIn] Fades into the step.
/// * [fadeOut] Fades out of the step.
/// * [fadeInOut] Fades in and out of the step.
/// * [none] No effect will be used.
enum StepTransition {
  fadeIn,
  fadeOut,
  fadeInOut,
  none,
}

/// StepInput represents the local step model.
///
/// * [id] is the step's unique id.
/// * [name] is the step's name.
/// * [duration] is the duration of the media in the finished video in seconds.
/// * [media] is the step's local media.
/// * [audio] is the step's local audio.
/// * [annotation] is an optional text appearing in the video.
/// * [assignee] is an optional member assigned to this step.
/// * [thumbnail] is an url or local file that is a frame of the media.
/// * [transition] is the transition effect going to this step.
/// * [position] is the position of the step in the timeline.
@freezed
class StepInput with _$StepInput {
  const StepInput._();

  const factory StepInput({
    required String id,
    required StepName name,
    required Duration duration,
    MediaInput? media,
    MediaInput? audio,
    Annotation? annotation,
    Collaborator? assignee,
    String? thumbnail,
    StepTransition? transition,
    int? position,
  }) = _StepInput;

  /// A [StepInput] with default values.
  factory StepInput.empty() => StepInput(
        id: '',
        duration: const Duration(seconds: Guidelines.defaultDuration),
        name: StepName(''),
      );

  /// A [StepInput] with an unique id and the given name.
  factory StepInput.generate(String name) => StepInput(
        id: const Uuid().v4(),
        duration: const Duration(seconds: Guidelines.defaultDuration),
        name: StepName(name),
      );

  /// Converts the [step] into a [StepInput].
  factory StepInput.fromStep(Step step) => StepInput(
        id: step.id,
        name: step.name,
        duration: step.duration,
        annotation: step.annotation,
        transition: step.transition,
        position: step.position,
        assignee: step.assignee,
      );

  /// Validates if there are errors in the properties.
  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(
          // If media exists, check if it's valid. Automatically valid if null.
          media?.failureOption.fold(() => right(unit), (f) => left(f)) ??
              right(unit),
        )
        .andThen(
          // Check if the given duration is longer than the maximum allowed one.
          !isWithinGuidelines(duration)
              ? left(
                  ValueFailure.durationTooLong(
                    failedValue: duration.inSeconds,
                    max: Guidelines.maxDuration,
                  ),
                )
              : right(unit),
        )
        .andThen(
          // If audio exists, check if it's valid. Automatically valid if null.
          audio?.failureOption.fold(() => right(unit), (f) => left(f)) ??
              right(unit),
        )
        // If an annotation exists, check if it's valid. Automatically valid if null.
        .andThen(annotation?.failureOrUnit ?? right(unit))
        .fold((f) => some(f), (_) => none());
  }
}

/// [StepTask] represents the step task model.
///
/// * [id] is the step's unique id.
/// * [name] is the step's name.
/// * [createdAt] the step's creation date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [updatedAt] the step's update date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [position] is the position of the step in the timeline.
/// * [isCompleted] `true` if the step is complete.
/// * [taskCount] is the amount of tasks referencing this step that are open.
/// * [taskCompletedCount] is the amount of tasks referencing this step.
/// * [assignee] is an optional member assigned to this step.
@freezed
class StepTask with _$StepTask {
  const StepTask._();

  const factory StepTask({
    required String id,
    required StepName name,
    required String createdAt,
    required String updatedAt,
    required int position,
    required bool isCompleted,
    required int taskCount,
    required int taskCompletedCount,
    Collaborator? assignee,
  }) = _StepTask;
}

/// [ScenarioStep] represents the network's step model including its scenario.
///
/// * [id] is the step's unique id.
/// * [name] is the step's name.
/// * [createdAt] the step's creation date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [updatedAt] the step's update date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [duration] is the duration of the media in the finished video in seconds.
/// * [scenario] is the scenario this step belongs to.
/// * [media] is the step's media.
/// * [audio] is the step's audio.
/// * [thumbnail] is an url to a frame of the media.
/// * [annotation] is an optional text appearing in the video.
@freezed
class ScenarioStep with _$ScenarioStep {
  const ScenarioStep._();

  const factory ScenarioStep({
    required String id,
    required StepName name,
    required String createdAt,
    required String updatedAt,
    required Duration duration,
    required Scenario scenario,
    Media? media,
    Media? audio,
    String? thumbnail,
    Annotation? annotation,
  }) = _ScenarioStep;
}

/// [ToggleStep] is the model used to update the steps `isLocked` property.
///
/// * [id] is the step's unique id.
/// * [name] is the step's name.
/// * [isLocked] `true` if the step should be locked and `false` if it should be unlocked.
@freezed
class ToggleStep with _$ToggleStep {
  const ToggleStep._();

  const factory ToggleStep({
    required String id,
    required String name,
    required bool isLocked,
  }) = _ToggleStep;
}

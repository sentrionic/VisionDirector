import 'package:dartz/dartz.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/step_failure.dart';

/// Contains repository calls related to steps.
abstract class IStepRepository {
  /// Returns either a list of steps or a [StepFailure].
  Future<Either<StepFailure, List<Step>>> getSteps(
    String scenarioId,
  );

  /// Returns either a list of steps the current user is assigned to or a [StepFailure].
  Future<Either<StepFailure, List<ScenarioStep>>> getUsersSteps();

  /// Creates the steps on the network.
  ///
  /// Returns either [unit] on success or a [StepFailure].
  /// * [scenarioId] is the id of the scenario.
  /// * [steps] is a list of step dto.
  /// * [callback] is an upload progress callback.
  Future<Either<StepFailure, Unit>> createSteps(
    String scenarioId,
    List<StepInput> steps,
    void Function(int, int) callback,
  );

  /// Edits the steps with the given [stepId] on the network.
  ///
  /// Returns either the edited [Step] on success or a [StepFailure].
  /// * [scenarioId] is the id of the scenario.
  /// * [input] is the step dto.
  /// * [callback] is an upload progress callback.
  Future<Either<StepFailure, Step>> editStep(
    String scenarioId,
    String stepId,
    StepInput input,
    void Function(int, int) callback,
  );

  /// Deletes the step on the network.
  ///
  /// Returns either [unit] on success or a [StepFailure].
  /// * [scenarioId] is the id of the scenario.
  /// * [stepId] is the id of the step to be deleted.
  Future<Either<StepFailure, Unit>> deleteStep(
    String scenarioId,
    String stepId,
  );

  /// Updates the step's position on the network.
  ///
  /// Returns either [unit] on success or a [StepFailure].
  /// * [scenarioId] is the id of the scenario.
  /// * [stepId] is the id of the step to be updated.
  /// * [position] is the new position.
  Future<Either<StepFailure, Unit>> changePosition(
    String scenarioId,
    String stepId,
    int position,
  );

  /// Toggles the step's `isLocked` property.
  ///
  /// Returns either [unit] on success or a [StepFailure].
  /// * [scenarioId] is the id of the scenario.
  /// * [stepId] is the id of the step to be toggled.
  /// * [isLocked] `true` if the step should be locked.
  Future<Either<StepFailure, Unit>> toggleLockStep(
    String scenarioId,
    String stepId, {
    required bool isLocked,
  });

  /// Downloads the file.
  ///
  /// * [url] is the network file to be downloaded.
  /// * [filePath] is the path the file should be downloaded into.
  /// * [callback] is the download progress callback.
  Future<void> downloadMedia(
    String url,
    String filePath,
    void Function(int, int) callback,
  );

  /// Returns either a list of steptasks or a [StepFailure].
  Future<Either<StepFailure, List<StepTask>>> getStepTasks(
    String scenarioId,
  );

  /// Toggles the given steps `isLocked` values.
  ///
  /// * [scenarioId] is the id of the scenario these steps belong to.
  /// * [list] is the list of steps where the `isLocked` property should be changed.
  Future<Either<StepFailure, Unit>> toggleLockMultipleSteps(
    String scenarioId,
    List<ToggleStep> list,
  );
}

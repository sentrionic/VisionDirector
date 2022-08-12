import 'package:dartz/dartz.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/scenarios/scenario_failure.dart';

/// Contains repository calls related to scenarios.
abstract class IScenarioRepository {
  /// Returns either a list of scenarios or a [ScenarioFailure].
  Future<Either<ScenarioFailure, List<Scenario>>> getScenarios(
    String projectId,
  );

  /// Creates the scenario on the network.
  ///
  /// Returns either the new [Scenario] or a [ScenarioFailure].
  Future<Either<ScenarioFailure, Scenario>> createScenario(
    String projectId,
    String name,
  );

  /// Edits the scenario with the given [id] on the network.
  ///
  /// Returns either [unit] on success or a [ScenarioFailure].
  Future<Either<ScenarioFailure, Unit>> editScenario(
    String id,
    String name,
    String? description,
    Status? status,
  );

  /// Uploads the finished vision video to the scenario with the given [id].
  ///
  /// Returns either the url of the uploaded video or a [ScenarioFailure].
  /// * [id] is the id of the scenario.
  /// * [path] is the path of the file that should be uploaded.
  /// * [callback] is an upload progress callback.
  Future<Either<ScenarioFailure, String>> uploadVideo(
    String id,
    String path,
    void Function(int, int) callback,
  );

  /// Creates a template out of the given scenario [id]'s steps.
  ///
  /// Returns either [unit] or a [ScenarioFailure].
  /// * [name] is the name of the template
  /// * [description] is a short description of the template.
  Future<Either<ScenarioFailure, Unit>> createTemplate(
    String id,
    String name,
    String? description,
  );
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/scenarios/value_objects.dart';

part 'scenario.freezed.dart';

/// [Scenario] represents the scenario model.
///
/// * [id] is the scenario's unique id.
/// * [name] is the scenario's name.
/// * [createdAt] the scenario's creation date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [updatedAt] the scenario's update date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [owner] is the username of the person that created the scenario.
/// * [isOwner] `true` if the current user is the creator.
/// * [stepCount] is the amount of steps that belong to this scenario.
/// * [status] is the current [Status] of the scenario.
/// * [duration] is the sum of durations of all steps in seconds.
/// * [url] is the url of the finished vision video if it exists.
/// * [thumbnail] is an url to an image that belongs to one of the scenario's steps.
/// * [description] is the scenario's description.
@freezed
class Scenario with _$Scenario {
  const Scenario._();

  const factory Scenario({
    required String id,
    required ScenarioName name,
    required String createdAt,
    required String updatedAt,
    required String owner,
    required bool isOwner,
    required int stepCount,
    required Status status,
    required int duration,
    String? url,
    String? thumbnail,
    ScenarioDescription? description,
  }) = _Scenario;
}

/// [Status] is the scenario's current progress status.
///
/// * [inProgress] means it is currently being worked on.
/// * [inReview] means it is currently being reviewed.
/// * [finished] means the scenario is finished.
enum Status {
  inProgress,
  inReview,
  finished,
}

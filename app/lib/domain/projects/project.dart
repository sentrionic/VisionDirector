import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/common/collaborator.dart';

part 'project.freezed.dart';

/// [Project] represents the project model.
///
/// * [id] is the unique project id.
/// * [name] is the project's name.
/// * [createdAt] the project's creation date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [scenarioCount] is the amount of scenarios that belong to this project.
/// * [collaborators] is a list of members that are part of this project.
@freezed
class Project with _$Project {
  const Project._();

  const factory Project({
    required String id,
    required String name,
    required String createdAt,
    required int scenarioCount,
    required List<Collaborator> collaborators,
  }) = _Project;
}

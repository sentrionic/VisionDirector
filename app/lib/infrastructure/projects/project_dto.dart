import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/projects/project.dart';
import 'package:vision_director/infrastructure/common/collaborator_dto.dart';

part 'project_dto.freezed.dart';
part 'project_dto.g.dart';

@freezed
class ProjectDto with _$ProjectDto {
  const ProjectDto._();

  const factory ProjectDto({
    required String id,
    required String name,
    required String createdAt,
    required int scenarioCount,
    required List<CollaboratorDto> collaborators,
  }) = _ProjectDto;

  factory ProjectDto.fromDomain(Project project) {
    return ProjectDto(
      id: project.id,
      name: project.name,
      createdAt: project.createdAt,
      scenarioCount: project.scenarioCount,
      collaborators: project.collaborators
          .map((e) => CollaboratorDto.fromDomain(e))
          .toList(),
    );
  }

  Project toDomain() {
    return Project(
      id: id,
      name: name,
      createdAt: createdAt,
      scenarioCount: scenarioCount,
      collaborators: collaborators.map((e) => e.toDomain()).toList(),
    );
  }

  factory ProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectDtoFromJson(json);
}

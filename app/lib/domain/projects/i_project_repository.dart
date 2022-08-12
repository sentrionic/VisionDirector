import 'package:dartz/dartz.dart';
import 'package:vision_director/domain/common/template.dart';
import 'package:vision_director/domain/projects/project.dart';
import 'package:vision_director/domain/projects/project_failure.dart';

/// Contains repository calls related to projects.
abstract class IProjectRepository {
  /// Returns either a list of projects or a [ProjectFailure].
  Future<Either<ProjectFailure, List<Project>>> getProjectList();

  /// Joins the project for the given token.
  ///
  /// Returns either the newly joined project or a [ProjectFailure].
  Future<Either<ProjectFailure, Project>> joinProject(String token);

  /// Returns either a list of templates for the given [projectId] or a [ProjectFailure].
  Future<Either<ProjectFailure, List<Template>>> getTemplates(String projectId);
}

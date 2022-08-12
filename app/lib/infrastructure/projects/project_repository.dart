import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/common/template.dart';
import 'package:vision_director/domain/core/utils.dart';
import 'package:vision_director/domain/projects/i_project_repository.dart';
import 'package:vision_director/domain/projects/project.dart';
import 'package:vision_director/domain/projects/project_failure.dart';
import 'package:vision_director/infrastructure/common/template_dto.dart';
import 'package:vision_director/infrastructure/projects/project_dto.dart';

@LazySingleton(as: IProjectRepository)
class ProjectRepository extends IProjectRepository {
  final Dio _dio;

  ProjectRepository(this._dio);

  @override
  Future<Either<ProjectFailure, List<Project>>> getProjectList() async {
    try {
      final response = await _dio.get('/projects');

      final results = jsonDecode(response.data) as List<dynamic>;
      final List<Project> list = [];
      for (final project in results) {
        list.add(ProjectDto.fromJson(project).toDomain());
      }
      return right(list);
    } on DioError catch (err) {
      debugLog(err);
      return left(const ProjectFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const ProjectFailure.unexpected());
    }
  }

  @override
  Future<Either<ProjectFailure, Project>> joinProject(String token) async {
    try {
      final response = await _dio.post(
        '/projects/join',
        data: {
          "token": token,
        },
      );

      final result = jsonDecode(response.data);
      return right(ProjectDto.fromJson(result).toDomain());
    } on DioError catch (err) {
      debugLog(err);
      if (err.response?.statusCode == 404) {
        return left(const ProjectFailure.notFound());
      }
      return left(const ProjectFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const ProjectFailure.unexpected());
    }
  }

  @override
  Future<Either<ProjectFailure, List<Template>>> getTemplates(
    String projectId,
  ) async {
    try {
      final response = await _dio.get('/projects/$projectId/templates');

      final results = jsonDecode(response.data) as List<dynamic>;
      final List<Template> list = [];
      for (final template in results) {
        list.add(TemplateDto.fromJson(template).toDomain());
      }
      return right(list);
    } on DioError catch (err) {
      debugLog(err);
      return left(const ProjectFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const ProjectFailure.unexpected());
    }
  }
}

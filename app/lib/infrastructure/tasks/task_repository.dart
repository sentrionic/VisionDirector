import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart' hide Task;
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/common/comment.dart';
import 'package:vision_director/domain/core/utils.dart';
import 'package:vision_director/domain/tasks/i_task_repository.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/domain/tasks/task_failure.dart';
import 'package:vision_director/infrastructure/common/comment_dto.dart';
import 'package:vision_director/infrastructure/tasks/task_dto.dart';

@LazySingleton(as: ITaskRepository)
class TaskRepository extends ITaskRepository {
  final Dio _dio;

  TaskRepository(this._dio);

  @override
  Future<Either<TaskFailure, Unit>> createTask(
    String scenarioId,
    String title,
    String body,
    String? stepId,
    String? assigneeId,
    DateTime? deadline,
  ) async {
    try {
      await _dio.post(
        '/scenarios/$scenarioId/tasks',
        data: {
          "title": title,
          "body": body,
          "stepId": stepId,
          "assigneeId": assigneeId,
          "deadline": deadline?.toIso8601String(),
        },
      );

      return right(unit);
    } on DioError catch (err) {
      debugLog(err.response?.data);
      if (err.response?.statusCode == 400) {}
      return left(const TaskFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const TaskFailure.unexpected());
    }
  }

  @override
  Future<Either<TaskFailure, Task>> editTask(
    String scenarioId,
    String taskId,
    String title,
    String body,
    String? stepId,
    String? assigneeId,
    DateTime? deadline, {
    required bool isCompleted,
  }) async {
    try {
      final response = await _dio.put(
        '/scenarios/$scenarioId/tasks/$taskId',
        data: {
          "title": title,
          "body": body,
          "stepId": stepId,
          "assigneeId": assigneeId,
          "isCompleted": isCompleted,
          "deadline": deadline?.toIso8601String(),
        },
      );

      final result = jsonDecode(response.data);
      return right(TaskDto.fromJson(result).toDomain());
    } on DioError catch (err) {
      if (err.response?.statusCode == 400) {}
      return left(const TaskFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const TaskFailure.unexpected());
    }
  }

  @override
  Future<Either<TaskFailure, List<Task>>> getTasks({
    required String scenarioId,
    String? stepId,
    String? assigneeId,
    bool? isMain = false,
  }) async {
    try {
      final query =
          _getQuery(stepId: stepId, assigneeId: assigneeId, isMain: isMain);
      final response = await _dio.get('/scenarios/$scenarioId/tasks$query');
      final results = jsonDecode(response.data) as List<dynamic>;
      final List<Task> list = [];
      for (final task in results) {
        list.add(TaskDto.fromJson(task).toDomain());
      }
      return right(list);
    } on DioError catch (err) {
      debugLog(err);
      return left(const TaskFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const TaskFailure.unexpected());
    }
  }

  @override
  Future<Either<TaskFailure, List<ScenarioTask>>> getUsersTasks() async {
    try {
      final response = await _dio.get('/me/tasks');
      final results = jsonDecode(response.data) as List<dynamic>;
      final List<ScenarioTask> list = [];
      for (final task in results) {
        list.add(ScenarioTaskDto.fromJson(task).toDomain());
      }
      return right(list);
    } on DioError catch (err) {
      debugLog(err);
      return left(const TaskFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const TaskFailure.unexpected());
    }
  }

  /// Returns a query string made of the given parameters.
  /// If both are `null` it returns an empty string (No query).
  String _getQuery({String? stepId, String? assigneeId, bool? isMain}) {
    if (stepId == null && assigneeId == null) return "?isMain=$isMain";
    if (stepId != null && assigneeId == null) {
      return "?stepId=$stepId&isMain=$isMain";
    }
    if (stepId == null && assigneeId != null) {
      return "?assigneeId=$assigneeId&isMain=$isMain";
    }
    return "?stepId=$stepId&assigneeId=$assigneeId&isMain=$isMain";
  }

  @override
  Future<Either<TaskFailure, Unit>> createComment(
    String scenarioId,
    String taskId,
    String body,
  ) async {
    try {
      await _dio.post(
        '/scenarios/$scenarioId/tasks/$taskId/comments',
        data: {
          "body": body,
        },
      );

      return right(unit);
    } on DioError catch (err) {
      debugLog(err.response?.data);
      if (err.response?.statusCode == 400) {}
      return left(const TaskFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const TaskFailure.unexpected());
    }
  }

  @override
  Future<Either<TaskFailure, List<Comment>>> getComments(
    String scenarioId,
    String taskId,
  ) async {
    try {
      final response =
          await _dio.get('/scenarios/$scenarioId/tasks/$taskId/comments');
      final results = jsonDecode(response.data) as List<dynamic>;
      final List<Comment> list = [];
      for (final comment in results) {
        list.add(CommentDto.fromJson(comment).toDomain());
      }
      return right(list);
    } on DioError catch (err) {
      debugLog(err);
      return left(const TaskFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const TaskFailure.unexpected());
    }
  }
}

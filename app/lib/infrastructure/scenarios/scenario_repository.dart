import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/core/utils.dart';
import 'package:vision_director/domain/scenarios/i_scenario_repository.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/scenarios/scenario_failure.dart';
import 'package:vision_director/infrastructure/core/generic_response.dart';
import 'package:vision_director/infrastructure/scenarios/scenario_dto.dart';

@LazySingleton(as: IScenarioRepository)
class ScenarioRepository extends IScenarioRepository {
  final Dio _dio;

  ScenarioRepository(this._dio);

  @override
  Future<Either<ScenarioFailure, Scenario>> createScenario(
    String projectId,
    String name,
  ) async {
    try {
      final response = await _dio.post(
        '/projects/$projectId/scenarios',
        data: {
          "name": name,
        },
      );

      final result = jsonDecode(response.data);
      return right(ScenarioDto.fromJson(result).toDomain());
    } on DioError catch (err) {
      if (err.response?.statusCode == 400) {}
      return left(const ScenarioFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const ScenarioFailure.unexpected());
    }
  }

  @override
  Future<Either<ScenarioFailure, Unit>> editScenario(
    String id,
    String name,
    String? description,
    Status? status,
  ) async {
    try {
      await _dio.put(
        '/scenarios/$id',
        data: {
          "name": name,
          "description": description,
          "status": status.toString().split(".").last,
        },
      );

      return right(unit);
    } on DioError catch (err) {
      debugLog(err);
      if (err.response?.statusCode == 400) {}
      return left(const ScenarioFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const ScenarioFailure.unexpected());
    }
  }

  @override
  Future<Either<ScenarioFailure, List<Scenario>>> getScenarios(
    String projectId,
  ) async {
    try {
      final response = await _dio.get('/projects/$projectId/scenarios');
      final results = jsonDecode(response.data) as List<dynamic>;
      final List<Scenario> list = [];
      for (final scenario in results) {
        list.add(ScenarioDto.fromJson(scenario).toDomain());
      }
      return right(list);
    } on DioError catch (err) {
      debugLog(err);
      return left(const ScenarioFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const ScenarioFailure.unexpected());
    }
  }

  @override
  Future<Either<ScenarioFailure, String>> uploadVideo(
    String id,
    String path,
    void Function(int, int) callback,
  ) async {
    try {
      final formData = FormData();
      formData.files.add(
        MapEntry(
          "file",
          await MultipartFile.fromFile(
            path,
            contentType: MediaType("video", "mp4"),
          ),
        ),
      );

      final response = await _dio.put(
        '/scenarios/$id/video',
        data: formData,
        onSendProgress: callback,
      );

      final data = jsonDecode(response.data);
      final url = GenericResponse.fromMap(data).value;

      return right(url);
    } on DioError catch (err) {
      debugLog(err.response);
      return left(const ScenarioFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const ScenarioFailure.unexpected());
    }
  }

  @override
  Future<Either<ScenarioFailure, Unit>> createTemplate(
    String id,
    String name,
    String? description,
  ) async {
    try {
      await _dio.post(
        '/templates/$id',
        data: {
          "name": name,
          "description": description,
        },
      );

      return right(unit);
    } on DioError catch (err) {
      if (err.response?.statusCode == 400) {}
      return left(const ScenarioFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const ScenarioFailure.unexpected());
    }
  }
}

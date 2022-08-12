import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/core/utils.dart';
import 'package:vision_director/domain/steps/i_step_repository.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/step_failure.dart';
import 'package:vision_director/infrastructure/steps/step_dto.dart';

@LazySingleton(as: IStepRepository)
class StepRepository extends IStepRepository {
  final Dio _dio;

  StepRepository(this._dio);

  @override
  Future<Either<StepFailure, Unit>> createSteps(
    String scenarioId,
    List<StepInput> steps,
    void Function(int, int) callback,
  ) async {
    try {
      final formData = FormData();

      // Loop over all steps and add them to the form data.
      // Needs to be of form 'steps[i].property: property'.
      // Only adds values that are not null.
      steps.forEachIndexed(
        (i, e) async => {
          formData.fields.add(MapEntry('steps[$i].name', e.name.getOrCrash())),
          if (e.annotation != null)
            {
              formData.fields.add(
                MapEntry(
                  'steps[$i].annotation',
                  e.annotation!.getOrCrash(),
                ),
              )
            },
          formData.fields.add(
            MapEntry(
              'steps[$i].duration',
              e.duration.inSeconds.toString(),
            ),
          ),
          if (e.media != null)
            {
              formData.files.add(
                MapEntry(
                  "steps[$i].mediaFile",
                  await MultipartFile.fromFile(
                    e.media!.file.getOrCrash().path,
                    contentType: MediaType(
                      e.media!.mimeType.contains("video") ? "video" : "image",
                      e.media!.mimeType.contains("video") ? "mp4" : "jpg",
                    ),
                  ),
                ),
              ),
            },
          if (e.thumbnail != null)
            {
              formData.files.add(
                MapEntry(
                  "steps[$i].thumbnail",
                  await MultipartFile.fromFile(
                    e.thumbnail!,
                    contentType: MediaType("image", "jpg"),
                  ),
                ),
              ),
            },
          if (e.assignee != null)
            {
              formData.fields.add(
                MapEntry(
                  "steps[$i].assignee",
                  e.assignee!.id,
                ),
              ),
            },
        },
      );

      await _dio.post(
        '/scenarios/$scenarioId/steps',
        data: formData,
        onSendProgress: (count, total) => callback(count, total),
      );

      return right(unit);
    } on DioError catch (err) {
      debugLog(err);
      debugLog(err.response);
      return left(const StepFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      debugLog(err.message);
      return left(const StepFailure.unexpected());
    }
  }

  @override
  Future<Either<StepFailure, Unit>> deleteStep(
    String scenarioId,
    String stepId,
  ) async {
    try {
      await _dio.delete(
        '/scenarios/$scenarioId/steps/$stepId',
      );
      return right(unit);
    } on DioError catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    }
  }

  @override
  Future<Either<StepFailure, Step>> editStep(
    String scenarioId,
    String stepId,
    StepInput input,
    void Function(int, int) callback,
  ) async {
    try {
      final formData = FormData.fromMap({
        "name": input.name.getOrCrash(),
        "duration": input.duration.inSeconds,
        "annotation": input.annotation?.getOrCrash(),
        "transition": input.transition.toString().split(".").last,
        "assignee": input.assignee?.id,
      });

      if (input.media != null) {
        formData.files.add(
          MapEntry(
            "mediaFile",
            await MultipartFile.fromFile(
              input.media!.file.getOrCrash().path,
              contentType: MediaType(
                input.media!.mimeType.contains("video") ? "video" : "image",
                input.media!.mimeType == "video" ? "mp4" : "jpg",
              ),
            ),
          ),
        );
      }

      if (input.audio != null) {
        formData.files.add(
          MapEntry(
            "audioFile",
            await MultipartFile.fromFile(
              input.audio!.file.getOrCrash().path,
              contentType: MediaType("audio", "mp3"),
            ),
          ),
        );
      }

      if (input.thumbnail != null) {
        formData.files.add(
          MapEntry(
            "thumbnail",
            await MultipartFile.fromFile(
              input.thumbnail!,
              contentType: MediaType("image", "jpg"),
            ),
          ),
        );
      }

      final response = await _dio.put(
        '/scenarios/$scenarioId/steps/$stepId',
        data: formData,
        onSendProgress: (count, total) => callback(count, total),
      );

      final result = jsonDecode(response.data);
      return right(StepDto.fromJson(result).toDomain());
    } on DioError catch (err) {
      debugLog(err.response);
      return left(const StepFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    }
  }

  @override
  Future<Either<StepFailure, List<Step>>> getSteps(
    String scenarioId,
  ) async {
    try {
      final response = await _dio.get('/scenarios/$scenarioId/steps');
      final results = jsonDecode(response.data) as List<dynamic>;
      final List<Step> list = [];
      for (final step in results) {
        list.add(StepDto.fromJson(step).toDomain());
      }
      return right(list);
    } on DioError catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    }
  }

  @override
  Future<Either<StepFailure, Unit>> changePosition(
    String scenarioId,
    String stepId,
    int position,
  ) async {
    try {
      await _dio.put(
        '/scenarios/$scenarioId/steps/$stepId/position',
        data: {
          "position": position,
        },
      );
      return right(unit);
    } on DioError catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    }
  }

  @override
  Future<Either<StepFailure, Unit>> toggleLockStep(
    String scenarioId,
    String stepId, {
    required bool isLocked,
  }) async {
    try {
      await _dio.post(
        '/scenarios/$scenarioId/steps/$stepId/lock',
        data: {
          "isLocked": isLocked,
        },
      );
      return right(unit);
    } on DioError catch (err) {
      debugLog(err);
      debugLog(err.response);
      return left(const StepFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    }
  }

  @override
  Future<void> downloadMedia(
    String url,
    String filePath,
    void Function(int, int) callback,
  ) async {
    try {
      await _dio.download(
        url,
        filePath,
        onReceiveProgress: (count, total) => callback(count, total),
      );
    } on DioError catch (err) {
      debugLog(err.response);
      debugLog(err.response!.statusCode);
    }
  }

  @override
  Future<Either<StepFailure, List<StepTask>>> getStepTasks(
    String scenarioId,
  ) async {
    try {
      final response = await _dio.get('/scenarios/$scenarioId/steptasks');
      final results = jsonDecode(response.data) as List<dynamic>;
      final List<StepTask> list = [];
      for (final step in results) {
        list.add(StepTaskDto.fromJson(step).toDomain());
      }
      return right(list);
    } on DioError catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    }
  }

  @override
  Future<Either<StepFailure, List<ScenarioStep>>> getUsersSteps() async {
    try {
      final response = await _dio.get('/me/steps');
      final results = jsonDecode(response.data) as List<dynamic>;
      final List<ScenarioStep> list = [];
      for (final step in results) {
        list.add(ScenarioStepDto.fromJson(step).toDomain());
      }
      return right(list);
    } on DioError catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    }
  }

  @override
  Future<Either<StepFailure, Unit>> toggleLockMultipleSteps(
    String scenarioId,
    List<ToggleStep> list,
  ) async {
    try {
      await _dio.post(
        '/scenarios/$scenarioId/steps/lock',
        data: {
          "inputs": list
              .map((e) => {"stepId": e.id, "isLocked": e.isLocked})
              .toList(),
        },
      );
      return right(unit);
    } on DioError catch (err) {
      debugLog(err);
      debugLog(err.response);
      return left(const StepFailure.unexpected());
    } on SocketException catch (err) {
      debugLog(err);
      return left(const StepFailure.unexpected());
    }
  }
}

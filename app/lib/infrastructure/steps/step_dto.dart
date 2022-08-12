import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/value_objects.dart';
import 'package:vision_director/infrastructure/common/collaborator_dto.dart';
import 'package:vision_director/infrastructure/common/media_dto.dart';
import 'package:vision_director/infrastructure/scenarios/scenario_dto.dart';

part 'step_dto.freezed.dart';
part 'step_dto.g.dart';

/// Dto for communicating with the network or storing them in the cache.
@freezed
class StepDto with _$StepDto {
  const StepDto._();

  const factory StepDto({
    required String id,
    required String name,
    required String createdAt,
    required String updatedAt,
    required int duration,
    required int position,
    required bool isLocked,
    required bool isCompleted,
    required String transition,
    MediaDto? media,
    MediaDto? audio,
    String? annotation,
    String? thumbnail,
    CollaboratorDto? assignee,
  }) = _StepDto;

  Step toDomain() {
    return Step(
      id: id,
      name: StepName(name),
      createdAt: createdAt,
      updatedAt: updatedAt,
      duration: Duration(seconds: duration),
      position: position,
      isLocked: isLocked,
      media: media?.toDomain(),
      audio: audio?.toDomain(),
      annotation: annotation != null ? Annotation(annotation!) : null,
      thumbnail: thumbnail,
      isCompleted: isCompleted,
      transition: StepTransition.values.firstWhere(
        (e) => describeEnum(e).toLowerCase() == transition.toLowerCase(),
      ),
      assignee: assignee?.toDomain(),
    );
  }

  factory StepDto.fromDomain(Step step) {
    return StepDto(
      id: step.id,
      name: step.name.getOrCrash(),
      createdAt: step.createdAt,
      updatedAt: step.updatedAt,
      duration: step.duration.inSeconds,
      position: step.position,
      isLocked: step.isLocked,
      media: step.media != null ? MediaDto.fromDomain(step.media!) : null,
      audio: step.audio != null ? MediaDto.fromDomain(step.audio!) : null,
      annotation: step.annotation?.getOrCrash(),
      thumbnail: step.thumbnail,
      isCompleted: step.isCompleted,
      transition: step.transition.name,
      assignee: step.assignee != null
          ? CollaboratorDto.fromDomain(step.assignee!)
          : null,
    );
  }

  factory StepDto.fromJson(Map<String, dynamic> json) =>
      _$StepDtoFromJson(json);
}

/// Dto for communicating with the network or storing them in the cache.
@freezed
class StepTaskDto with _$StepTaskDto {
  const StepTaskDto._();

  const factory StepTaskDto({
    required String id,
    required String name,
    required String createdAt,
    required String updatedAt,
    required int position,
    required bool isCompleted,
    required int taskCount,
    required int taskCompletedCount,
    CollaboratorDto? assignee,
  }) = _StepTaskDto;

  StepTask toDomain() {
    return StepTask(
      id: id,
      name: StepName(name),
      createdAt: createdAt,
      updatedAt: updatedAt,
      position: position,
      isCompleted: isCompleted,
      taskCount: taskCount,
      taskCompletedCount: taskCompletedCount,
      assignee: assignee?.toDomain(),
    );
  }

  factory StepTaskDto.fromJson(Map<String, dynamic> json) =>
      _$StepTaskDtoFromJson(json);
}

/// Dto for exporting the step.
@freezed
class StepExport with _$StepExport {
  const StepExport._();

  const factory StepExport({
    required String id,
    required String name,
    required int duration,
    required int position,
    required StepTransition transition,
    required String mediaPath,
    String? audioPath,
    String? annotation,
  }) = _StepExport;

  factory StepExport.fromInput(StepInput input, String mediaPath) {
    return StepExport(
      id: input.id,
      name: input.name.getOrCrash(),
      duration: input.duration.inSeconds,
      transition: input.transition ?? StepTransition.none,
      mediaPath: mediaPath,
      position: input.position!,
      audioPath:
          input.audio != null ? input.audio!.file.getOrCrash().path : null,
      annotation: input.annotation?.getOrCrash(),
    );
  }
}

@freezed
class ScenarioStepDto with _$ScenarioStepDto {
  const ScenarioStepDto._();

  const factory ScenarioStepDto({
    required String id,
    required String name,
    required String createdAt,
    required String updatedAt,
    required int duration,
    required ScenarioDto scenario,
    MediaDto? media,
    MediaDto? audio,
    String? annotation,
    String? thumbnail,
  }) = _ScenarioStepDto;

  ScenarioStep toDomain() {
    return ScenarioStep(
      id: id,
      name: StepName(name),
      createdAt: createdAt,
      updatedAt: updatedAt,
      duration: Duration(seconds: duration),
      scenario: scenario.toDomain(),
      media: media?.toDomain(),
      audio: audio?.toDomain(),
      annotation: annotation != null ? Annotation(annotation!) : null,
      thumbnail: thumbnail,
    );
  }

  factory ScenarioStepDto.fromJson(Map<String, dynamic> json) =>
      _$ScenarioStepDtoFromJson(json);
}

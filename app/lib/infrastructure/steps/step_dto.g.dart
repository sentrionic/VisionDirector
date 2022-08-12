// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StepDto _$$_StepDtoFromJson(Map<String, dynamic> json) => _$_StepDto(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      duration: json['duration'] as int,
      position: json['position'] as int,
      isLocked: json['isLocked'] as bool,
      isCompleted: json['isCompleted'] as bool,
      transition: json['transition'] as String,
      media: json['media'] == null
          ? null
          : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
      audio: json['audio'] == null
          ? null
          : MediaDto.fromJson(json['audio'] as Map<String, dynamic>),
      annotation: json['annotation'] as String?,
      thumbnail: json['thumbnail'] as String?,
      assignee: json['assignee'] == null
          ? null
          : CollaboratorDto.fromJson(json['assignee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StepDtoToJson(_$_StepDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'duration': instance.duration,
      'position': instance.position,
      'isLocked': instance.isLocked,
      'isCompleted': instance.isCompleted,
      'transition': instance.transition,
      'media': instance.media,
      'audio': instance.audio,
      'annotation': instance.annotation,
      'thumbnail': instance.thumbnail,
      'assignee': instance.assignee,
    };

_$_StepTaskDto _$$_StepTaskDtoFromJson(Map<String, dynamic> json) =>
    _$_StepTaskDto(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      position: json['position'] as int,
      isCompleted: json['isCompleted'] as bool,
      taskCount: json['taskCount'] as int,
      taskCompletedCount: json['taskCompletedCount'] as int,
      assignee: json['assignee'] == null
          ? null
          : CollaboratorDto.fromJson(json['assignee'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StepTaskDtoToJson(_$_StepTaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'position': instance.position,
      'isCompleted': instance.isCompleted,
      'taskCount': instance.taskCount,
      'taskCompletedCount': instance.taskCompletedCount,
      'assignee': instance.assignee,
    };

_$_ScenarioStepDto _$$_ScenarioStepDtoFromJson(Map<String, dynamic> json) =>
    _$_ScenarioStepDto(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      duration: json['duration'] as int,
      scenario: ScenarioDto.fromJson(json['scenario'] as Map<String, dynamic>),
      media: json['media'] == null
          ? null
          : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
      audio: json['audio'] == null
          ? null
          : MediaDto.fromJson(json['audio'] as Map<String, dynamic>),
      annotation: json['annotation'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$_ScenarioStepDtoToJson(_$_ScenarioStepDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'duration': instance.duration,
      'scenario': instance.scenario,
      'media': instance.media,
      'audio': instance.audio,
      'annotation': instance.annotation,
      'thumbnail': instance.thumbnail,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskDto _$$_TaskDtoFromJson(Map<String, dynamic> json) => _$_TaskDto(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      isCompleted: json['isCompleted'] as bool,
      isMain: json['isMain'] as bool,
      step: json['step'] == null
          ? null
          : StepDto.fromJson(json['step'] as Map<String, dynamic>),
      assignee: json['assignee'] == null
          ? null
          : CollaboratorDto.fromJson(json['assignee'] as Map<String, dynamic>),
      deadline: json['deadline'] as String?,
    );

Map<String, dynamic> _$$_TaskDtoToJson(_$_TaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isCompleted': instance.isCompleted,
      'isMain': instance.isMain,
      'step': instance.step,
      'assignee': instance.assignee,
      'deadline': instance.deadline,
    };

_$_ScenarioTaskDto _$$_ScenarioTaskDtoFromJson(Map<String, dynamic> json) =>
    _$_ScenarioTaskDto(
      task: TaskDto.fromJson(json['task'] as Map<String, dynamic>),
      scenario: ScenarioDto.fromJson(json['scenario'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ScenarioTaskDtoToJson(_$_ScenarioTaskDto instance) =>
    <String, dynamic>{
      'task': instance.task,
      'scenario': instance.scenario,
    };

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/domain/tasks/value_objects.dart';
import 'package:vision_director/infrastructure/common/collaborator_dto.dart';
import 'package:vision_director/infrastructure/scenarios/scenario_dto.dart';
import 'package:vision_director/infrastructure/steps/step_dto.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
class TaskDto with _$TaskDto {
  const TaskDto._();

  const factory TaskDto({
    required String id,
    required String title,
    String? body,
    required String createdAt,
    required String updatedAt,
    required bool isCompleted,
    required bool isMain,
    StepDto? step,
    CollaboratorDto? assignee,
    String? deadline,
  }) = _TaskDto;

  Task toDomain() {
    return Task(
      id: id,
      title: TaskTitle(title),
      body: body == null ? null : TaskBody(body!),
      createdAt: createdAt,
      updatedAt: updatedAt,
      isCompleted: isCompleted,
      isMain: isMain,
      step: step?.toDomain(),
      assignee: assignee?.toDomain(),
      deadline: deadline,
    );
  }

  factory TaskDto.fromDomain(Task task) {
    return TaskDto(
      id: task.id,
      title: task.title.getOrCrash(),
      body: task.body?.getOrCrash(),
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
      isCompleted: task.isCompleted,
      isMain: task.isMain,
      step: task.step != null ? StepDto.fromDomain(task.step!) : null,
      assignee: task.assignee != null
          ? CollaboratorDto.fromDomain(task.assignee!)
          : null,
      deadline: task.deadline,
    );
  }

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);
}

@freezed
class ScenarioTaskDto with _$ScenarioTaskDto {
  const ScenarioTaskDto._();

  const factory ScenarioTaskDto({
    required TaskDto task,
    required ScenarioDto scenario,
  }) = _ScenarioTaskDto;

  ScenarioTask toDomain() {
    return ScenarioTask(
      task: task.toDomain(),
      scenario: scenario.toDomain(),
    );
  }

  factory ScenarioTaskDto.fromJson(Map<String, dynamic> json) =>
      _$ScenarioTaskDtoFromJson(json);
}

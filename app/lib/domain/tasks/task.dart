import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/tasks/value_objects.dart';

part 'task.freezed.dart';

/// [Task] represents the network's task model.
///
/// * [id] is the task's unique id.
/// * [title] is the task's title.
/// * [body] is the task's optional body.
/// * [createdAt] the step's creation date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [updatedAt] the step's update date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [isCompleted] `true` if the task is complete.
/// * [isMain] `true` if the task is the default one created with the step.
/// * [step] is an optional step assigned to this task.
/// * [assignee] is an optional member assigned to this task.
@freezed
class Task with _$Task {
  const Task._();

  const factory Task({
    required String id,
    required TaskTitle title,
    TaskBody? body,
    required String createdAt,
    required String updatedAt,
    required bool isCompleted,
    required bool isMain,
    Step? step,
    Collaborator? assignee,
    String? deadline,
  }) = _Task;
}

/// [ScenarioTask] represents the network's task and its scenario.
///
/// * [task] is the task.
/// * [scenario] is the scenario it belongs to.
@freezed
class ScenarioTask with _$ScenarioTask {
  const ScenarioTask._();

  const factory ScenarioTask({
    required Task task,
    required Scenario scenario,
  }) = _ScenarioTask;
}

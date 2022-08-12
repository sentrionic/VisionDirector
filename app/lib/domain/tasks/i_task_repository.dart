import 'package:dartz/dartz.dart' hide Task;
import 'package:vision_director/domain/common/comment.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/domain/tasks/task_failure.dart';

/// Contains repository calls related to tasks.
abstract class ITaskRepository {
  /// Returns either a list of tasks or a [TaskFailure].
  ///
  /// * [scenarioId] is the scenario whose tasks should be fetched.
  /// * [stepId] is an optional query parameter used to filter tasks by a step.
  /// * [assigneeId] is an optional query parameter used to filter tasks by an assignee.
  Future<Either<TaskFailure, List<Task>>> getTasks({
    required String scenarioId,
    String? stepId,
    String? assigneeId,
    bool? isMain = false,
  });

  /// Creates the task on the network.
  ///
  /// Returns either [unit] on success or a [TaskFailure].
  /// * [scenarioId] is the id of the scenario.
  /// * [title] is the title of the task.
  /// * [body] is the body of the task.
  /// * [stepId] is the optional id of the step this task should be assigned to.
  /// * [assigneeId] is the optional id of the member this task should be assigned to.
  /// * [deadline] is the optional deadline date.
  Future<Either<TaskFailure, Unit>> createTask(
    String scenarioId,
    String title,
    String body,
    String? stepId,
    String? assigneeId,
    DateTime? deadline,
  );

  /// Edits the task with the given [taskId] on the network.
  ///
  /// Returns either the updated [Task] on success or a [TaskFailure].
  /// * [scenarioId] is the id of the scenario.
  /// * [title] is the title of the task.
  /// * [body] is the body of the task.
  /// * [stepId] is the optional id of the step this task should be assigned to.
  /// * [assigneeId] is the optional id of the member this task should be assigned to.
  /// * [isCompleted] `true` if the task should be marked as completed.
  Future<Either<TaskFailure, Task>> editTask(
    String scenarioId,
    String taskId,
    String title,
    String body,
    String? stepId,
    String? assigneeId,
    DateTime? deadline, {
    required bool isCompleted,
  });

  /// Returns either a list of tasks the current user is assigned to or a [TaskFailure].
  Future<Either<TaskFailure, List<ScenarioTask>>> getUsersTasks();

  /// Creates the comment on the network.
  ///
  /// Returns either [unit] on success or a [TaskFailure].
  /// * [scenarioId] is the id of the scenario.
  /// * [taskId] is the id of the task.
  /// * [body] is the body of the task.
  Future<Either<TaskFailure, Unit>> createComment(
    String scenarioId,
    String taskId,
    String body,
  );

  /// Returns either a list of comments or a [TaskFailure].
  ///
  /// * [scenarioId] is the scenario of the task.
  /// * [taskId] is the id of the task whose comments should be fetched.
  Future<Either<TaskFailure, List<Comment>>> getComments(
    String scenarioId,
    String taskId,
  );
}

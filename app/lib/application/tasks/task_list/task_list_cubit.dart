import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/tasks/i_task_repository.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/domain/tasks/task_failure.dart';
import 'package:vision_director/infrastructure/tasks/task_dto.dart';

part 'task_list_state.dart';
part 'task_list_cubit.freezed.dart';

/// [TaskListCubit] manages the current scenario's [Task]s.
@injectable
class TaskListCubit extends HydratedCubit<TaskListState> {
  final ITaskRepository _repository;

  TaskListCubit(this._repository) : super(const TaskListState.initial());

  /// Fetches the tasks for the given [scenarioId].
  ///
  /// Optionally queries by [stepId] and / or [assigneeId]
  ///
  /// Emits [TaskListState.loadSuccess] if successful and [TaskListState.loadFailure] otherwise.
  Future<void> getTasks({
    required String scenarioId,
    String? stepId,
    String? assigneeId,
  }) async {
    emit(const TaskListState.loadInProgress());
    final failureOrTasks = await _repository.getTasks(
      scenarioId: scenarioId,
      stepId: stepId,
      assigneeId: assigneeId,
    );
    emit(
      failureOrTasks.fold(
        (f) => TaskListState.loadFailure(f),
        (tasks) => TaskListState.loadSuccess(tasks, tasks),
      ),
    );
  }

  /// Resets the filter and emits all tasks.
  void resetFilter() {
    state.maybeWhen(
      loadSuccess: (tasks, _) async {
        emit(
          TaskListState.loadSuccess(
            [...tasks],
            [...tasks],
          ),
        );
      },
      orElse: () {},
    );
  }

  /// Only displays tasks that are the main ones.
  void showMain() {
    state.maybeWhen(
      loadSuccess: (tasks, _) async {
        emit(
          TaskListState.loadSuccess(
            [...tasks],
            [...tasks.where((e) => e.isMain).toList()],
          ),
        );
      },
      orElse: () {},
    );
  }

  /// Only displays tasks that are neither completed nor assigned.
  void showTodo() {
    state.maybeWhen(
      loadSuccess: (tasks, _) async {
        emit(
          TaskListState.loadSuccess(
            [...tasks],
            [
              ...tasks
                  .where((e) => !e.isCompleted && e.assignee == null)
                  .toList(),
            ],
          ),
        );
      },
      orElse: () {},
    );
  }

  /// Only displays tasks that are not completed.
  void showInProgress() {
    state.maybeWhen(
      loadSuccess: (tasks, _) async {
        emit(
          TaskListState.loadSuccess(
            [...tasks],
            [
              ...tasks.where((e) => !e.isCompleted).toList(),
            ],
          ),
        );
      },
      orElse: () {},
    );
  }

  /// Only displays tasks that are not the main ones.
  void showNonMain() {
    state.maybeWhen(
      loadSuccess: (tasks, _) async {
        emit(
          TaskListState.loadSuccess(
            [...tasks],
            [
              ...tasks.where((e) => !e.isMain).toList(),
            ],
          ),
        );
      },
      orElse: () {},
    );
  }

  /// Adds the new [task] to the [TaskListState].
  void addTask(Task task) {
    state.maybeWhen(
      loadSuccess: (tasks, _) async {
        emit(TaskListState.loadSuccess([task, ...tasks], [task, ...tasks]));
      },
      orElse: () {},
    );
  }

  /// Updates the given [task] in the list and emits the updated list.
  void updateTask(Task task) {
    state.maybeWhen(
      loadSuccess: (tasks, _) async {
        final data = tasks.map((e) {
          return e.id == task.id ? task : e;
        }).toList();
        emit(TaskListState.loadSuccess(data, data));
      },
      orElse: () {},
    );
  }

  /// Returns a list of tasks that are neither completed nor assigned.
  List<Task> getTodoTasks() {
    return state.maybeMap(
      loadSuccess: (state) => state.tasks
          .where((e) => !e.isCompleted && e.assignee == null)
          .toList(),
      orElse: () => [],
    );
  }

  /// Returns a list of tasks that are not completed, but already assigned.
  List<Task> getInProgressTasks() {
    return state.maybeMap(
      loadSuccess: (state) => state.tasks
          .where((e) => !e.isCompleted && e.assignee != null)
          .toList(),
      orElse: () => [],
    );
  }

  /// Returns a list of tasks that are completed.
  List<Task> getCompletedTasks() {
    return state.maybeMap(
      loadSuccess: (state) => state.tasks.where((e) => e.isCompleted).toList(),
      orElse: () => [],
    );
  }

  @override
  TaskListState? fromJson(Map<String, dynamic> json) {
    final jsonMap = json['tasks'] as List<dynamic>;
    final list = jsonMap.map((e) => TaskDto.fromJson(e).toDomain()).toList();
    return TaskListState.loadSuccess(list, []);
  }

  @override
  Map<String, dynamic>? toJson(TaskListState state) {
    return state.maybeWhen(
      loadSuccess: (tasks, _) =>
          {'tasks': tasks.map((e) => TaskDto.fromDomain(e).toJson()).toList()},
      orElse: () => null,
    );
  }
}

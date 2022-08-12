import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/tasks/i_task_repository.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/domain/tasks/task_failure.dart';

part 'user_tasks_state.dart';
part 'user_tasks_cubit.freezed.dart';

@injectable
class UserTasksCubit extends Cubit<UserTasksState> {
  final ITaskRepository _repository;
  UserTasksCubit(this._repository) : super(const UserTasksState.initial());

  /// Fetches the current user's tasks.
  ///
  /// Emits [UserTasksState.loadSuccess] if successful and [UserTasksState.loadFailure] otherwise.
  Future<void> getUsersTasks() async {
    emit(const UserTasksState.loadInProgress());
    final failureOrTasks = await _repository.getUsersTasks();
    emit(
      failureOrTasks.fold(
        (f) => UserTasksState.loadFailure(f),
        (tasks) => UserTasksState.loadSuccess(tasks, tasks),
      ),
    );
  }

  /// Resets the filter and emits all tasks.
  void resetFilter() {
    state.maybeWhen(
      loadSuccess: (tasks, _) async {
        emit(
          UserTasksState.loadSuccess(
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
          UserTasksState.loadSuccess(
            [...tasks],
            [...tasks.where((e) => e.task.isMain).toList()],
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
          UserTasksState.loadSuccess(
            [...tasks],
            [
              ...tasks.where((e) => !e.task.isCompleted).toList(),
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
          UserTasksState.loadSuccess(
            [...tasks],
            [
              ...tasks.where((e) => !e.task.isMain).toList(),
            ],
          ),
        );
      },
      orElse: () {},
    );
  }
}

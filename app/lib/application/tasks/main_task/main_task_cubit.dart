import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/tasks/i_task_repository.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/domain/tasks/task_failure.dart';

part 'main_task_state.dart';
part 'main_task_cubit.freezed.dart';

@injectable
class MainTaskCubit extends Cubit<MainTaskState> {
  final ITaskRepository _repository;
  MainTaskCubit(this._repository) : super(const MainTaskState.initial());

  /// Fetches the main task related to the given [stepId].
  ///
  /// Emits [MainTaskState.loadSuccess] if successful and [MainTaskState.loadFailure] otherwise.
  Future<void> getMainTask({
    required String scenarioId,
    required String stepId,
  }) async {
    emit(const MainTaskState.loadInProgress());
    final failureOrTasks = await _repository.getTasks(
      scenarioId: scenarioId,
      stepId: stepId,
      isMain: true,
    );
    emit(
      failureOrTasks.fold(
        (f) => MainTaskState.loadFailure(f),
        (tasks) => MainTaskState.loadSuccess(tasks.first),
      ),
    );
  }
}

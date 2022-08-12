import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/tasks/user_tasks/user_tasks_cubit.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/tasks/overview/widgets/task_list_item.dart';

class UserTasksScreen extends StatelessWidget {
  static const routeName = "/user-tasks";
  const UserTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserTasksCubit>()..getUsersTasks(),
      child: const _UserTasksBody(),
    );
  }
}

class _UserTasksBody extends StatelessWidget {
  const _UserTasksBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Tasks"),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.filter_list),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: const Text('All'),
                onTap: () => context.read<UserTasksCubit>().resetFilter(),
              ),
              PopupMenuItem(
                child: const Text('Only Main'),
                onTap: () => context.read<UserTasksCubit>().showMain(),
              ),
              PopupMenuItem(
                child: const Text('In Progress'),
                onTap: () => context.read<UserTasksCubit>().showInProgress(),
              ),
              PopupMenuItem(
                child: const Text('Non Main'),
                onTap: () => context.read<UserTasksCubit>().showNonMain(),
              ),
            ],
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read<UserTasksCubit>().getUsersTasks(),
        child: BlocBuilder<UserTasksCubit, UserTasksState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => Container(),
              loadInProgress: (_) => const CenterLoadingIndicator(),
              loadSuccess: (state) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: state.filteredTasks.isEmpty
                      ? const _EmptyTaskList()
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            final item = state.filteredTasks[index];
                            return TaskListItem(
                              task: item.task,
                              scenario: item.scenario,
                            );
                          },
                          itemCount: state.filteredTasks.length,
                        ),
                );
              },
              loadFailure: (state) => const ErrorIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class _EmptyTaskList extends StatelessWidget {
  const _EmptyTaskList();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Nothing here yet",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

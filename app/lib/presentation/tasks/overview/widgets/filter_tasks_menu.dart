import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/tasks/task_list/task_list_cubit.dart';

class FilterTasksMenu extends StatelessWidget {
  const FilterTasksMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.filter_list),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          child: const Text('All'),
          onTap: () => context.read<TaskListCubit>().resetFilter(),
        ),
        PopupMenuItem(
          child: const Text('Only Main'),
          onTap: () => context.read<TaskListCubit>().showMain(),
        ),
        PopupMenuItem(
          child: const Text('Todo'),
          onTap: () => context.read<TaskListCubit>().showTodo(),
        ),
        PopupMenuItem(
          child: const Text('In Progress'),
          onTap: () => context.read<TaskListCubit>().showInProgress(),
        ),
        PopupMenuItem(
          child: const Text('Non Main'),
          onTap: () => context.read<TaskListCubit>().showNonMain(),
        ),
      ],
    );
  }
}

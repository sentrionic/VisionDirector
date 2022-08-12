import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/domain/projects/project.dart';
import 'package:vision_director/presentation/projects/join_project/join_project_screen.dart';

class JoinProjectFab extends StatelessWidget {
  const JoinProjectFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context)
          .pushNamed(JoinProjectScreen.routeName)
          .then((value) {
        if (value != null) {
          context.read<ProjectListCubit>().addNewProject(value as Project);
        }
      }),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

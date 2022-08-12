import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/projects/overview/widgets/join_project_fab.dart';
import 'package:vision_director/presentation/projects/overview/widgets/project_list_body_widget.dart';

class ProjectScreen extends StatelessWidget {
  static const routeName = '/projects';

  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProjectListCubit>()..getProjects(),
      child: const _ProjectScreenBody(),
    );
  }
}

class _ProjectScreenBody extends StatelessWidget {
  const _ProjectScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Projects"),
      ),
      body: const ProjectListBody(),
      floatingActionButton: const JoinProjectFab(),
    );
  }
}

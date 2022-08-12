import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/projects/overview/widgets/project_list_item.dart';

class ProjectListBody extends StatelessWidget {
  const ProjectListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<ProjectListCubit>().getProjects(),
      child: BlocBuilder<ProjectListCubit, ProjectListState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => const CenterLoadingIndicator(),
            loadSuccess: (state) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: state.projects.isEmpty
                    ? const _EmptyProjectList()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          final project = state.projects[index];
                          return ProjectListItem(project: project);
                        },
                        itemCount: state.projects.length,
                      ),
              );
            },
            loadFailure: (state) => const ErrorIndicator(),
          );
        },
      ),
    );
  }
}

class _EmptyProjectList extends StatelessWidget {
  const _EmptyProjectList();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Nothing here yet.\nJoin a project to start collaborating",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

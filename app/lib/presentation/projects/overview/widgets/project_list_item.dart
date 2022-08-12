import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/domain/projects/project.dart';
import 'package:vision_director/presentation/common/utils/date_utils.dart';
import 'package:vision_director/presentation/common/widgets/card_wrapper.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/screen_arguments/project_argument.dart';
import 'package:vision_director/presentation/scenarios/overview/scenario_screen.dart';

class ProjectListItem extends StatelessWidget {
  final Project project;

  const ProjectListItem({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: InkWell(
        onTap: () {
          context.read<ProjectListCubit>().setCurrentProject(project.id);
          Navigator.of(context).pushNamed(
            ScenarioScreen.routeName,
            arguments: ProjectArgument(project),
          );
        },
        child: _ProjectCard(project: project),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 10,
            color: ThemeColors.themeBlue,
          ),
          const SizedBox(
            width: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.name,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                _getSubtitle(project.scenarioCount),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Started ${getFormattedDate(project.createdAt)}",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getSubtitle(int count) {
    if (count == 0) return "No scenarios yet.";
    if (count == 1) return "1 scenario";
    return "$count scenarios";
  }
}

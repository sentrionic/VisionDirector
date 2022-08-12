import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/presentation/common/widgets/initials_avatar.dart';

/// Widget to assign a project member.
class AssignMemberWidget extends StatelessWidget {
  final String id;
  final Collaborator? assignee;
  const AssignMemberWidget({
    super.key,
    required this.id,
    this.assignee,
  });

  @override
  Widget build(BuildContext context) {
    final collaborators =
        context.read<ProjectListCubit>().getProjectCollaborators();
    return InkWell(
      onTap: () => _displayMemberDialog(
        context,
        collaborators,
        (stepId, assignee) => context
            .read<CreateStepsCubit>()
            .changeAssignedMember(stepId, assignee),
      ),
      child: assignee != null
          ? InitialsAvatar(name: assignee!.username)
          : const AddMemberAvatar(),
    );
  }

  /// Displays a dialog where the user can choose a member to assign to.
  void _displayMemberDialog(
    BuildContext context,
    List<Collaborator> collaborators,
    Function(String stepId, Collaborator assignee) onClick,
  ) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Assign Member'),
        children: collaborators
            .map(
              (c) => SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                  onClick(id, c);
                },
                child: Row(
                  children: [
                    InitialsAvatar(name: c.username),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                      child: Text(
                        c.username,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

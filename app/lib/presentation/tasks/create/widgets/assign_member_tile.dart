import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/presentation/common/widgets/initials_avatar.dart';

/// Widget to assign a member.
///
/// * [assignee] the currently assigned user. If `null` it will display a placeholder.
/// * [onClick] handles the click event to assign the member.
class AssignMemberTile extends StatelessWidget {
  final Collaborator? assignee;
  final Function(Collaborator? assignee) onClick;

  const AssignMemberTile({super.key, required this.onClick, this.assignee});

  @override
  Widget build(BuildContext context) {
    final collaborators =
        context.read<ProjectListCubit>().getProjectCollaborators();
    return ListTile(
      onTap: () => _displayMemberDialog(
        context,
        collaborators,
        (assignee) => onClick(assignee),
      ),
      title: assignee != null
          ? Text(assignee!.username)
          : const Text("Assign Member"),
      leading: assignee != null
          ? InitialsAvatar(name: assignee!.username)
          : const AddMemberAvatar(),
      trailing: assignee != null
          ? IconButton(
              tooltip: "Close",
              onPressed: () => onClick(null),
              icon: const Icon(Icons.close),
            )
          : null,
    );
  }

  /// Displays a dialog where the user can pick a member from the project.
  void _displayMemberDialog(
    BuildContext context,
    List<Collaborator> collaborators,
    Function(Collaborator? step) onClick,
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
                  onClick(c);
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

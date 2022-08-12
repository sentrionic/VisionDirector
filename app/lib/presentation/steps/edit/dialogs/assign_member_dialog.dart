import 'package:flutter/material.dart';

import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/presentation/common/widgets/initials_avatar.dart';

/// Displays a dialog where the user can pick a member from the project.
void showAssignMemberDialog(
  BuildContext context,
  List<Collaborator> collaborators,
  Function(Collaborator? step) onClick,
) {
  showDialog(
    context: context,
    builder: (context) => _AssignMemberDialog(
      collaborators: collaborators,
      onClick: onClick,
    ),
  );
}

class _AssignMemberDialog extends StatelessWidget {
  final List<Collaborator> collaborators;
  final Function(Collaborator? collaborator) onClick;
  const _AssignMemberDialog({
    required this.collaborators,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
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
    );
  }
}

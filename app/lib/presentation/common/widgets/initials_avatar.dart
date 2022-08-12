import 'package:flutter/material.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

/// Displays a [CircleAvatar] with the initials of the given [name].
class InitialsAvatar extends StatelessWidget {
  final String name;
  const InitialsAvatar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ThemeColors.themeBlue,
      child: Text(
        getInitials(name),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

/// Placeholder for assigning a member.
class AddMemberAvatar extends StatelessWidget {
  const AddMemberAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: ThemeColors.themeBlue,
      child: Icon(
        Icons.person_add_alt_1_rounded,
        color: Colors.white,
      ),
    );
  }
}

/// Placeholder for assigning a step.
class AddStepAvatar extends StatelessWidget {
  const AddStepAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: ThemeColors.themeBlue,
      child: Icon(
        Icons.post_add,
        color: Colors.white,
      ),
    );
  }
}

/// Placeholder for assigning a deadline.
class AddDeadlineAvatar extends StatelessWidget {
  const AddDeadlineAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: ThemeColors.themeBlue,
      child: Icon(
        Icons.calendar_today,
        color: Colors.white,
      ),
    );
  }
}

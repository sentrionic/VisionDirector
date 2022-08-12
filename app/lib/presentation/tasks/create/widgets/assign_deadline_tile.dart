import 'package:flutter/material.dart';
import 'package:vision_director/presentation/common/utils/date_utils.dart';
import 'package:vision_director/presentation/common/widgets/initials_avatar.dart';

/// Widget to assign a deadline.
///
/// * [time] the currently set deadline. If `null` it will display a placeholder.
/// * [onClick] handles the click event to assign the deadline.
class AssignDeadlineTile extends StatelessWidget {
  final DateTime? time;
  final Function(DateTime? time) onClick;

  const AssignDeadlineTile({super.key, required this.onClick, this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        final result = await showDatePicker(
          context: context,
          initialDate: time ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
          locale: Localizations.localeOf(context),
        );
        onClick(result);
      },
      title: time != null
          ? Text(getFormattedDate(time!.toIso8601String()))
          : const Text("Set Deadline"),
      leading: const AddDeadlineAvatar(),
      trailing: time != null
          ? IconButton(
              tooltip: "Close",
              onPressed: () => onClick(null),
              icon: const Icon(Icons.close),
            )
          : null,
    );
  }
}

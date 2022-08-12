import 'package:flutter/material.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/tasks/task.dart';
import 'package:vision_director/presentation/common/utils/date_utils.dart';
import 'package:vision_director/presentation/common/widgets/card_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/initials_avatar.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_task_argument.dart';
import 'package:vision_director/presentation/tasks/detail/task_detail_screen.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final Scenario? scenario;
  const TaskListItem({super.key, required this.task, this.scenario});

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed(
          TaskDetailScreen.routeName,
          arguments: ScenarioTaskArgument(scenario, task),
        ),
        // IsComplete Icon
        leading: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(_getIcon(task)),
          ),
        ),
        title: Text(task.title.getOrCrash()),
        // Date + Step
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getTimeAgo(task.createdAt),
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 5,
            ),
            if (task.deadline != null)
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Deadline: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: getFormattedDate(task.deadline!),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              )
            else
              const Text(
                "No Deadline",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
          ],
        ),
        // Assigned member
        trailing: task.assignee != null
            ? InitialsAvatar(name: task.assignee!.username)
            : const AddMemberAvatar(),
      ),
    );
  }

  IconData _getIcon(Task task) {
    if (task.isMain) return Icons.star_border;
    if (task.isCompleted) return Icons.done;
    return Icons.history_toggle_off_outlined;
  }
}

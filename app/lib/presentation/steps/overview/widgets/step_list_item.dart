import 'package:flutter/material.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';

import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/widgets/card_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/initials_avatar.dart';
import 'package:vision_director/presentation/core/screen_arguments/steptask_argument.dart';
import 'package:vision_director/presentation/steps/overview/step_task_detail_screen.dart';

class StepTaskListItem extends StatelessWidget {
  final StepTask stepTask;
  final Scenario scenario;
  const StepTaskListItem({
    super.key,
    required this.stepTask,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: ListTile(
        onTap: () => Navigator.of(context).pushNamed(
          StepTaskDetailScreen.routeName,
          arguments: StepTaskArgument(scenario, stepTask),
        ),
        leading: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              stepTask.isCompleted
                  ? Icons.done
                  : Icons.history_toggle_off_outlined,
            ),
          ),
        ),
        title: Text("${stepTask.position + 1}. ${stepTask.name.getOrCrash()}"),
        subtitle: Text(
          stepTask.taskCount == 0
              ? "No existing tasks"
              : "${stepTask.taskCompletedCount}/${stepTask.taskCount} tasks completed",
        ),
        trailing: stepTask.assignee != null
            ? InitialsAvatar(
                name: stepTask.assignee!.username,
              )
            : const AddMemberAvatar(),
      ),
    );
  }
}

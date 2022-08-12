import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vision_director/domain/auth/account.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/modal_button.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_argument.dart';
import 'package:vision_director/presentation/steps/export/export/export_screen.dart';
import 'package:vision_director/presentation/steps/info/scenario_info_screen.dart';
import 'package:vision_director/presentation/steps/overview/step_tasks_screen.dart';
import 'package:vision_director/presentation/steps/preview/scenario_preview_screen.dart';
import 'package:vision_director/presentation/steps/settings/manage_steps_screen.dart';
import 'package:vision_director/presentation/steps/settings/scenario_settings_screen.dart';
import 'package:vision_director/presentation/steps/template/create_template_screen.dart';
import 'package:vision_director/presentation/tasks/overview/task_screen.dart';

/// Displays a BottomSheet with various options.
class EditorBottomSheet extends StatelessWidget {
  final Scenario scenario;
  final Account account;
  final Function onRefresh;
  const EditorBottomSheet({
    super.key,
    required this.scenario,
    required this.onRefresh,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  scenario.name.getOrCrash(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SpacedDivider(),
                // Go to the overview screen
                ModalButton(
                  label: "Overview",
                  icon: Icons.view_list,
                  onClick: () => Navigator.of(context).pushNamed(
                    StepTasksScreen.routeName,
                    arguments: ScenarioArgument(scenario),
                  ),
                ),
                // Go to the tasks screen
                ModalButton(
                  label: "Tasks",
                  icon: Icons.task,
                  onClick: () => Navigator.of(context).pushNamed(
                    TaskScreen.routeName,
                    arguments: ScenarioArgument(scenario),
                  ),
                ),
                // Go to the scenario info screen
                ModalButton(
                  label: "Wiki",
                  icon: Icons.info,
                  onClick: () => Navigator.of(context).pushNamed(
                    ScenarioInfoScreen.routeName,
                    arguments: ScenarioArgument(scenario),
                  ),
                ),
                // Go to the preview screen
                ModalButton(
                  label: "Preview",
                  icon: Icons.preview,
                  onClick: () => Navigator.of(context).pushNamed(
                    ScenarioPreviewScreen.routeName,
                  ),
                ),
                // Go to the export screen
                ModalButton(
                  label: "Produce",
                  icon: Icons.movie_creation,
                  onClick: () => Navigator.of(context).pushNamed(
                    ExportScreen.routeName,
                    arguments: ScenarioArgument(scenario),
                  ),
                ),
                // Get the steps from the network
                ModalButton(
                  label: "Reload Steps",
                  icon: Icons.refresh,
                  onClick: () {
                    Navigator.of(context).pop();
                    onRefresh();
                  },
                ),
                const SpacedDivider(),
                if (account.role == Roles.moderator) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: InfoLabel(label: "Staff Only"),
                  ),
                  ModalButton(
                    label: "Set Template",
                    icon: Icons.file_copy,
                    onClick: () => Navigator.of(context).pushNamed(
                      CreateTemplateScreen.routeName,
                      arguments: ScenarioArgument(scenario),
                    ),
                  ),
                  const SpacedDivider(),
                ],
                if (scenario.isOwner) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: InfoLabel(label: "Owner Only"),
                  ),
                  // Go to the settings screen
                  ModalButton(
                    label: "Settings",
                    icon: Icons.settings,
                    onClick: () => Navigator.of(context).pushNamed(
                      ScenarioSettingsScreen.routeName,
                      arguments: ScenarioArgument(scenario),
                    ),
                  ),
                  ModalButton(
                    label: "Manage Steps",
                    icon: Icons.format_list_numbered,
                    onClick: () => Navigator.of(context).pushNamed(
                      ManageStepsScreen.routeName,
                      arguments: ScenarioArgument(scenario),
                    ),
                  ),
                  const SpacedDivider(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

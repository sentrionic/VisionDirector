import 'package:flutter/material.dart' hide Step;
import 'package:vision_director/presentation/auth/login/login_screen.dart';
import 'package:vision_director/presentation/auth/register/register_screen.dart';
import 'package:vision_director/presentation/auth/start_up_screen.dart';
import 'package:vision_director/presentation/common/step_widgets/guidelines_screen.dart';
import 'package:vision_director/presentation/core/screen_arguments/account_argument.dart';
import 'package:vision_director/presentation/core/screen_arguments/project_argument.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_argument.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_step_argument.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_task_argument.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_video_argument.dart';
import 'package:vision_director/presentation/core/screen_arguments/step_argument.dart';
import 'package:vision_director/presentation/core/screen_arguments/steptask_argument.dart';
import 'package:vision_director/presentation/core/screen_arguments/task_argument.dart';
import 'package:vision_director/presentation/core/screen_transitions/fade_transition_route.dart';
import 'package:vision_director/presentation/core/screen_transitions/slide_transition_route.dart';
import 'package:vision_director/presentation/home/home_screen.dart';
import 'package:vision_director/presentation/home/screens/change_password_screen.dart';
import 'package:vision_director/presentation/home/screens/privacy_screen.dart';
import 'package:vision_director/presentation/home/screens/tutorials_screen.dart';
import 'package:vision_director/presentation/home/screens/update_account_screen.dart';
import 'package:vision_director/presentation/home/screens/user_steps_screen.dart';
import 'package:vision_director/presentation/home/screens/user_tasks_screen.dart';
import 'package:vision_director/presentation/home/screens/vision_video_screen.dart';
import 'package:vision_director/presentation/projects/join_project/join_project_screen.dart';
import 'package:vision_director/presentation/projects/overview/project_screen.dart';
import 'package:vision_director/presentation/scenarios/create/create_scenario_screen.dart';
import 'package:vision_director/presentation/scenarios/overview/scenario_screen.dart';
import 'package:vision_director/presentation/scenarios/wizard/scenario_wizard_screen.dart';
import 'package:vision_director/presentation/splash/splash_page.dart';
import 'package:vision_director/presentation/steps/create/create_step_screen.dart';
import 'package:vision_director/presentation/steps/edit/dialogs/main_task_screen.dart';
import 'package:vision_director/presentation/steps/edit/edit_step_screen.dart';
import 'package:vision_director/presentation/steps/editor/editor_screen.dart';
import 'package:vision_director/presentation/steps/export/export/export_screen.dart';
import 'package:vision_director/presentation/steps/export/upload/upload_video_screen.dart';
import 'package:vision_director/presentation/steps/info/scenario_info_screen.dart';
import 'package:vision_director/presentation/steps/overview/step_task_detail_screen.dart';
import 'package:vision_director/presentation/steps/overview/step_tasks_screen.dart';
import 'package:vision_director/presentation/steps/preview/scenario_preview_screen.dart';
import 'package:vision_director/presentation/steps/settings/manage_steps_screen.dart';
import 'package:vision_director/presentation/steps/settings/scenario_settings_screen.dart';
import 'package:vision_director/presentation/steps/template/create_template_screen.dart';
import 'package:vision_director/presentation/tasks/create/create_task_screen.dart';
import 'package:vision_director/presentation/tasks/detail/task_detail_screen.dart';
import 'package:vision_director/presentation/tasks/detail/widgets/create_comment_screen.dart';
import 'package:vision_director/presentation/tasks/edit/edit_task_screen.dart';
import 'package:vision_director/presentation/tasks/kanban/kanban_screen.dart';
import 'package:vision_director/presentation/tasks/overview/task_screen.dart';

/// Application Router containing all possible routes.
class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return FadeTransitionRoute(
          page: const SplashPage(),
        );

      case StartUpScreen.routeName:
        return FadeTransitionRoute(
          page: const StartUpScreen(),
        );

      case LoginScreen.routeName:
        return SlideTransitionRoute(
          page: const LoginScreen(),
        );

      case RegisterScreen.routeName:
        return SlideTransitionRoute(
          page: const RegisterScreen(),
        );

      case HomeScreen.routeName:
        return FadeTransitionRoute(
          page: const HomeScreen(),
        );

      case UpdateAccountScreen.routeName:
        final AccountArgument args = settings.arguments! as AccountArgument;
        return FadeTransitionRoute(
          page: UpdateAccountScreen(account: args.account),
        );

      case ChangePasswordScreen.routeName:
        return FadeTransitionRoute(
          page: const ChangePasswordScreen(),
        );

      case ProjectScreen.routeName:
        return FadeTransitionRoute(
          page: const ProjectScreen(),
        );

      case JoinProjectScreen.routeName:
        return FadeTransitionRoute(
          page: const JoinProjectScreen(),
        );

      case PrivacyScreen.routeName:
        return FadeTransitionRoute(
          page: const PrivacyScreen(),
        );

      case ScenarioScreen.routeName:
        final ProjectArgument args = settings.arguments! as ProjectArgument;
        return FadeTransitionRoute(
          page: ScenarioScreen(project: args.project),
        );

      case CreateScenarioScreen.routeName:
        final ProjectArgument args = settings.arguments! as ProjectArgument;
        return FadeTransitionRoute(
          page: CreateScenarioScreen(
            projectId: args.project.id,
          ),
        );

      case ScenarioWizardScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: ScenarioWizardScreen(
            scenario: args.scenario,
          ),
        );

      case EditorScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: EditorScreen(
            scenario: args.scenario,
          ),
        );

      case EditStepScreen.routeName:
        final StepArgument args = settings.arguments! as StepArgument;
        return FadeTransitionRoute(
          page: EditStepScreen(
            step: args.step,
          ),
        );

      case StepTasksScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: StepTasksScreen(
            scenario: args.scenario,
          ),
        );

      case StepTaskDetailScreen.routeName:
        final StepTaskArgument args = settings.arguments! as StepTaskArgument;
        return FadeTransitionRoute(
          page: StepTaskDetailScreen(
            scenario: args.scenario,
            stepTask: args.stepTask,
          ),
        );

      case TaskScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: TaskScreen(
            scenario: args.scenario,
          ),
        );

      case CreateTaskScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: CreateTaskScreen(
            scenarioId: args.scenario.id,
          ),
        );

      case KanbanScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: KanbanScreen(
            scenario: args.scenario,
          ),
        );

      case TaskDetailScreen.routeName:
        final ScenarioTaskArgument args =
            settings.arguments! as ScenarioTaskArgument;
        return FadeTransitionRoute(
          page: TaskDetailScreen(
            task: args.task,
            scenario: args.scenario,
          ),
        );

      case CreateCommentScreen.routeName:
        final ScenarioTaskArgument args =
            settings.arguments! as ScenarioTaskArgument;
        return SlideTransitionRoute(
          page: CreateCommentScreen(
            task: args.task,
            scenario: args.scenario!,
          ),
        );

      case EditTaskScreen.routeName:
        final TaskArgument args = settings.arguments! as TaskArgument;
        return FadeTransitionRoute(
          page: EditTaskScreen(
            task: args.task,
          ),
        );

      case ScenarioInfoScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: ScenarioInfoScreen(
            scenario: args.scenario,
          ),
        );

      case ScenarioSettingsScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: ScenarioSettingsScreen(
            scenario: args.scenario,
          ),
        );

      case CreateStepScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: CreateStepScreen(
            scenario: args.scenario,
          ),
        );

      case CreateTemplateScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: CreateTemplateScreen(
            scenario: args.scenario,
          ),
        );

      case ScenarioPreviewScreen.routeName:
        return FadeTransitionRoute(
          page: const ScenarioPreviewScreen(),
        );

      case ExportScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: ExportScreen(
            scenario: args.scenario,
          ),
        );

      case UploadVideoScreen.routeName:
        final ScenarioVideoArgument args =
            settings.arguments! as ScenarioVideoArgument;
        return FadeTransitionRoute(
          page: UploadVideoScreen(
            scenario: args.scenario,
            video: args.video,
          ),
        );

      case GuidelinesScreen.routeName:
        return FadeTransitionRoute(
          page: const GuidelinesScreen(),
        );

      case MainTaskScreen.routeName:
        final ScenarioStepArgument args =
            settings.arguments! as ScenarioStepArgument;
        return FadeTransitionRoute(
          page: MainTaskScreen(
            scenario: args.scenario,
            step: args.step,
          ),
        );

      case UserTasksScreen.routeName:
        return FadeTransitionRoute(
          page: const UserTasksScreen(),
        );

      case UserStepsScreen.routeName:
        return FadeTransitionRoute(
          page: const UserStepsScreen(),
        );

      case ManageStepsScreen.routeName:
        final ScenarioArgument args = settings.arguments! as ScenarioArgument;
        return FadeTransitionRoute(
          page: ManageStepsScreen(
            scenario: args.scenario,
          ),
        );

      case VisionVideoScreen.routeName:
        return FadeTransitionRoute(
          page: const VisionVideoScreen(),
        );

      case TutorialsScreen.routeName:
        return FadeTransitionRoute(
          page: const TutorialsScreen(),
        );

      default:
        return FadeTransitionRoute(
          page: const SplashPage(),
        );
    }
  }
}

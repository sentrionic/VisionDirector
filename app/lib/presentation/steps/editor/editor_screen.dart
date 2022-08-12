import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:vision_director/application/auth/get_account/get_account_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/steps/current_step_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/utils/setup_hive.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/common/widgets/show_confirmation_dialog.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/steps/editor/editor_layout.dart';
import 'package:vision_director/presentation/steps/editor/editor_onboarding_screen.dart';
import 'package:vision_director/presentation/steps/editor/layout/widgets/editor_bottom_sheet.dart';

class EditorScreen extends HookWidget {
  static const routeName = '/editor';

  final Scenario scenario;
  const EditorScreen({
    super.key,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    final box = Hive.box(HiveBoxes.onboardingBox);
    final boxValue = box.get(HiveBoxes.onboardingTimeline) as bool?;
    final showOnboarding = useState(boxValue ?? true);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<StepListCubit>()..getSteps(scenario.id),
        ),
        BlocProvider(create: (_) => CurrentStepCubit()),
        BlocProvider(create: (_) => getIt<ScenarioListCubit>()),
        BlocProvider(create: (_) => getIt<GetAccountCubit>()),
      ],
      child: showOnboarding.value
          ? EditorOnboardingScreen(
              toggleShow: () => showOnboarding.value = false,
            )
          : Scaffold(
              appBar: _AppBar(
                scenario: scenario,
              ),
              body: BlocBuilder<StepListCubit, StepListState>(
                builder: (context, state) => state.map(
                  initial: (_) => Container(),
                  loadInProgress: (_) => const CenterLoadingIndicator(),
                  loadSuccess: (state) =>
                      EditorLayout(scenario: scenario, steps: state.steps),
                  loadFailure: (_) => const ErrorIndicator(),
                ),
              ),
            ),
    );
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  final Scenario scenario;
  const _AppBar({required this.scenario});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.appBackground,
      title: Text(scenario.name.getOrCrash()),
      leading: IconButton(
        tooltip: "Close",
        icon: const Icon(Icons.close),
        onPressed: () => showConfirmationDialog(
          context,
          title: "Quit Editor",
          body: "Are you sure you want to quit?",
          buttonPrompt: "Quit",
          buttonColor: ThemeColors.themeBlue,
          onSubmit: () {
            // Close dialog and pop back
            int count = 0;
            Navigator.of(context).popUntil((_) => count++ >= 2);
          },
        ),
      ),
      actions: [
        IconButton(
          tooltip: "Menu",
          onPressed: () => showMaterialModalBottomSheet(
            context: context,
            backgroundColor: ThemeColors.appBackground,
            builder: (_) => EditorBottomSheet(
              scenario: scenario,
              account: context.read<GetAccountCubit>().state,
              onRefresh: () =>
                  context.read<StepListCubit>().getSteps(scenario.id),
            ),
          ),
          icon: const Icon(
            Icons.more_vert,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

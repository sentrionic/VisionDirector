import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/scenarios/preview_scenario/preview_scenario_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/steps/current_step_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/utils/setup_hive.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';
import 'package:vision_director/presentation/steps/preview/preview_onboarding_screen.dart';
import 'package:vision_director/presentation/steps/preview/widgets/scenario_preview_form.dart';

class ScenarioPreviewScreen extends HookWidget {
  static const routeName = '/scenario-preview';

  const ScenarioPreviewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final box = Hive.box(HiveBoxes.onboardingBox);
    final boxValue = box.get(HiveBoxes.onboardingPreview) as bool?;
    final showOnboarding = useState(boxValue ?? true);

    return MultiBlocProvider(
      providers: [
        // Used for previewing the steps.
        BlocProvider(create: (_) => getIt<StepListCubit>()),
        // Used for getting the project and its members.
        BlocProvider(create: (_) => getIt<ProjectListCubit>()),
        // Used for getting the current scenario.
        BlocProvider(create: (_) => getIt<ScenarioListCubit>()),
        // Used for managing the preview.
        BlocProvider(create: (_) => getIt<PreviewScenarioCubit>()),
        // Used for setting the currently active step.
        BlocProvider(
          create: (_) =>
              CurrentStepPreviewCubit()..setCurrent(l10n.labelTitleStep),
        ),
      ],
      child: showOnboarding.value
          ? PreviewOnboardingScreen(
              toggleShow: () => showOnboarding.value = false,
            )
          : const ScenarioPreviewForm(),
    );
  }
}

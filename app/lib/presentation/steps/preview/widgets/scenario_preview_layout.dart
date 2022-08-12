import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/current_step_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';
import 'package:vision_director/presentation/steps/preview/widgets/preview_controls.dart';
import 'package:vision_director/presentation/steps/preview/widgets/preview_header.dart';
import 'package:vision_director/presentation/steps/preview/widgets/preview_player.dart';
import 'package:vision_director/presentation/steps/preview/widgets/preview_step_list.dart';
import 'package:vision_director/presentation/steps/preview/widgets/previews/credits_preview.dart';
import 'package:vision_director/presentation/steps/preview/widgets/previews/title_preview.dart';

class PreviewLayout extends StatelessWidget {
  final Scenario scenario;
  final List<Step> steps;
  const PreviewLayout({super.key, required this.scenario, required this.steps});

  @override
  Widget build(BuildContext context) {
    final id = context.watch<CurrentStepPreviewCubit>().state;
    final current = context.read<StepListCubit>().getCurrentStep(id);

    return Column(
      children: [
        PreviewHeader(
          title: current == null
              ? id
              : "${current.position + 1}. ${current.name.getOrCrash()}",
          key: UniqueKey(),
        ),
        buildPreview(context, id, current),
        PreviewControls(
          steps: steps,
        ),
        PreviewStepList(
          steps: steps,
        ),
      ],
    );
  }

  // Return the preview player based on the current id.
  Widget buildPreview(BuildContext context, String id, Step? current) {
    final l10n = context.l10n;
    if (id == l10n.labelTitleStep) {
      return const TitlePreview();
    } else if (id == l10n.labelCreditsStep) {
      return const CreditsPreview();
    } else {
      return PreviewPlayer(current: current, key: UniqueKey());
    }
  }
}

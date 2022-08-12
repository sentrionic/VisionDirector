import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/scenarios/export_scenario/export_scenario/export_scenario_cubit.dart';
import 'package:vision_director/application/scenarios/export_scenario/setup_export/setup_export_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_video_argument.dart';
import 'package:vision_director/presentation/steps/export/export/widgets/download_media_progress.dart';
import 'package:vision_director/presentation/steps/export/export/widgets/export_video_form.dart';
import 'package:vision_director/presentation/steps/export/upload/upload_video_screen.dart';
import 'package:wakelock/wakelock.dart';

class ExportScreenBody extends HookWidget {
  final Scenario scenario;
  const ExportScreenBody({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    final steps = context.read<StepListCubit>().getStepList();

    // Run the download process on first build only.
    useEffect(
      () {
        context.read<SetupExportCubit>().downloadMedia(steps);
        // Keep screen from sleeping
        Wakelock.enable();
        return null;
      },
      [steps],
    );
    return BlocListener<ExportScenarioCubit, ExportScenarioState>(
      listenWhen: (p, c) => p.isCompleted != c.isCompleted,
      listener: (context, state) {
        // Navigate to the [UploadVideoScreen] once the export is complete
        Wakelock.disable();
        Navigator.of(context).pushReplacementNamed(
          UploadVideoScreen.routeName,
          arguments: ScenarioVideoArgument(scenario, state.video!),
        );
      },
      child: BlocBuilder<SetupExportCubit, SetupExportState>(
        builder: (context, state) {
          return state.isCompleted
              ? ExportVideoForm(steps: state.steps)
              : DownloadMediaProgress(
                  count: state.downloadCount,
                  totalCount: state.totalCount,
                  progress: state.downloadProgress,
                );
        },
      ),
    );
  }
}

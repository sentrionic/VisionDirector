import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/scenarios/export_scenario/export_scenario/export_scenario_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';

/// [useEffect] to start the export process.
void useExportScenarioHook(BuildContext context, List<StepInput> steps) {
  // Run the export process on first build only.
  useEffect(
    () {
      final project = context.read<ProjectListCubit>().getCurrentProject();
      final scenario = context.read<ScenarioListCubit>().getCurrentScenario();
      final collaborators =
          context.read<ProjectListCubit>().getProjectCollaborators();

      // Create the temp directory before starting the export.
      context.read<ExportScenarioCubit>().initialize().then((_) {
        context.read<ExportScenarioCubit>().exportVideos(
              project!.name,
              scenario!.name.getOrCrash(),
              steps,
              collaborators,
            );
      });
      return null;
    },
    [],
  );
}

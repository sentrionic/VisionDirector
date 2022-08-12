import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/presentation/common/widgets/player_wrapper.dart';

/// Displays a preview of how the automatically generated title will look like in the final video.
class TitlePreview extends StatelessWidget {
  const TitlePreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final project = context.read<ProjectListCubit>().getCurrentProject();
    final scenario = context.read<ScenarioListCubit>().getCurrentScenario();
    return PlayerWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            project?.name ?? "",
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            scenario?.name.getOrCrash() ?? "",
            style: const TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

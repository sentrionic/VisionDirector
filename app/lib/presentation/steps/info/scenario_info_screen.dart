import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class ScenarioInfoScreen extends StatelessWidget {
  static const routeName = '/scenario-info';

  final Scenario scenario;
  const ScenarioInfoScreen({
    super.key,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ScenarioListCubit>(),
      child: const _ScenarioInfoScreen(),
    );
  }
}

class _ScenarioInfoScreen extends StatelessWidget {
  const _ScenarioInfoScreen();

  @override
  Widget build(BuildContext context) {
    final scenario = context.read<ScenarioListCubit>().getCurrentScenario();

    if (scenario == null) return Container();

    return Scaffold(
      appBar: AppBar(
        title: Text(scenario.name.getOrCrash()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Chip(
                label: Text(
                  _getProjectStatus(scenario.status),
                ),
              ),
              const SpacedDivider(),
              // Display the description in Markdown
              if (scenario.description != null) ...[
                const InfoLabel(label: "Additional Information"),
                const SizedBox(
                  height: 10,
                ),
                ColoredBox(
                  color: ThemeColors.inputBackground,
                  child: Markdown(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    selectable: true,
                    data: scenario.description!.getOrCrash(),
                  ),
                )
              ] else
                const Text(
                  "Nothing here",
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getProjectStatus(Status status) {
    switch (status) {
      case Status.inProgress:
        return "In Progress";
      case Status.inReview:
        return "In Review";
      case Status.finished:
        return "Complete";
    }
  }
}

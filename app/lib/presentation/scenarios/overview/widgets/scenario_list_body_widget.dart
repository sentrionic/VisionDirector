import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/scenarios/overview/widgets/scenario_list_item.dart';

class ScenarioListBody extends StatelessWidget {
  final String projectId;
  const ScenarioListBody({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          context.read<ScenarioListCubit>().getScenarios(projectId),
      child: BlocBuilder<ScenarioListCubit, ScenarioListState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => const CenterLoadingIndicator(),
            loadSuccess: (state) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: state.scenarios.isEmpty
                    ? const _EmptyScenarioList()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          final scenario = state.scenarios[index];
                          return ScenarioListItem(scenario: scenario);
                        },
                        itemCount: state.scenarios.length,
                      ),
              );
            },
            loadFailure: (state) => const ErrorIndicator(),
          );
        },
      ),
    );
  }
}

class _EmptyScenarioList extends StatelessWidget {
  const _EmptyScenarioList();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          "No scenarios here yet.\nStart collaborating by creating one.",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

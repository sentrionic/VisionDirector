import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/scenarios/export_scenario/export_scenario/export_scenario_cubit.dart';
import 'package:vision_director/domain/common/export_status.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/steps/export/export/widgets/export_scenario_hook.dart';

class ExportVideoForm extends HookWidget {
  final List<StepInput> steps;

  const ExportVideoForm({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    useExportScenarioHook(context, steps);
    return BlocBuilder<ExportScenarioCubit, ExportScenarioState>(
      buildWhen: (p, c) =>
          p.totalCount != c.totalCount ||
          p.count != c.count ||
          p.status != c.status,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                SizedBox(
                  height: kToolbarHeight,
                ),
                Text(
                  "Exporting",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _getProcessString(state.status),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200.0,
                  child: _buildProgressIndicator(state),
                ),
                const Text(
                  "Please wait.\nThis might take some time.",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: kToolbarHeight,
            ),
          ],
        );
      },
    );
  }

  /// Returns the currently ongoing export status.
  String _getProcessString(ExportStatus status) {
    switch (status) {
      case ExportStatus.generateVideos:
        return "1. Generating Videos";
      case ExportStatus.concat:
        return "2. Concatinating Videos";
      case ExportStatus.done:
        return "3. Video Created";
    }
  }

  Widget _buildProgressIndicator(ExportScenarioState state) {
    switch (state.status) {
      case ExportStatus.generateVideos:
        return _GeneratingVideosProgress(
          progress: state.count,
          total: state.totalCount,
        );
      case ExportStatus.concat:
        return const Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              strokeWidth: 15,
            ),
          ),
        );
      case ExportStatus.done:
        return Container();
    }
  }
}

class _GeneratingVideosProgress extends StatelessWidget {
  final int progress;
  final int total;
  const _GeneratingVideosProgress({
    required this.progress,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              strokeWidth: 15,
              value: progress / total,
            ),
          ),
        ),
        Center(
          child: Text(
            "${progress + 1} out of $total",
          ),
        ),
      ],
    );
  }
}

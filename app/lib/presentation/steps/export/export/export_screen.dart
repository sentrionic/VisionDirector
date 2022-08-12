import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/application/scenarios/export_scenario/export_scenario/export_scenario_cubit.dart';
import 'package:vision_director/application/scenarios/export_scenario/setup_export/setup_export_cubit.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/long_button.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/steps/export/export/widgets/export_screen_body.dart';

class ExportScreen extends StatelessWidget {
  static const routeName = '/export';

  final Scenario scenario;
  const ExportScreen({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for getting all the steps to export.
        BlocProvider(create: (_) => getIt<StepListCubit>()),
        // Used for the downloading all remote files.
        BlocProvider(create: (_) => getIt<SetupExportCubit>()),
        // Used for getting the current scenario.
        BlocProvider(create: (_) => getIt<ScenarioListCubit>()),
        // Used for getting the current project and its members.
        BlocProvider(create: (_) => getIt<ProjectListCubit>()),
        // Used for creating the vision video.
        BlocProvider(create: (_) => getIt<ExportScenarioCubit>()),
      ],
      child: _ExportForm(scenario: scenario),
    );
  }
}

class _ExportForm extends HookWidget {
  final Scenario scenario;
  const _ExportForm({required this.scenario});

  @override
  Widget build(BuildContext context) {
    final startExport = useState(false);
    return startExport.value
        ? Scaffold(
            body: ExportScreenBody(
              scenario: scenario,
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text("Export Video"),
            ),
            body: BlocBuilder<ExportScenarioCubit, ExportScenarioState>(
              builder: (context, state) {
                return FormWrapper(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const InfoLabel(label: "Export Settings"),
                    ListTile(
                      trailing: Switch(
                        value: state.addName,
                        onChanged: (value) => context
                            .read<ExportScenarioCubit>()
                            .toggleAddNames(),
                        activeColor: ThemeColors.themeBlue,
                      ),
                      title: const Text("Add step name to each scene"),
                      contentPadding: EdgeInsets.zero,
                      enableFeedback: false,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const InfoLabel(label: "Resolution"),
                    const SizedBox(
                      height: 5,
                    ),
                    DropdownButtonFormField(
                      items: const [
                        DropdownMenuItem(
                          value: ExportResolution.hd,
                          child: Text("720p (recommended)"),
                        ),
                        DropdownMenuItem(
                          value: ExportResolution.fhd,
                          child: Text("1080p"),
                        ),
                      ],
                      value: state.resolution,
                      onChanged: (value) => context
                          .read<ExportScenarioCubit>()
                          .setExportResolution(value! as ExportResolution),
                    ),
                    if (state.resolution == ExportResolution.fhd)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Warning:",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    " Exporting using this resolution will take significantly longer.",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    LongButton(
                      onClick: () => startExport.value = true,
                      label: "Start Export",
                    ),
                  ],
                );
              },
            ),
          );
  }
}

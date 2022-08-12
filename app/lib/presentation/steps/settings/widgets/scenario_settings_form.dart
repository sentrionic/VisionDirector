import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:vision_director/application/scenarios/edit_scenario/edit_scenario_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/markdown_editor.dart';
import 'package:vision_director/presentation/common/widgets/saving_progress_overlay.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';

class ScenarioSettingsForm extends HookWidget {
  final Scenario scenario;
  const ScenarioSettingsForm({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final nameController =
        useTextEditingController(text: scenario.name.getOrCrash());
    final descriptionController = useTextEditingController(
      text: scenario.description?.getValue() ?? "",
    );

    // Toggle markdown
    final showPreview = useState(false);
    return BlocConsumer<EditScenarioCubit, EditScenarioState>(
      listener: (context, state) {
        state.scenarioFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  orElse: () => l10n.serverError,
                ),
              ).show(context);
            },
            (_) {
              buildSuccesFlushbar(message: "Successfully updated the scenario")
                  .show(context);
            },
          ),
        );
      },
      builder: (context, state) => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text("Settings"),
              actions: [
                IconButton(
                  tooltip: "Save",
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context
                        .read<EditScenarioCubit>()
                        .submitEditScenario(scenario.id);
                  },
                  icon: const Icon(Icons.save),
                ),
              ],
            ),
            bottomSheet: MarkdownEditor(controller: descriptionController),
            body: Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: FormWrapper(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const InfoLabel(label: "General Settings"),
                  const SizedBox(
                    height: 5,
                  ),
                  // Edit Name
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    controller: nameController,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) =>
                        context.read<EditScenarioCubit>().nameChanged(value),
                    validator: (_) =>
                        context.read<EditScenarioCubit>().state.name.value.fold(
                              (f) => f.maybeMap(
                                empty: (_) => "Name must not be empty",
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const InfoLabel(label: "Scenario Status"),
                  const SizedBox(
                    height: 5,
                  ),
                  // Edit Status
                  DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        value: Status.inProgress,
                        child: Text("In Progress"),
                      ),
                      DropdownMenuItem(
                        value: Status.inReview,
                        child: Text("In Review"),
                      ),
                      DropdownMenuItem(
                        value: Status.finished,
                        child: Text("Completed"),
                      ),
                    ],
                    value: state.status,
                    onChanged: (value) => context
                        .read<EditScenarioCubit>()
                        .statusChanged(value! as Status),
                  ),
                  const SpacedDivider(),
                  const SizedBox(
                    height: 10,
                  ),
                  const InfoLabel(label: "Additional Information"),
                  // Toggle Preview
                  SwitchListTile(
                    title: const Text("Preview"),
                    value: showPreview.value,
                    activeColor: ThemeColors.themeBlue,
                    onChanged: (value) => showPreview.value = value,
                    contentPadding: const EdgeInsets.only(left: 5),
                  ),
                  if (showPreview.value)
                    // Display Markdown
                    ColoredBox(
                      color: ThemeColors.inputBackground,
                      child: Markdown(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        selectable: true,
                        data: descriptionController.text,
                      ),
                    )
                  // Display Input
                  else
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Additional Information (optional)',
                      ),
                      controller: descriptionController,
                      minLines: 4,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      autocorrect: false,
                      textInputAction: TextInputAction.newline,
                      onChanged: (value) => context
                          .read<EditScenarioCubit>()
                          .descriptionChanged(value),
                    ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
          SavingInProgressOverlay(isSaving: state.isSubmitting),
        ],
      ),
    );
  }
}

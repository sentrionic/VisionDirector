import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vision_director/application/scenarios/create_template/create_template_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/domain/steps/value_objects.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/saving_progress_overlay.dart';

class CreateTemplateForm extends StatelessWidget {
  final Scenario scenario;
  const CreateTemplateForm({
    super.key,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateTemplateCubit, CreateTemplateState>(
      listener: (context, state) {
        state.scenarioFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  orElse: () => "Server Error. Try again later.",
                ),
              ).show(context);
            },
            (_) {
              buildSuccesFlushbar(message: "Successfully created the template")
                  .show(context);
            },
          ),
        );
      },
      builder: (context, state) => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: const Text("Template"),
              actions: [
                IconButton(
                  tooltip: "Save",
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context
                        .read<CreateTemplateCubit>()
                        .submitCreateTemplate(scenario.id);
                  },
                  icon: const Icon(Icons.check),
                ),
              ],
            ),
            body: FormWrapper(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Turn the current scenario steps into a template for future use.\nOnly the names and position will be copied.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const InfoLabel(label: "Template Name"),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) =>
                      context.read<CreateTemplateCubit>().nameChanged(value),
                  validator: (_) =>
                      context.read<CreateTemplateCubit>().state.name.value.fold(
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
                const InfoLabel(label: "Short Description"),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Description (optional)',
                  ),
                  autocorrect: false,
                  maxLength: Annotation.maxLength,
                  minLines: 4,
                  maxLines: null,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) => context
                      .read<CreateTemplateCubit>()
                      .descriptionChanged(value),
                  validator: (_) => context
                      .read<CreateTemplateCubit>()
                      .state
                      .description
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          empty: (_) => "Name must not be empty",
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
              ],
            ),
          ),
          SavingInProgressOverlay(isSaving: state.isSubmitting),
        ],
      ),
    );
  }
}

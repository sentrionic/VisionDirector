import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/step.dart';

/// Adds a new step to the list with the given input
class AddStepTile extends HookWidget {
  const AddStepTile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final showError = useState(false);
    final GlobalKey<FormState> key = GlobalKey();
    return BlocBuilder<CreateStepsCubit, CreateStepsState>(
      builder: (context, state) => Form(
        key: key,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enabled: state.steps.length < Guidelines.maxSteps,
          decoration: InputDecoration(
            labelText: state.steps.length >= Guidelines.maxSteps
                ? 'Step limit reached'
                : 'Name',
            suffixIcon: IconButton(
              tooltip: "Add Step",
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  context.read<CreateStepsCubit>().addStep(
                        StepInput.generate(controller.text),
                      );
                  controller.clear();
                  showError.value = false;
                } else {
                  key.currentState?.validate();
                  showError.value = true;
                }
              },
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          validator: (value) => value!.isEmpty && showError.value
              ? "Name must not be empty"
              : null,
          onChanged: (value) => showError.value = value.isEmpty,
          autocorrect: false,
          textInputAction: TextInputAction.done,
          controller: controller,
        ),
      ),
    );
  }
}

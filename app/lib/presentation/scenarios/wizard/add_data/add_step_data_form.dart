import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/common/step_widgets/guidelines_screen.dart';
import 'package:vision_director/presentation/common/widgets/upload_progress_widget.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_data/widgets/add_step_data_form_layout.dart';

class AddStepDataForm extends StatelessWidget {
  final Scenario scenario;

  const AddStepDataForm({
    super.key,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateStepsCubit, CreateStepsState>(
      builder: (context, state) {
        return _showUploadProgress(state)
            ? UploadProgress(progress: state.progress)
            : Scaffold(
                appBar: _AppBar(scenario: scenario),
                body: AddStepDataFormLayout(scenario: scenario),
              );
      },
    );
  }

  /// Returns `true` if there's an upload in progress and if no error exists after the upload
  bool _showUploadProgress(CreateStepsState state) =>
      state.isSubmitting ||
      state.stepFailureOrSuccessOption.isSome() &&
          state.stepFailureOrSuccessOption
              .getOrElse(() => right(unit))
              .isRight();
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  final Scenario scenario;

  const _AppBar({required this.scenario});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(scenario.name.getOrCrash()),
      leading: IconButton(
        tooltip: "Back",
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.read<CreateStepsCubit>().decrementPage(),
      ),
      actions: [
        const OpenGuidelinesButton(),
        TextButton(
          onPressed: () {
            context.read<CreateStepsCubit>().createSteps(scenario.id);
          },
          child: const Text(
            'Done',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

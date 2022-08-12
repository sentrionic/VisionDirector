import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/current_step_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/presentation/steps/shared/editor_player.dart';

/// Additional Widget to prevent the player from reloading whenever an
/// item in the list changes.
class EditorPreview extends StatelessWidget {
  const EditorPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentStepCubit, String>(
      builder: (context, state) {
        final current = context.read<StepListCubit>().getCurrentStep(state);
        return EditorPlayer(
          current: current,
        );
      },
    );
  }
}

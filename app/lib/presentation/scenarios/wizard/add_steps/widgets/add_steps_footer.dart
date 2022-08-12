import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/presentation/common/widgets/long_button.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_steps/widgets/add_step_tile_widget.dart';

class AddStepsFooter extends StatelessWidget {
  final bool isDisabled;
  const AddStepsFooter({
    super.key,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const AddStepTile(),
        const SizedBox(
          height: 20,
        ),
        LongButton(
          onClick: isDisabled
              ? null
              : () => context.read<CreateStepsCubit>().incrementPage(),
          label: "Next",
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';

import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_steps/widgets/add_step_list_item.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_steps/widgets/add_steps_footer.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_steps/widgets/add_steps_header.dart';

class StepListWidget extends StatelessWidget {
  const StepListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey();
    final isValid = key.currentState?.validate() ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Form(
        key: key,
        child: BlocBuilder<CreateStepsCubit, CreateStepsState>(
          builder: (context, state) =>
              ImplicitlyAnimatedReorderableList<StepInput>(
            shrinkWrap: true,
            removeDuration: Duration.zero,
            items: state.steps,
            areItemsTheSame: (o, n) => o.id == n.id,
            onReorderFinished: (item, from, to, newItems) =>
                context.read<CreateStepsCubit>().setNewList(newItems),
            header: const AddStepsHeader(),
            footer: AddStepsFooter(
              isDisabled: state.steps.isEmpty && !isValid,
            ),
            itemBuilder: (context, itemAnimation, item, index) {
              return Reorderable(
                key: ValueKey(item),
                builder: (context, dragAnimation, inDrag) {
                  return ScaleTransition(
                    scale: Tween<double>(begin: 1, end: 0.95)
                        .animate(dragAnimation),
                    child: AddStepListItem(
                      step: item,
                      index: index,
                      elevation: dragAnimation.value * 4,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

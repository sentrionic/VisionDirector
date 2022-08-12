import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/value_objects.dart';

class AddStepListItem extends HookWidget {
  final StepInput step;
  final int index;
  final double elevation;

  const AddStepListItem({
    super.key,
    required this.step,
    required this.index,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    final textEditingController = useTextEditingController(
      // Either the value of the name or an empty string
      text: step.name.getValue(),
    );

    final focusNode = useFocusNode();

    // Update the steps name value if it loses focus
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        context
            .read<CreateStepsCubit>()
            .changeName(step.id, textEditingController.text);
      }
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        elevation: elevation,
        animationDuration: const Duration(milliseconds: 50),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) =>
                    context.read<CreateStepsCubit>().removeStep(step.id),
                label: 'Delete',
                icon: Icons.delete,
                backgroundColor: Colors.red,
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("#${index + 1}"),
              ),
              minLeadingWidth: 0,
              title: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                focusNode: focusNode,
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  counterText: '',
                  border: InputBorder.none,
                ),
                maxLength: StepName.maxLength,
                validator: (_) {
                  return context
                      .read<CreateStepsCubit>()
                      .state
                      .steps
                      .where(
                        (e) => e.id == step.id,
                      ) // Index takes too long to update on delete so use this workaround.
                      .firstOrNull
                      ?.name
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          empty: (_) => 'Cannot be empty',
                          exceedingLength: (_) => 'Too long',
                          multiline: (_) => 'Has to be in a single line',
                          orElse: () => null,
                        ),
                        (_) => null,
                      );
                },
              ),
              trailing: const Handle(
                child: Icon(Icons.list),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

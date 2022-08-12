import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/value_objects.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_data/widgets/assign_member_widget.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_data/widgets/step_media_widget.dart';

class MediaStepListWidget extends StatelessWidget {
  const MediaStepListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateStepsCubit, CreateStepsState>(
      builder: (context, state) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.steps.length,
        itemBuilder: (context, index) {
          final step = state.steps[index];
          return _StepListCard(
            step: step,
            index: index,
          );
        },
      ),
    );
  }
}

class _StepListCard extends HookWidget {
  final StepInput step;
  final int index;

  const _StepListCard({
    required this.step,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // Name + Assign Member
            ListTile(
              trailing: AssignMemberWidget(
                id: step.id,
                assignee: step.assignee,
              ),
              title: Text(
                step.name.getOrCrash(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            // Assign Media
            StepMediaWidget(
              step: step,
            ),
            // Add Annotation
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  labelText: 'Annotation',
                ),
                maxLength: Annotation.maxLength,
                onChanged: (value) =>
                    context.read<CreateStepsCubit>().changeAnnotation(
                          step.id,
                          value,
                        ),
                validator: (_) {
                  return context
                      .read<CreateStepsCubit>()
                      .state
                      .steps[index]
                      .name
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          exceedingLength: (_) => 'Too long',
                          orElse: () => null,
                        ),
                        (_) => null,
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

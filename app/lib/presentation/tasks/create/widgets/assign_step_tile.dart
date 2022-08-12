import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/widgets/initials_avatar.dart';

/// Widget to assign a step.
///
/// * [step] the currently assigned step. If `null` it will display a placeholder.
/// * [onClick] handles the click event to assign the step.
class AssignStepTile extends StatelessWidget {
  final Step? step;
  final Function(Step? step) onClick;
  const AssignStepTile({
    super.key,
    this.step,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepListCubit, StepListState>(
      builder: (context, builderState) {
        return builderState.maybeWhen(
          loadSuccess: (steps) => ListTile(
            onTap: () => _displayStepDialog(
              context,
              steps,
              (step) => onClick(step),
            ),
            title: step != null
                ? Text(step!.name.getOrCrash())
                : const Text("Assign Step"),
            leading: step != null
                ? InitialsAvatar(
                    name: "#${step!.position + 1}",
                  )
                : const AddStepAvatar(),
            trailing: step != null
                ? IconButton(
                    tooltip: "Close",
                    onPressed: () => onClick(null),
                    icon: const Icon(Icons.close),
                  )
                : null,
          ),
          orElse: () => Container(),
        );
      },
    );
  }

  /// Displays a dialog where the user can pick a step from the scenario.
  void _displayStepDialog(
    BuildContext context,
    List<Step> steps,
    Function(Step? step) onClick,
  ) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Assign Step'),
        children: steps
            .map(
              (s) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(
                    thickness: 1,
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onClick(s);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("#${s.position + 1}"),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(start: 16.0),
                          child: Text(
                            s.name.getOrCrash(),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/create_step/create_step_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/step_widgets/file_error_message.dart';
import 'package:vision_director/presentation/common/step_widgets/media_selection_widget.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';
import 'package:vision_director/presentation/common/widgets/form_flow_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/steps/create/widgets/media_selection_sheet.dart';
import 'package:vision_director/presentation/tasks/create/widgets/assign_member_tile.dart';

class CreateStepFormBody extends StatelessWidget {
  final int currentDuration;
  final bool isValid;
  const CreateStepFormBody({
    super.key,
    required this.currentDuration,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateStepCubit, CreateStepState>(
      builder: (context, state) => Form(
        autovalidateMode: state.showErrorMessages
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: FormFlowWrapper(
          children: [
            const Text(
              "Add a step to your scenario.\nThe name should give a short description of the scene.",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(
              height: 10,
            ),
            const InfoLabel(label: "Required"),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              autocorrect: false,
              textInputAction: TextInputAction.done,
              onChanged: (value) =>
                  context.read<CreateStepCubit>().changeName(value),
              validator: (_) =>
                  context.read<CreateStepCubit>().state.step.name.value.fold(
                        (f) => f.maybeMap(
                          empty: (_) => "Name must not be empty",
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            const InfoLabel(label: "Additional Media (optional)"),
            const SizedBox(
              height: 10,
            ),
            _TotalTimeLabel(
              currentDuration: currentDuration,
              duration: state.step.duration.inSeconds,
            ),
            _AddMediaTile(isValid: isValid, step: state.step),
            const SpacedDivider(),
            const InfoLabel(label: "Assign Member (optional)"),
            const SizedBox(
              height: 5,
            ),
            AssignMemberTile(
              onClick: (assignee) => context
                  .read<CreateStepCubit>()
                  .changeAssignedMember(assignee),
            ),
            const SpacedDivider(),
          ],
        ),
      ),
    );
  }
}

/// Widget to assign media to the step.
class _AddMediaTile extends StatelessWidget {
  final bool isValid;
  final StepInput step;
  const _AddMediaTile({
    required this.isValid,
    required this.step,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: InkWell(
                onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => MediaSelectionSheet(
                    cubit: context.read<CreateStepCubit>(),
                  ),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: isValid
                        ? const Border()
                        : const Border(
                            top: BorderSide(color: ThemeColors.brandRed),
                            left: BorderSide(color: ThemeColors.brandRed),
                            right: BorderSide(color: ThemeColors.brandRed),
                          ),
                    color: ThemeColors.inputBackground,
                  ),
                  child: MediaSelection(
                    step: step,
                    onReset: () => context.read<CreateStepCubit>().resetMedia(),
                  ),
                ),
              ),
            ),
            if (!isValid) FileErrorMessage(step: step),
          ],
        ),
      ),
    );
  }
}

/// Displays the duration of all steps plus the new one.
class _TotalTimeLabel extends StatelessWidget {
  final int currentDuration;
  final int duration;
  const _TotalTimeLabel({
    required this.currentDuration,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final totalDuration =
        currentDuration + duration + Guidelines.autoGeneratedLength;
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Total time with this step: ${getDurationString(totalDuration)} / ${getDurationString(Guidelines.maxTotalDuration)}",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: totalDuration > Guidelines.maxTotalDuration
              ? ThemeColors.brandRed
              : Colors.white,
        ),
      ),
    );
  }
}

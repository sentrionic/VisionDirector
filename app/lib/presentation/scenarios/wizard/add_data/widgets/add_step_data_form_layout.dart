import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/create_steps/create_steps_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';
import 'package:vision_director/presentation/common/widgets/form_flow_wrapper.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/scenarios/wizard/add_data/widgets/media_step_list_widget.dart';

class AddStepDataFormLayout extends StatelessWidget {
  final Scenario scenario;
  const AddStepDataFormLayout({super.key, required this.scenario});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: FormFlowWrapper(
        children: [
          const Text(
            "2. (Optional) Add additional resources",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Add media (video/image) or an annotation to the video or assign someone to complete the step",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          const _TotalTimeBar(),
          const SizedBox(
            height: 5,
          ),
          const MediaStepListWidget(),
        ],
      ),
    );
  }
}

/// Displays the total time of all steps out of the maximum allowed duration.
class _TotalTimeBar extends StatelessWidget {
  const _TotalTimeBar();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: BlocBuilder<CreateStepsCubit, CreateStepsState>(
        buildWhen: (p, c) => p.steps != c.steps,
        builder: (context, state) {
          // Sum up the duration of all steps
          final duration = state.steps.fold<int>(
            0,
            (p, c) => p + c.duration.inSeconds,
          );
          return Text(
            "Total time: ${getDurationString(duration)} / ${getDurationString(Guidelines.maxTotalDuration)}",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: duration > Guidelines.maxTotalDuration
                  ? ThemeColors.brandRed
                  : Colors.white,
            ),
          );
        },
      ),
    );
  }
}

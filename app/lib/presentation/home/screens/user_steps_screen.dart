import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vision_director/application/steps/user_steps/user_steps_cubit.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/step_widgets/icon_label.dart';
import 'package:vision_director/presentation/common/widgets/card_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/core/screen_arguments/scenario_step_argument.dart';
import 'package:vision_director/presentation/steps/edit/dialogs/main_task_screen.dart';

class UserStepsScreen extends StatelessWidget {
  static const routeName = "/user-steps";
  const UserStepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserStepsCubit>()..getUsersSteps(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Your Steps")),
        body: const _UserTasksBody(),
      ),
    );
  }
}

class _UserTasksBody extends StatelessWidget {
  const _UserTasksBody();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<UserStepsCubit>().getUsersSteps(),
      child: BlocBuilder<UserStepsCubit, UserStepsState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loadInProgress: (_) => const CenterLoadingIndicator(),
            loadSuccess: (state) => _LoadSuccessBody(
              steps: state.steps,
            ),
            loadFailure: (state) => const ErrorIndicator(),
          );
        },
      ),
    );
  }
}

class _LoadSuccessBody extends StatelessWidget {
  final List<ScenarioStep> steps;
  const _LoadSuccessBody({
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: steps.isEmpty
          ? const _EmptyStepsList()
          : ListView.builder(
              itemBuilder: (context, index) {
                final step = steps[index];
                return _StepScenarioItem(step: step);
              },
              itemCount: steps.length,
            ),
    );
  }
}

class _StepScenarioItem extends StatelessWidget {
  final ScenarioStep step;
  const _StepScenarioItem({
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          MainTaskScreen.routeName,
          arguments: ScenarioStepArgument(
            step.scenario,
            _toStep(step),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ThumbnailPreview(
                thumbnail: step.thumbnail,
              ),
              Expanded(
                child: Column(
                  children: [
                    _StepTitle(
                      name: step.name.getOrCrash(),
                      scenarioName: step.scenario.name.getOrCrash(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _InfoBox(step: step),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Step _toStep(ScenarioStep step) {
    return Step(
      id: step.id,
      name: step.name,
      createdAt: step.createdAt,
      updatedAt: step.updatedAt,
      duration: step.duration,
      position: 0,
      isLocked: false,
      isCompleted: false,
      transition: StepTransition.none,
    );
  }
}

class _ThumbnailPreview extends StatelessWidget {
  final String? thumbnail;
  const _ThumbnailPreview({
    this.thumbnail,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black45,
        ),
        width: 80,
        height: 80,
        child: thumbnail == null
            ? const Icon(
                Icons.playlist_add,
                size: 40,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: thumbnail!,
                  placeholder: (context, url) => const CenterLoadingIndicator(),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}

class _StepTitle extends StatelessWidget {
  final String name;
  final String scenarioName;
  const _StepTitle({
    required this.name,
    required this.scenarioName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        "[$scenarioName",
                        style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Text(
                      "]",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _InfoBox extends StatelessWidget {
  final ScenarioStep step;
  const _InfoBox({required this.step});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconLabel(
          icon: _getMediaIcon(step.media),
          isSet: step.media != null,
          label: _getMediaLabel(step.media),
        ),
        IconLabel(
          icon: Icons.description,
          isSet: step.annotation != null,
          label: "Annotation",
        ),
        IconLabel(
          icon: Icons.audiotrack,
          isSet: step.audio != null,
          label: "Audio",
        ),
      ],
    );
  }

  IconData _getMediaIcon(Media? media) {
    if (media == null) return Icons.attach_file;
    final mimeType = media.mimeType;
    if (mimeType.contains("video")) return Icons.video_collection_rounded;
    if (mimeType.contains("image")) return Icons.image;
    return Icons.question_mark;
  }

  String _getMediaLabel(Media? media) {
    if (media == null) return "Media";
    final mimeType = media.mimeType;
    if (mimeType.contains("video")) return "Video";
    if (mimeType.contains("image")) return "Image";
    return "Unknown";
  }
}

class _EmptyStepsList extends StatelessWidget {
  const _EmptyStepsList();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "You've got no steps\nassigned to you yet.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

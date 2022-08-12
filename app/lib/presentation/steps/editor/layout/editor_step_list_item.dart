import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:vision_director/application/steps/current_step_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/screen_arguments/step_argument.dart';
import 'package:vision_director/presentation/steps/edit/edit_step_screen.dart';

const boxSize = 100.0;

class EditorStepListItem extends StatelessWidget {
  final Step step;
  final double elevation;
  const EditorStepListItem({super.key, required this.step, this.elevation = 0});

  @override
  Widget build(BuildContext context) {
    final isActive = context.watch<CurrentStepCubit>().state == step.id;
    return Align(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Empty space to correctly align everything else.
          const SizedBox(
            height: 24,
          ),
          // Position + Name
          SizedBox(
            width: boxSize,
            child: Text(
              "${step.position + 1}. ${step.name.getOrCrash()}",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          // Visual Preview
          Center(
            child: GestureDetector(
              onTap: () => context.read<CurrentStepCubit>().setCurrent(step.id),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _ItemPreview(
                    url: step.thumbnail,
                    isActive: isActive,
                  ),
                  if (isActive) ...[
                    _EditStepIcon(step: step),
                    const _MoveHandle(),
                  ]
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          // Duration
          Text(
            "${step.duration.inSeconds}s",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Icon(
            Icons.done,
            color: step.isCompleted ? Colors.green : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class _ItemPreview extends StatelessWidget {
  final String? url;
  final bool isActive;
  const _ItemPreview({
    this.url,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: isActive
              ? Border.all(
                  color: ThemeColors.themeBlue,
                  width: 3,
                )
              : null,
          color: Colors.black45,
        ),
        width: boxSize,
        height: boxSize,
        child: url == null
            ? const Icon(
                Icons.playlist_add,
                size: 40,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(isActive ? 7 : 10),
                child: CachedNetworkImage(
                  imageUrl: url!,
                  placeholder: (context, url) => const CenterLoadingIndicator(),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}

class _EditStepIcon extends StatelessWidget {
  final Step step;
  const _EditStepIcon({required this.step});

  @override
  Widget build(BuildContext context) {
    return step.isLocked
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(25),
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  EditStepScreen.routeName,
                  arguments: StepArgument(step),
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(
                      Icons.edit,
                      color: ThemeColors.themeBlue,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

class _MoveHandle extends StatelessWidget {
  const _MoveHandle();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: ThemeColors.themeBlue,
        ),
        width: 100,
        height: 15,
        child: Handle(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 3,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                width: 3,
              ),
              CircleAvatar(
                radius: 3,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                width: 3,
              ),
              CircleAvatar(
                radius: 3,
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

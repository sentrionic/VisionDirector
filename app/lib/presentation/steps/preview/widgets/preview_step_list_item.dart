import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/steps/current_step_cubit.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class PreviewStepListItem extends StatelessWidget {
  final Step step;
  final bool isInitialized;
  const PreviewStepListItem({
    super.key,
    required this.step,
    required this.isInitialized,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = context.watch<CurrentStepPreviewCubit>().state == step.id;
    return Align(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Name + Position
          SizedBox(
            width: 100,
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
          Center(
            child: GestureDetector(
              // Only set as active if the timeline isn't currently being played.
              onTap: isInitialized
                  ? null
                  : () => context
                      .read<CurrentStepPreviewCubit>()
                      .setCurrent(step.id),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _ItemPreview(
                    url: step.thumbnail,
                    isActive: isActive,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          // Step's duration
          Text(
            "${step.duration.inSeconds}s",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
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
    const boxSize = 100.0;
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
                borderRadius: BorderRadius.circular(10),
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

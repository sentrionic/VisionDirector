import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/presentation/common/widgets/player_wrapper.dart';
import 'package:vision_director/presentation/steps/shared/no_media_placeholder.dart';

/// Widget to display the step's media to play alongside the audio recording.
class AudioMediaPreview extends StatelessWidget {
  final MediaInput? input;
  final Media? media;
  final BetterPlayerController playerController;

  const AudioMediaPreview({
    super.key,
    this.input,
    this.media,
    required this.playerController,
  });

  @override
  Widget build(BuildContext context) {
    // No media, so just display a placeholder
    if (input == null && media == null) {
      return const NoMediaPlaceholder();
    }

    // Local file is an image
    if (input != null && input!.mimeType.contains("image")) {
      return PlayerWrapper(
        child: Image.file(
          input!.file.getOrCrash(),
          fit: BoxFit.cover,
        ),
      );
    }

    // Remote file is an image
    if (media != null && media!.mimeType.contains("image")) {
      return PlayerWrapper(
        child: CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(),
          imageUrl: media!.fileUrl,
          fit: BoxFit.cover,
        ),
      );
    }

    return PlayerWrapper(
      child: BetterPlayer(
        controller: playerController,
      ),
    );
  }
}

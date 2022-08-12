import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:photo_view/photo_view.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/presentation/common/utils/better_player_configuration.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/player_wrapper.dart';
import 'package:vision_director/presentation/steps/shared/no_media_placeholder.dart';

/// Widget to preview the remote media and interact with it.
class EditorPlayer extends StatelessWidget {
  final Step? current;

  const EditorPlayer({super.key, this.current});

  @override
  Widget build(BuildContext context) {
    // No active step
    if (current == null) {
      return const PlayerWrapper(
        child: SizedBox(),
      );
    }

    final step = current!;

    // Step has no media
    if (step.media == null) {
      return const NoMediaPlaceholder();
    }

    final file = step.media!;

    // Step has a video
    if (file.mimeType.contains("video")) {
      return _VideoPlayer(url: file.fileUrl);
    }

    // Display an image
    return PlayerWrapper(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CachedNetworkImage(
            placeholder: (context, url) => const CenterLoadingIndicator(),
            imageUrl: file.fileUrl,
            fit: BoxFit.cover,
          ),
          IconButton(
            tooltip: "Fullscreen",
            icon: const Icon(Icons.fullscreen),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => _ImageScreen(url: file.fileUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget to load the video in a video player and interact with it.
class _VideoPlayer extends StatelessWidget {
  final String url;

  const _VideoPlayer({required this.url});

  @override
  Widget build(BuildContext context) {
    return PlayerWrapper(
      child: BetterPlayer(
        controller: BetterPlayerController(
          getBetterPlayerConfiguration(),
          betterPlayerDataSource: BetterPlayerDataSource(
            BetterPlayerDataSourceType.network,
            url,
            // cacheConfiguration: const BetterPlayerCacheConfiguration(
            //   useCache: true,

            //   ///Android only option to use cached video between app sessions
            //   key: "testCacheKey",
            // ),
          ),
        ),
      ),
    );
  }
}

/// Fullscreen view to zoom into the image.
class _ImageScreen extends StatelessWidget {
  final String url;

  const _ImageScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Zoomable Photo View"),
      ),
      body: PhotoView(
        imageProvider: NetworkImage(url),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        customSize: MediaQuery.of(context).size,
        enableRotation: true,
        initialScale: PhotoViewComputedScale.contained,
        basePosition: Alignment.center,
      ),
    );
  }
}

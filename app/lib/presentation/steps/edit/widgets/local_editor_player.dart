import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/presentation/common/utils/better_player_configuration.dart';
import 'package:vision_director/presentation/common/widgets/player_wrapper.dart';

/// Widget to preview the local media and interact with it.
class LocalEditorPlayer extends StatelessWidget {
  final MediaInput input;

  const LocalEditorPlayer({super.key, required this.input});

  @override
  Widget build(BuildContext context) {
    // Get the media in either case
    final file = input.file.getValue();

    if (input.mimeType.contains("video")) {
      return _VideoPlayer(path: file.path);
    }

    return PlayerWrapper(
      child: Image.file(
        file,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _VideoPlayer extends HookWidget {
  final String path;

  const _VideoPlayer({required this.path});

  @override
  Widget build(BuildContext context) {
    return PlayerWrapper(
      child: BetterPlayer.file(
        path,
        betterPlayerConfiguration: getBetterPlayerConfiguration(),
      ),
    );
  }
}

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:vision_director/domain/core/utils.dart';

/// Returns a configuration set for the better_player that disables
/// most of the controls options.
BetterPlayerConfiguration getBetterPlayerConfiguration() =>
    BetterPlayerConfiguration(
      controlsConfiguration: const BetterPlayerControlsConfiguration(
        showControlsOnInitialize: false,
        controlsHideTime: Duration.zero,
        enableOverflowMenu: false,
        enableSubtitles: false,
        enableQualities: false,
        enableSkips: false,
        enablePip: false,
      ),
      errorBuilder: (context, errorMessage) {
        debugLog(errorMessage);
        return const Center(
          child: Text(
            "Something went wrong.\nPlease restart the app.",
            textAlign: TextAlign.center,
          ),
        );
      },
    );

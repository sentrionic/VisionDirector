import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

/// Helper class to initialize and use the [FlutterSoundPlayer].
class SoundPlayer {
  FlutterSoundPlayer? _player;
  bool _hasAudio = false;

  /// Returns `true` if the [_player] is playing.
  bool get isPlaying => _player!.isPlaying;

  /// Returns `true` if the [_player] is initialized with an audio file.
  bool get hasAudio => _hasAudio;

  /// Creates a new instance of the [FlutterSoundPlayer] and opens a session.
  Future init() async {
    _player = FlutterSoundPlayer();
    await _player!.openPlayer();
  }

  /// Cleans up the [FlutterSoundPlayer].
  Future dispose() async {
    _player!.closePlayer();
    _player = null;
  }

  /// Starts the audio playback.
  Future play(String path, VoidCallback whenFinished) async {
    _hasAudio = true;
    await _player!.startPlayer(
      fromURI: path,
      whenFinished: whenFinished,
    );
  }

  /// Stops the audio playback.
  Future stop() async {
    _hasAudio = false;
    await _player!.stopPlayer();
  }

  /// Resumes the audio playback.
  Future resume() async {
    await _player!.resumePlayer();
  }

  /// Pauses the audio playback.
  Future pause() async {
    await _player!.pausePlayer();
  }

  /// Toggles the audio playback.
  Future togglePlaying(String path, VoidCallback whenFinished) async {
    if (_player!.isStopped) {
      await play(path, whenFinished);
    } else {
      await stop();
    }
  }
}

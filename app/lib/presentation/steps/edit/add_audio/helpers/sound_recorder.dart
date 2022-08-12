import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

/// Helper class to initialize and use the [SoundRecorder].
class SoundRecorder {
  FlutterSoundRecorder? _recorder;
  bool _isInitialized = false;

  /// Returns `true` if the [_recorder] is recording.
  bool get isRecording => _recorder!.isRecording;

  /// Initializes the [_recorder] and asks for microphone permissions.
  /// If the permissions are granted it opens an audio session.
  Future init() async {
    _recorder = FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {}
    await _recorder!.openRecorder();
    _isInitialized = true;
  }

  /// Cleans up the [_recorder].
  Future dispose() async {
    if (!_isInitialized) return;
    _recorder!.dispositionStream();
    _recorder = null;
    _isInitialized = false;
  }

  Future _record(String path) async {
    if (!_isInitialized) return;
    await _recorder!.startRecorder(
      toFile: path,
      codec: Codec.aacADTS,
      bitRate: 32000,
      sampleRate: 32000,
      numChannels: 2,
    );
  }

  Future _stop() async {
    if (!_isInitialized) return;
    await _recorder!.stopRecorder();
  }

  /// Toggles the audio recording.
  Future toggleRecording(String path) async {
    if (_recorder!.isStopped) {
      await _record(path);
    } else {
      await _stop();
    }
  }
}

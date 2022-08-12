import 'package:flutter/material.dart' hide Step;
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:vision_director/presentation/steps/edit/add_audio/helpers/sound_recorder.dart';

/// [Hook] to initialize and dispose a [SoundRecorder].
///
/// Returns an instance of the [SoundRecorder].
SoundRecorder useSoundRecorder() {
  return use(const _SoundRecorderHook());
}

class _SoundRecorderHook extends Hook<SoundRecorder> {
  const _SoundRecorderHook();

  @override
  HookState<SoundRecorder, Hook<SoundRecorder>> createState() =>
      _SoundRecorderHookState();
}

class _SoundRecorderHookState
    extends HookState<SoundRecorder, _SoundRecorderHook> {
  final SoundRecorder _recorder = SoundRecorder();

  @override
  void initHook() {
    super.initHook();
    _recorder.init();
  }

  @override
  SoundRecorder build(BuildContext context) => _recorder;

  @override
  void dispose() {
    _recorder.dispose();
    super.dispose();
  }
}

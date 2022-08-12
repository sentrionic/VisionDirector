import 'package:flutter/material.dart' hide Step;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/presentation/steps/edit/add_audio/helpers/sound_player.dart';

/// [Hook] to initialize and dispose a [SoundPlayer].
///
/// Returns an instance of the [SoundPlayer].
SoundPlayer useSoundPlayer() {
  return use(const _SoundPlayerHook());
}

class _SoundPlayerHook extends Hook<SoundPlayer> {
  const _SoundPlayerHook();

  @override
  HookState<SoundPlayer, Hook<SoundPlayer>> createState() =>
      _SoundPlayerHookState();
}

class _SoundPlayerHookState extends HookState<SoundPlayer, _SoundPlayerHook> {
  final SoundPlayer _player = SoundPlayer();

  @override
  void initHook() {
    super.initHook();
    _player.init();
  }

  @override
  SoundPlayer build(BuildContext context) => _player;

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}

import 'dart:io';

import 'package:ffmpeg_kit_flutter_full_gpl/ffprobe_kit.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

/// Returns the duration of the video in seconds.
Future<double> getVideoDuration(String path) async {
  final session = await FFprobeKit.getMediaInformation(path);
  final info = session.getMediaInformation();
  final length = info?.getDuration() ?? "0.0";
  return double.tryParse(length) ?? 0.0;
}

/// Generates a thumbnail for the given video.
///
/// Returns the path to the thumbnail.
/// * [path] is the path of the video.
Future<String?> getThumbnail(String path) async {
  return VideoThumbnail.thumbnailFile(
    video: path,
    thumbnailPath: (await getTemporaryDirectory()).path,
    quality: 100,
  );
}

/// Checks if the video's width is higher than its height.
///
/// Returns `true` if that's the case.
Future<bool> checkIfVideoIsLandscape(File file) async {
  final controller = VideoPlayerController.file(file);
  await controller.initialize();
  final width = controller.value.size.width;
  final height = controller.value.size.height;
  await controller.dispose();
  return width / height >= 1;
}

/// Checks if the image's width is higher than its height.
///
/// Returns `true` if that's the case.
Future<bool> checkIfImageIsLandscape(File file) async {
  final image = await decodeImageFromList(file.readAsBytesSync());
  final width = image.width;
  final height = image.height;
  return width / height >= 1;
}

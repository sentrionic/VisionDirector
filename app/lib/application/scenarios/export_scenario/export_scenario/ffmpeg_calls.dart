import 'dart:io';

import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:vision_director/application/scenarios/export_scenario/export_scenario/ffmpeg_commands.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/step.dart';

/// Generates a video from the given image and returns the path to it.
///
/// * [image] is the file containing the image.
/// * [tempDir] is the directory the file will be created in.
/// * [step] is the [StepInput] used to generate the text in the video.
Future<String> imageToVideo(
  File image,
  String tempDir,
  StepInput step,
  ExportResolution resolution, {
  required bool addName,
}) async {
  final uid = const Uuid().v4();
  final video = "$tempDir/$uid.mp4";

  final session = await FFmpegKit.execute(
    imageToVideoCommand(
      image.path,
      video,
      step,
      resolution,
      addName: addName,
    ),
  );

  debugPrint(await session.getOutput());

  return video;
}

/// Generates a placeholder video containing `Needs more information` on a black background.
///
/// Returns the path to the new video.
///
/// * [tempDir] is the directory the file will be created in.
/// * [step] is the [StepInput] used to generate the text in the video.
Future<String> generatePlaceholder(
  String tempDir,
  StepInput step,
  ExportResolution resolution, {
  required bool addName,
}) async {
  final uid = const Uuid().v4();
  final video = "$tempDir/$uid.mp4";

  final session = await FFmpegKit.execute(
    noMediaPlaceholderCommand(
      step,
      video,
      resolution,
      addName: addName,
    ),
  );

  debugPrint(await session.getOutput());

  return video;
}

/// Generates a video with the correct dimensions and adds the text to it.
///
/// Returns the path to the new video.
///
/// * [tempDir] is the directory the file will be created in.
/// * [step] is the [StepInput] used to generate the text in the video.
Future<String> transformVideo(
  StepInput step,
  String tempDir,
  ExportResolution resolution, {
  required bool addName,
}) async {
  final uid = const Uuid().v4();
  final video = "$tempDir/$uid.mp4";

  final session = await FFmpegKit.execute(
    videoTransformationCommand(
      step,
      step.media!.file.getOrCrash().path,
      video,
      resolution,
      addName: addName,
    ),
  );

  debugPrint(await session.getOutput());

  return video;
}

/// Generates a video with the new audio replacing the old audio.
///
/// Returns the path to the new video.
///
/// * [tempDir] is the directory the file will be created in.
/// * [mediaPath] is the path to the video.
/// * [audioPath] is the path to the audio.
Future<String> addAudioToVideo(
  String mediaPath,
  String audioPath,
  String tempDir,
) async {
  final uid = const Uuid().v4();
  final video = "$tempDir/$uid.mp4";

  final session = await FFmpegKit.execute(
    replaceAudioCommand(mediaPath, audioPath, video),
  );

  debugPrint(await session.getOutput());

  return video;
}

/// Generates a video with a black background containing the title of the [Project]
/// and the name of the [Scenario] in the center.
///
/// Returns the path to the new video.
///
/// * [tempDir] is the directory the file will be created in.
/// * [project] is the name of the [Project] used for the title.
/// * [scenario] is the name of the [Scenario] used for the title.
Future<String> generateTitle(
  String project,
  String scenario,
  String tempDir,
  ExportResolution resolution,
) async {
  final uid = const Uuid().v4();
  final video = "$tempDir/$uid.mp4";

  final session = await FFmpegKit.execute(
    titleCommand(project, scenario, video, resolution),
  );

  debugPrint(await session.getOutput());

  return video;
}

/// Generates a video with a black background containing the name of all collaborators
/// that worked on the project.
///
/// Returns the path to the new video.
///
/// * [tempDir] is the directory the file will be created in.
/// * [collaborators] is a list of [Collaborator] that worked on the project.
Future<String> generateCredits(
  List<Collaborator> collaborators,
  String tempDir,
  ExportResolution resolution,
) async {
  final uid = const Uuid().v4();
  final video = "$tempDir/$uid.mp4";

  // Generate a txt file containing the name of all collaborators
  // which simplifies adding it to the video.
  final txtFile = File("$tempDir/collaborators.txt");

  final buffer = StringBuffer();

  // Add members to buffer
  for (final collaborator in collaborators) {
    buffer.writeln(collaborator.username);
  }

  await txtFile.writeAsString(buffer.toString());

  final session = await FFmpegKit.execute(
    creditsCommand(txtFile.path, video, resolution),
  );

  debugPrint(await session.getOutput());

  return video;
}

/// Generates an intermediate .ts file used for concatenating.
///
/// Returns the path to the file.
///
/// * [tempDir] is the directory the file will be created in.
/// * [mediaPath] is the path to the video.
Future<String> generateIntermediate(
  String mediaPath,
  String tempDir,
) async {
  final uid = const Uuid().v4();
  final video = "$tempDir/$uid.ts";

  final session = await FFmpegKit.execute(
    generateIntermediateCommand(mediaPath, video),
  );

  debugPrint(await session.getOutput());

  return video;
}

/// Concatenates a list of videos.
///
/// Returns the path to the file.
/// * [tempDir] is the directory the file will be created in.
/// * [files] is a string of form "title.ts|video1.ts|...|credits.ts"
Future<String> concatVideos(
  String scenarioName,
  String files,
  String tempDir,
) async {

  final video = "$tempDir/${scenarioName.replaceAll(" ", "-")}.mp4";

  final session = await FFmpegKit.execute(
    concatCommand(files, video),
  );

  debugPrint(await session.getOutput());

  return video;
}

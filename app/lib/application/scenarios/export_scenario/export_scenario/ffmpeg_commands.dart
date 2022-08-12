import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/step.dart';

// Video Generation -----------------------------------------------------------

/// FFmpeg command to create a video from the image.
///
/// Creates a video with silent audio that is the [StepInput]'s [Duration] seconds long.
/// Adds the [StepInput]s annotation to it.
/// Automatically resizes the image or adds padding to it.
///
/// * [inputPath] is the path to the input file. Must be an `image`.
/// * [outputPath] is the path where the new video will be generated in. Must be a `.mp4` file path.
/// * [step] is the step which is used to determine the length of the video.
String imageToVideoCommand(
  String inputPath,
  String outputPath,
  StepInput step,
  ExportResolution resolution, {
  required bool addName,
}) =>
    '''
    -r 30 -f image2 
    -s ${_getWidth(resolution)}x${_getHeight(resolution)} -loop 1 
    -i $inputPath
    -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=48000
    -t ${step.duration.inSeconds} -c:v libx264 -t ${step.duration.inSeconds} -pix_fmt yuv420p
    -vf "scale='min(${_getWidth(resolution)},iw)':'min(${_getHeight(resolution)},ih)':force_original_aspect_ratio=decrease,
    pad=${_getWidth(resolution)}:${_getHeight(resolution)}:-1:-1:color=black
    ${_drawTextCommand(step, addName: addName)}
    ${_drawTransition(step.transition, step.duration.inSeconds)}"
    -y $outputPath
    '''
        .replaceAll("\n", "");

/// FFmpeg command to create a black video containing `Needs more information` in the center.
///
/// Creates a video with silent audio that is the [StepInput]'s [Duration] seconds long.
/// Adds the [StepInput]s annotation to it.
///
/// * [outputPath] is the path where the new video will be generated in. Must be a `.mp4` file path.
/// * [step] is the step which is used to determine the length of the video.
String noMediaPlaceholderCommand(
  StepInput step,
  String outputPath,
  ExportResolution resolution, {
  required bool addName,
}) =>
    '''
    -f lavfi -i color=c=black:s=${_getWidth(resolution)}x${_getHeight(resolution)}:d=${step.duration.inSeconds}
    -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=48000 
    -t ${step.duration.inSeconds} -c:v libx264 -t ${step.duration.inSeconds} -pix_fmt yuv420p 
    -vf "drawtext=${_fontLocation()}:fontsize=50:fontcolor=white
    :x=(w-text_w)/2:y=(h+text_h)/2
    :text='Needs more information'
    ${_drawTextCommand(step, addName: addName)}
    ${_drawTransition(step.transition, step.duration.inSeconds)}" 
    -y $outputPath
'''
        .replaceAll("\n", "");

/// FFmpeg command to create a black video containing title of the project and the name of the scenario.
///
/// Creates a video with silent audio that is [Guidelines.titleLength] seconds long.
///
/// * [outputPath] is the path where the new video will be generated in. Must be a `.mp4` file path.
/// * [project] is the name of the [Project] used for the title.
/// * [scenario] is the name of the [Scenario] used for the title.
String titleCommand(
  String project,
  String scenario,
  String outputPath,
  ExportResolution resolution,
) =>
    '''
    -f lavfi -i color=c=black:s=${_getWidth(resolution)}x${_getHeight(resolution)}:d=${Guidelines.titleLength} 
    -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=48000 
    -t ${Guidelines.titleLength} -c:v libx264 -t ${Guidelines.titleLength} -pix_fmt yuv420p 
    -vf "drawtext=fontfile=${_fontLocation()}
    :fontsize=(h/22):fontcolor=white
    :x=(w-text_w)/2:y=(h-text_h-text_h-text_h)/2
    :text='${_sanitizeInput(project)}',
    drawtext=fontfile=${_fontLocation()}
    :fontsize=(h/14):fontcolor=white
    :x=(w-text_w)/2:y=(h+text_h)/2
    :text='${_sanitizeInput(scenario)}'" 
    -y $outputPath
'''
        .replaceAll("\n", "");

/// FFmpeg command to create a black video containing a list of all collaborators.
///
/// Creates a video with silent audio that is [Guidelines.creditsLength] seconds long.
///
/// * [outputPath] is the path where the new video will be generated in. Must be a `.mp4` file path.
/// * [txtPath] is the path to the `.txt` file containing all collaborators.
String creditsCommand(
  String txtPath,
  String outputPath,
  ExportResolution resolution,
) =>
    '''
    -f lavfi -i color=c=black:s=${_getWidth(resolution)}x${_getHeight(resolution)}:d=${Guidelines.creditsLength}
    -f lavfi -i anullsrc=channel_layout=5.1:sample_rate=48000
    -t ${Guidelines.creditsLength} -c:v libx264 -t ${Guidelines.creditsLength} -pix_fmt yuv420p 
    -vf "drawtext=fontfile=${_fontLocation()}
    :fontsize=(h/22):fontcolor=white
    :x=(w-text_w)/2:y=30
    :text='Created with the help of the following people'
    :line_spacing=${_getLineSpacing(resolution)},
    drawtext=fontfile=${_fontLocation()}
    :fontsize=(h/14):fontcolor=white:x=(w-text_w)/2:y=(80)
    :textfile=$txtPath:line_spacing=${_getLineSpacing(resolution)}" 
    -y $outputPath
'''
        .replaceAll("\n", "");

/// FFmpeg command to resize the video or add padding if necessary.
///
/// Adds the [StepInput]s annotation to it.
/// * [inputPath] is the path to the input file. Must be a `.mp4` file path.
/// * [outputPath] is the path where the new video will be generated in. Must be a `.mp4` file path.
/// * [step] is the step which is used to determine the length of the video.
String videoTransformationCommand(
  StepInput step,
  String inputPath,
  String outputPath,
  ExportResolution resolution, {
  required bool addName,
}) =>
    '''
    -i $inputPath 
    -vf "scale=${_getWidth(resolution)}:${_getHeight(resolution)}
    :force_original_aspect_ratio=decrease,
    pad=${_getWidth(resolution)}:${_getHeight(resolution)}:(ow-iw)/2:(oh-ih)/2
    ${_drawTextCommand(step, addName: addName)}
    ${_drawTransition(step.transition, step.duration.inSeconds)}" 
    -y $outputPath
    '''
        .replaceAll("\n", "");

// Audio ----------------------------------------------------------------------

/// FFmpeg command to replace the original video's audio and generate a new video.
///
/// * [mediaPath] is the path to the original video. Must be a `.mp4` file path.
/// * [audioPath] is the path to audio file that should replace the original video. Must be an `audio` file.
/// * [outputPath] is the path where the new video will be generated into. Must be a `.mp4` file path.
String replaceAudioCommand(
  String mediaPath,
  String audioPath,
  String outputPath,
) =>
    '''
    -i $mediaPath 
    -i $audioPath 
    -filter_complex 
    " [1:0] apad " -shortest 
    -y $outputPath
'''
        .replaceAll("\n", "");

// Concatenation --------------------------------------------------------------

/// FFmpeg command to generate an intermediate file used for concatenating.
///
/// * [inputPath] the path to the original video. Must be a `.mp4` file path.
/// * [outputPath] the path to the intermediate file. Must be a `.ts` file path.
String generateIntermediateCommand(String inputPath, String outputPath) =>
    "-i $inputPath -c copy $outputPath";

/// FFmpeg command to concat a list of files.
///
/// * [outputPath] the path to the new video. Must be a `.mp4` file path.
/// * [files] is a string of form "title.ts|video1.ts|...|credits.ts"
String concatCommand(String files, String outputPath) =>
    '-i "concat:$files" -y $outputPath';

// Utils ----------------------------------------------------------------------

/// Draws the text on the video inside a black box.
///
/// If not text is provided, returns an empty string.
/// Otherwise, it returns the commands to draw the text prepended with a `,`
String _drawTextCommand(
  StepInput step, {
  required bool addName,
}) {
  final annotation = step.annotation;
  if (!addName && annotation == null) return "";
  if (!addName && annotation != null) {
    return _drawAnnotationCommand(annotation.getOrCrash());
  }
  if (addName && annotation == null) return _drawStepName(step);
  return "${_drawStepName(step)}${_drawAnnotationCommand(annotation!.getOrCrash())}";
}

/// Adds text containing the position and name of the step in the lower left corner.
String _drawStepName(StepInput step) => '''
    ,drawtext=fontfile=${_fontLocation()}
    :text='${step.position! + 1}. ${_sanitizeInput(step.name.getOrCrash())}'
    :fontcolor=white:fontsize=(h/22)
    :box=1:boxcolor=black@0.7
    :boxborderw=10:x=20:y=h-th-20
    '''
    .replaceAll("\n", "");

/// Adds the annotation to the center top of the video.
String _drawAnnotationCommand(String annotation) => '''
  ,drawtext=fontfile=${_fontLocation()}
  :text='${_sanitizeInput(_wrapText(annotation))}'
  :fontcolor=white:fontsize=(h/18)
  :box=1:boxcolor=black@0.7
  :boxborderw=10
  :x=(w-text_w)/2:y=40
'''
    .replaceAll("\n", "");

/// Location of the font stored on Android.
String _fontLocation() => "/system/fonts/Roboto-Bold.ttf";

/// Escapes the characters `:` and `'` so that they work with FFmpeg.
String _sanitizeInput(String input) {
  final firstRound = input.replaceAll("'", "\\'").replaceAll(":", "\\:");
  // ignore: avoid_escaping_inner_quotes
  return firstRound.replaceAll('\'', '\'\\\\\\\\\\\'\''); // Mental
}

/// Sets the fade transition that should be applied to the video.
String _drawTransition(StepTransition? transition, int startTime) {
  if (transition == null) return "";
  switch (transition) {
    case StepTransition.fadeIn:
      return ",fade=t=in:st=0:d=0.5";
    case StepTransition.fadeOut:
      return ",fade=t=out:st=${startTime - 0.6}:d=0.5";
    case StepTransition.fadeInOut:
      return ",fade=t=in:st=0:d=0.5,fade=t=out:st=${startTime - 0.6}:d=0.5";
    case StepTransition.none:
      return "";
  }
}

String _wrapText(String text) => text.replaceAllMapped(
      // RegExp taken from https://stackoverflow.com/questions/14484787/wrap-text-in-javascript
      RegExp(r"(?![^\n]{1,40}$)([^\n]{1,40})", caseSensitive: false),
      (Match m) => "${m[1]}\v",
    );

/// Returns the width to be used based on the resolution.
String _getWidth(ExportResolution resolution) {
  switch (resolution) {
    case ExportResolution.hd:
      return "1280";
    case ExportResolution.fhd:
      return "1920";
  }
}

/// Returns the height to be used based on the resolution.
String _getHeight(ExportResolution resolution) {
  switch (resolution) {
    case ExportResolution.hd:
      return "720";
    case ExportResolution.fhd:
      return "1080";
  }
}

/// Returns the line spacing to be used based on the resolution.
String _getLineSpacing(ExportResolution resolution) {
  switch (resolution) {
    case ExportResolution.hd:
      return "20";
    case ExportResolution.fhd:
      return "30";
  }
}

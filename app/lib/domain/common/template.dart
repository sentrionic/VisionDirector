import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/domain/common/value_objects.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/domain/steps/value_objects.dart';

part 'template.freezed.dart';

/// [Template] represents the network's template model.
///
/// * [id] is the template's unique id.
/// * [name] is the template's body.
/// * [description] is the template's description.
/// * [createdAt] the template's creation date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [updatedAt] the template's creation date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [steps] are the template's steps.
@freezed
class Template with _$Template {
  const Template._();

  const factory Template({
    required String id,
    required TemplateName name,
    required TemplateDescription description,
    required String createdAt,
    required String updatedAt,
    required List<TemplateStep> steps,
  }) = _Template;
}

/// [TemplateStep] represents the network's templatestep model.
///
/// * [id] is the template's unique id.
/// * [name] is the template's body.
/// * [duration] is the duration of the media in the finished video in seconds.
/// * [position] is the position of the step in the timeline.
@freezed
class TemplateStep with _$TemplateStep {
  const TemplateStep._();

  const factory TemplateStep({
    required String id,
    required String name,
    required int duration,
    required int position,
    Media? media,
  }) = _TemplateStep;

  StepInput toStepInput() {
    return StepInput(
      id: id,
      name: StepName(name),
      duration: Duration(seconds: duration),
    );
  }
}

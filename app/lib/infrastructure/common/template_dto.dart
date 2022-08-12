import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/common/template.dart';
import 'package:vision_director/domain/common/value_objects.dart';
import 'package:vision_director/infrastructure/common/media_dto.dart';

part 'template_dto.freezed.dart';
part 'template_dto.g.dart';

@freezed
class TemplateDto with _$TemplateDto {
  const TemplateDto._();

  const factory TemplateDto({
    required String id,
    required String name,
    required String createdAt,
    required String updatedAt,
    required String description,
    required List<TemplateStepDto> steps,
  }) = _TemplateDto;

  Template toDomain() {
    return Template(
      id: id,
      name: TemplateName(name),
      createdAt: createdAt,
      updatedAt: updatedAt,
      description: TemplateDescription(description),
      steps: steps.map((s) => s.toDomain()).toList(),
    );
  }

  factory TemplateDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateDtoFromJson(json);
}

@freezed
class TemplateStepDto with _$TemplateStepDto {
  const TemplateStepDto._();

  const factory TemplateStepDto({
    required String id,
    required String name,
    required int duration,
    required int position,
    MediaDto? media,
  }) = _TemplateStepDto;

  TemplateStep toDomain() {
    return TemplateStep(
      id: id,
      name: name,
      duration: duration,
      position: position,
      media: media?.toDomain(),
    );
  }

  factory TemplateStepDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateStepDtoFromJson(json);
}

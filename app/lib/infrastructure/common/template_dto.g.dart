// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TemplateDto _$$_TemplateDtoFromJson(Map<String, dynamic> json) =>
    _$_TemplateDto(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      description: json['description'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => TemplateStepDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TemplateDtoToJson(_$_TemplateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'description': instance.description,
      'steps': instance.steps,
    };

_$_TemplateStepDto _$$_TemplateStepDtoFromJson(Map<String, dynamic> json) =>
    _$_TemplateStepDto(
      id: json['id'] as String,
      name: json['name'] as String,
      duration: json['duration'] as int,
      position: json['position'] as int,
      media: json['media'] == null
          ? null
          : MediaDto.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TemplateStepDtoToJson(_$_TemplateStepDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'position': instance.position,
      'media': instance.media,
    };

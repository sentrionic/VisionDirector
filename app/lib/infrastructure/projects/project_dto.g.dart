// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectDto _$$_ProjectDtoFromJson(Map<String, dynamic> json) =>
    _$_ProjectDto(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] as String,
      scenarioCount: json['scenarioCount'] as int,
      collaborators: (json['collaborators'] as List<dynamic>)
          .map((e) => CollaboratorDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProjectDtoToJson(_$_ProjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'scenarioCount': instance.scenarioCount,
      'collaborators': instance.collaborators,
    };

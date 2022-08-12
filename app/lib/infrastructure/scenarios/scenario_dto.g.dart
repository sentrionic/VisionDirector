// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenario_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScenarioDto _$$_ScenarioDtoFromJson(Map<String, dynamic> json) =>
    _$_ScenarioDto(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      owner: json['owner'] as String,
      isOwner: json['isOwner'] as bool,
      stepCount: json['stepCount'] as int,
      status: json['status'] as String,
      duration: json['duration'] as int,
      url: json['url'] as String?,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_ScenarioDtoToJson(_$_ScenarioDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'owner': instance.owner,
      'isOwner': instance.isOwner,
      'stepCount': instance.stepCount,
      'status': instance.status,
      'duration': instance.duration,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
    };

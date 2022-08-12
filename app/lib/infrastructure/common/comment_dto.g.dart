// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentDto _$$_CommentDtoFromJson(Map<String, dynamic> json) =>
    _$_CommentDto(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      body: json['body'] as String,
      author: CollaboratorDto.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CommentDtoToJson(_$_CommentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'body': instance.body,
      'author': instance.author,
    };

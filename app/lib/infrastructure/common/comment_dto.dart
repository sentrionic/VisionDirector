import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/common/comment.dart';
import 'package:vision_director/domain/common/value_objects.dart';
import 'package:vision_director/infrastructure/common/collaborator_dto.dart';

part 'comment_dto.freezed.dart';
part 'comment_dto.g.dart';

@freezed
class CommentDto with _$CommentDto {
  const CommentDto._();

  const factory CommentDto({
    required String id,
    required String createdAt,
    required String body,
    required CollaboratorDto author,
  }) = _CommentDto;

  Comment toDomain() {
    return Comment(
      id: id,
      createdAt: createdAt,
      body: CommentBody(body),
      author: author.toDomain(),
    );
  }

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);
}

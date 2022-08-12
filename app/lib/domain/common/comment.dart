import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/common/value_objects.dart';

part 'comment.freezed.dart';

/// [Comment] represents the network's comment model.
///
/// * [id] is the comment's unique id.
/// * [body] is the comment's body.
/// * [createdAt] the comment's creation date (e.g. `2022-01-30T12:00:05.246683+01:00`).
/// * [author] is the comments author.
@freezed
class Comment with _$Comment {
  const Comment._();

  const factory Comment({
    required String id,
    required CommentBody body,
    required String createdAt,
    required Collaborator author,
  }) = _Comment;
}

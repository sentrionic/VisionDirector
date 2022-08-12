import 'package:freezed_annotation/freezed_annotation.dart';

part 'collaborator.freezed.dart';

/// [Collaborator] represents the project's member.
///
/// * [id] is the member's unique id.
/// * [username] is the member's name.
/// * [email] is the user's email.
@freezed
class Collaborator with _$Collaborator {
  const Collaborator._();

  const factory Collaborator({
    required String id,
    required String username,
    required String email,
  }) = _Collaborator;

  factory Collaborator.empty(String id) => Collaborator(
        id: id,
        username: "",
        email: "",
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/common/collaborator.dart';

part 'collaborator_dto.freezed.dart';
part 'collaborator_dto.g.dart';

@freezed
class CollaboratorDto with _$CollaboratorDto {
  const CollaboratorDto._();

  const factory CollaboratorDto({
    required String id,
    required String username,
    required String email,
  }) = _CollaboratorDto;

  factory CollaboratorDto.fromDomain(Collaborator collaborator) {
    return CollaboratorDto(
      id: collaborator.id,
      username: collaborator.username,
      email: collaborator.email,
    );
  }

  Collaborator toDomain() {
    return Collaborator(
      id: id,
      username: username,
      email: email,
    );
  }

  factory CollaboratorDto.fromJson(Map<String, dynamic> json) =>
      _$CollaboratorDtoFromJson(json);
}

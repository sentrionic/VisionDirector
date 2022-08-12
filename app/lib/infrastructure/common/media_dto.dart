import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vision_director/domain/common/media.dart';

part 'media_dto.freezed.dart';
part 'media_dto.g.dart';

@freezed
class MediaDto with _$MediaDto {
  const MediaDto._();

  const factory MediaDto({
    required String fileUrl,
    required String fileName,
    required String mimeType,
  }) = _MediaDto;

  factory MediaDto.fromDomain(Media media) {
    return MediaDto(
      fileUrl: media.fileUrl,
      fileName: media.fileName,
      mimeType: media.mimeType,
    );
  }

  Media toDomain() {
    return Media(
      fileUrl: fileUrl,
      fileName: fileName,
      mimeType: mimeType,
    );
  }

  factory MediaDto.fromJson(Map<String, dynamic> json) =>
      _$MediaDtoFromJson(json);
}

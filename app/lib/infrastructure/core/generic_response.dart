import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_response.freezed.dart';

@freezed
class GenericResponse with _$GenericResponse {
  const GenericResponse._();

  const factory GenericResponse({
    required String value,
  }) = _GenericResponse;

  factory GenericResponse.fromMap(Map<String, dynamic> json) =>
      GenericResponse(value: json['value']);
}

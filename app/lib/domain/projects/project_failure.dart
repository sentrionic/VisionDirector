import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_failure.freezed.dart';

@freezed
class ProjectFailure with _$ProjectFailure {
  const factory ProjectFailure.unexpected() = _Unexpected;
  const factory ProjectFailure.notFound() = _NotFound;
}

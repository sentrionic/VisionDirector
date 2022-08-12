import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_failure.freezed.dart';

@freezed
class TaskFailure with _$TaskFailure {
  const factory TaskFailure.unexpected() = _Unexpected;
}

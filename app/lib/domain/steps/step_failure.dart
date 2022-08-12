import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_failure.freezed.dart';

@freezed
class StepFailure with _$StepFailure {
  const factory StepFailure.unexpected() = _Unexpected;
  const factory StepFailure.tooLong() = _TooLong;
  const factory StepFailure.mediaChanged() = _MediaChanged;
}

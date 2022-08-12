import 'package:freezed_annotation/freezed_annotation.dart';

part 'scenario_failure.freezed.dart';

@freezed
class ScenarioFailure with _$ScenarioFailure {
  const factory ScenarioFailure.unexpected() = _Unexpected;
  const factory ScenarioFailure.fileTooLarge() = _FileTooLarge;
}

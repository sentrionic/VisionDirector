part of 'step_list_cubit.dart';

@freezed
class StepListState with _$StepListState {
  const factory StepListState.initial() = _Initial;
  const factory StepListState.loadInProgress() = _LoadInProgress;
  const factory StepListState.loadSuccess(List<Step> steps) = _LoadSuccess;
  const factory StepListState.loadFailure(StepFailure failure) = _LoadFailure;
}

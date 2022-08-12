import 'package:hydrated_bloc/hydrated_bloc.dart';

/// [CurrentStepCubit] stores the currently active item in the timeline.
class CurrentStepCubit extends HydratedCubit<String> {
  CurrentStepCubit() : super("");

  /// Emits the id of the currently active step.
  void setCurrent(String id) => emit(id);

  @override
  String? fromJson(Map<String, dynamic> json) => json['currentStep'] as String;

  @override
  Map<String, String> toJson(String state) => {'currentStep': state};
}

/// [CurrentStepCubit] stores the currently active item in the scenario preview.
class CurrentStepPreviewCubit extends Cubit<String> {
  CurrentStepPreviewCubit() : super("");

  /// Emits the id of the currently active step.
  void setCurrent(String id) => emit(id);
}

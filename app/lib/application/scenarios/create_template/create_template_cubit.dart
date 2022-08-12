import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/common/value_objects.dart';
import 'package:vision_director/domain/scenarios/i_scenario_repository.dart';
import 'package:vision_director/domain/scenarios/scenario_failure.dart';

part 'create_template_state.dart';
part 'create_template_cubit.freezed.dart';

/// [CreateTemplateCubit] handles the creation of a [Template].
@injectable
class CreateTemplateCubit extends Cubit<CreateTemplateState> {
  final IScenarioRepository _repository;
  CreateTemplateCubit(this._repository) : super(CreateTemplateState.initial());

  /// Updates the [CreateTemplateCubit]'s [TemplateName] value and resets the error.
  void nameChanged(String name) => emit(
        state.copyWith(
          name: TemplateName(name),
          scenarioFailureOrSuccessOption: none(),
        ),
      );

  /// Updates the [CreateTemplateCubit]'s [TemplateDescription] value and resets the error.
  void descriptionChanged(String description) => emit(
        state.copyWith(
          description: TemplateDescription(description),
          scenarioFailureOrSuccessOption: none(),
        ),
      );

  /// Submits the request to create the template.
  ///
  /// Emits [Unit] if successful and a [ScenarioFailure] otherwise.
  Future<void> submitCreateTemplate(String scenarioId) async {
    Either<ScenarioFailure, Unit>? failureOrSuccess;

    final isNameValid = state.name.isValid();
    final isDescriptionValid = state.description.isValid();

    if (isNameValid && isDescriptionValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          scenarioFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _repository.createTemplate(
        scenarioId,
        state.name.getOrCrash(),
        state.description.getOrCrash(),
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        scenarioFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}

part of 'create_template_cubit.dart';

@freezed
class CreateTemplateState with _$CreateTemplateState {
  const factory CreateTemplateState({
    required TemplateName name,
    required TemplateDescription description,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<ScenarioFailure, Unit>>
        scenarioFailureOrSuccessOption,
  }) = _CreateTemplateState;

  factory CreateTemplateState.initial() => CreateTemplateState(
        name: TemplateName(''),
        description: TemplateDescription(''),
        showErrorMessages: false,
        isSubmitting: false,
        scenarioFailureOrSuccessOption: none(),
      );
}

part of 'template_list_cubit.dart';

@freezed
class TemplateListState with _$TemplateListState {
  const factory TemplateListState.initial() = _Initial;
  const factory TemplateListState.loadInProgress() = _LoadInProgress;
  const factory TemplateListState.loadSuccess(
    List<Template> templates,
  ) = _LoadSuccess;
  const factory TemplateListState.loadFailure(ProjectFailure failure) =
      _LoadFailure;
}

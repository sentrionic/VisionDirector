import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/common/template.dart';
import 'package:vision_director/domain/projects/i_project_repository.dart';
import 'package:vision_director/domain/projects/project_failure.dart';

part 'template_list_state.dart';
part 'template_list_cubit.freezed.dart';

/// [TemplateListCubit] fetches the projects [Template]s.
@injectable
class TemplateListCubit extends Cubit<TemplateListState> {
  final IProjectRepository _repository;
  TemplateListCubit(this._repository)
      : super(const TemplateListState.initial());

  /// Fetches the templates fro the given [projectId].
  ///
  /// Returns a list of [Template]s or a [ProjectFailure]
  Future<void> getTemplates(String projectId) async {
    emit(const TemplateListState.loadInProgress());
    final failureOrTemplates = await _repository.getTemplates(projectId);
    emit(
      failureOrTemplates.fold(
        (f) => TemplateListState.loadFailure(f),
        (templates) => TemplateListState.loadSuccess(templates),
      ),
    );
  }
}

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/domain/common/collaborator.dart';
import 'package:vision_director/domain/projects/i_project_repository.dart';
import 'package:vision_director/domain/projects/project.dart';
import 'package:vision_director/domain/projects/project_failure.dart';
import 'package:vision_director/infrastructure/projects/project_dto.dart';

part 'project_list_state.dart';
part 'project_list_cubit.freezed.dart';

/// [ProjectListCubit] manages the user's [Project]s.
@injectable
class ProjectListCubit extends HydratedCubit<ProjectListState> {
  final IProjectRepository _repository;

  ProjectListCubit(this._repository) : super(const ProjectListState.initial());

  /// Fetches the user's projects.
  ///
  /// Returns a list of [Project]s or a [ProjectFailure]
  Future<void> getProjects() async {
    emit(const ProjectListState.loadInProgress());
    final failureOrProjects = await _repository.getProjectList();
    emit(
      failureOrProjects.fold(
        (f) => ProjectListState.loadFailure(f),
        (projects) => ProjectListState.loadSuccess(projects, ""),
      ),
    );
  }

  /// Adds a new [Project] to the [ProjectListState] and sets it as the new current project.
  void addNewProject(Project project) {
    state.maybeWhen(
      loadSuccess: (projects, _) => emit(
        ProjectListState.loadSuccess([project, ...projects], project.id),
      ),
      orElse: () {},
    );
  }

  /// Sets the given id as current [Project] in the [ProjectListState].
  void setCurrentProject(String id) {
    state.maybeWhen(
      loadSuccess: (projects, _) => emit(
        ProjectListState.loadSuccess([...projects], id),
      ),
      orElse: () {},
    );
  }

  /// Returns a list of [Collaborator]s for the currently active [Project].
  List<Collaborator> getProjectCollaborators() {
    return state.maybeWhen(
      loadSuccess: (projects, id) =>
          projects.where((p) => p.id == id).firstOrNull?.collaborators ?? [],
      orElse: () => [],
    );
  }

  /// Returns the currently active [Project] and null otherwise.
  Project? getCurrentProject() {
    return state.maybeWhen(
      loadSuccess: (projects, id) =>
          projects.where((p) => p.id == id).firstOrNull,
      orElse: () => null,
    );
  }

  @override
  ProjectListState? fromJson(Map<String, dynamic> json) {
    final jsonMap = json['projects'] as List<dynamic>;
    final id = json['projectId'] as String;
    final list = jsonMap.map((e) => ProjectDto.fromJson(e).toDomain()).toList();
    return ProjectListState.loadSuccess(list, id);
  }

  @override
  Map<String, dynamic>? toJson(ProjectListState state) {
    return state.maybeWhen(
      loadSuccess: (projects, id) => {
        'projects':
            projects.map((e) => ProjectDto.fromDomain(e).toJson()).toList(),
        "projectId": id,
      },
      orElse: () => null,
    );
  }
}

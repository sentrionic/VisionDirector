part of 'project_list_cubit.dart';

@freezed
class ProjectListState with _$ProjectListState {
  const factory ProjectListState.initial() = _Initial;
  const factory ProjectListState.loadInProgress() = _LoadInProgress;

  /// Successfully fetched the projects.
  ///
  /// * [projects] the list of projects the user is member of
  /// * [current] is the id of the currently open [Project]
  const factory ProjectListState.loadSuccess(
    List<Project> projects,
    String current,
  ) = _LoadSuccess;
  const factory ProjectListState.loadFailure(ProjectFailure failure) =
      _LoadFailure;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i9;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_status/auth_status_bloc.dart' as _i37;
import 'application/auth/change_password/change_password_cubit.dart' as _i38;
import 'application/auth/get_account/get_account_cubit.dart' as _i5;
import 'application/auth/login_form/login_form_cubit.dart' as _i21;
import 'application/auth/register_form/register_form_cubit.dart' as _i24;
import 'application/auth/update_account/update_account_cubit.dart' as _i33;
import 'application/projects/join_project/join_project_cubit.dart' as _i20;
import 'application/projects/project_list/project_list_cubit.dart' as _i23;
import 'application/projects/template_list/template_list_cubit.dart' as _i31;
import 'application/scenarios/create_scenario/create_scenario_cubit.dart'
    as _i41;
import 'application/scenarios/create_template/create_template_cubit.dart'
    as _i45;
import 'application/scenarios/edit_scenario/edit_scenario_cubit.dart' as _i47;
import 'application/scenarios/export_scenario/export_scenario/export_scenario_cubit.dart'
    as _i3;
import 'application/scenarios/export_scenario/setup_export/setup_export_cubit.dart'
    as _i26;
import 'application/scenarios/preview_scenario/preview_scenario_cubit.dart'
    as _i6;
import 'application/scenarios/scenario_list/scenario_list_cubit.dart' as _i25;
import 'application/scenarios/upload_video/upload_video_cubit.dart' as _i34;
import 'application/steps/create_step/create_step_cubit.dart' as _i42;
import 'application/steps/create_steps/create_steps_cubit.dart' as _i43;
import 'application/steps/delete_step/delete_step_cubit.dart' as _i46;
import 'application/steps/edit_step/edit_step_cubit.dart' as _i48;
import 'application/steps/record_audio/record_audio_cubit.dart' as _i7;
import 'application/steps/setup_media/setup_media_cubit.dart' as _i27;
import 'application/steps/step_list/step_list_cubit.dart' as _i28;
import 'application/steps/step_task_list/step_task_list_cubit.dart' as _i29;
import 'application/steps/toggle_multiple_steps/toggle_multiple_steps_cubit.dart'
    as _i32;
import 'application/steps/trim_video/trim_video_cubit.dart' as _i8;
import 'application/steps/user_steps/user_steps_cubit.dart' as _i35;
import 'application/tasks/comment_list/comment_list_cubit.dart' as _i39;
import 'application/tasks/create_comment/create_comment_cubit.dart' as _i40;
import 'application/tasks/create_task/create_task_cubit.dart' as _i44;
import 'application/tasks/edit_task/edit_task_cubit.dart' as _i49;
import 'application/tasks/main_task/main_task_cubit.dart' as _i22;
import 'application/tasks/task_list/task_list_cubit.dart' as _i30;
import 'application/tasks/user_tasks/user_tasks_cubit.dart' as _i36;
import 'domain/auth/i_auth_facade.dart' as _i10;
import 'domain/projects/i_project_repository.dart' as _i12;
import 'domain/scenarios/i_scenario_repository.dart' as _i14;
import 'domain/steps/i_step_repository.dart' as _i16;
import 'domain/tasks/i_task_repository.dart' as _i18;
import 'infrastructure/auth/auth_facade.dart' as _i11;
import 'infrastructure/core/injectable_module.dart' as _i50;
import 'infrastructure/projects/project_repository.dart' as _i13;
import 'infrastructure/scenarios/scenario_repository.dart' as _i15;
import 'infrastructure/steps/step_repository.dart' as _i17;
import 'infrastructure/tasks/task_repository.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.factory<_i3.ExportScenarioCubit>(() => _i3.ExportScenarioCubit());
  gh.lazySingleton<_i4.FlutterSecureStorage>(() => injectableModule.storage());
  gh.factory<_i5.GetAccountCubit>(() => _i5.GetAccountCubit());
  gh.factory<_i6.PreviewScenarioCubit>(() => _i6.PreviewScenarioCubit());
  gh.factory<_i7.RecordAudioCubit>(() => _i7.RecordAudioCubit());
  gh.factory<String>(() => injectableModule.baseUrl, instanceName: 'BaseUrl');
  gh.factory<String>(() => injectableModule.httpUrl, instanceName: 'HttpUrl');
  gh.factory<String>(() => injectableModule.wsUrl, instanceName: 'WSUrl');
  gh.factory<String>(() => injectableModule.chatUrl, instanceName: 'ChatUrl');
  gh.factory<_i8.TrimVideoCubit>(() => _i8.TrimVideoCubit());
  gh.lazySingleton<_i9.Dio>(() => injectableModule.dio(
      get<String>(instanceName: 'HttpUrl'), get<_i4.FlutterSecureStorage>()));
  gh.lazySingleton<_i10.IAuthFacade>(
      () => _i11.AuthFacade(get<_i9.Dio>(), get<_i4.FlutterSecureStorage>()));
  gh.lazySingleton<_i12.IProjectRepository>(
      () => _i13.ProjectRepository(get<_i9.Dio>()));
  gh.lazySingleton<_i14.IScenarioRepository>(
      () => _i15.ScenarioRepository(get<_i9.Dio>()));
  gh.lazySingleton<_i16.IStepRepository>(
      () => _i17.StepRepository(get<_i9.Dio>()));
  gh.lazySingleton<_i18.ITaskRepository>(
      () => _i19.TaskRepository(get<_i9.Dio>()));
  gh.factory<_i20.JoinProjectCubit>(
      () => _i20.JoinProjectCubit(get<_i12.IProjectRepository>()));
  gh.factory<_i21.LoginFormCubit>(
      () => _i21.LoginFormCubit(get<_i10.IAuthFacade>()));
  gh.factory<_i22.MainTaskCubit>(
      () => _i22.MainTaskCubit(get<_i18.ITaskRepository>()));
  gh.factory<_i23.ProjectListCubit>(
      () => _i23.ProjectListCubit(get<_i12.IProjectRepository>()));
  gh.factory<_i24.RegisterFormCubit>(
      () => _i24.RegisterFormCubit(get<_i10.IAuthFacade>()));
  gh.factory<_i25.ScenarioListCubit>(
      () => _i25.ScenarioListCubit(get<_i14.IScenarioRepository>()));
  gh.factory<_i26.SetupExportCubit>(
      () => _i26.SetupExportCubit(get<_i16.IStepRepository>()));
  gh.factory<_i27.SetupMediaCubit>(
      () => _i27.SetupMediaCubit(get<_i16.IStepRepository>()));
  gh.factory<_i28.StepListCubit>(
      () => _i28.StepListCubit(get<_i16.IStepRepository>()));
  gh.factory<_i29.StepTaskListCubit>(
      () => _i29.StepTaskListCubit(get<_i16.IStepRepository>()));
  gh.factory<_i30.TaskListCubit>(
      () => _i30.TaskListCubit(get<_i18.ITaskRepository>()));
  gh.factory<_i31.TemplateListCubit>(
      () => _i31.TemplateListCubit(get<_i12.IProjectRepository>()));
  gh.factory<_i32.ToggleMultipleStepsCubit>(
      () => _i32.ToggleMultipleStepsCubit(get<_i16.IStepRepository>()));
  gh.factory<_i33.UpdateAccountCubit>(
      () => _i33.UpdateAccountCubit(get<_i10.IAuthFacade>()));
  gh.factory<_i34.UploadVideoCubit>(
      () => _i34.UploadVideoCubit(get<_i14.IScenarioRepository>()));
  gh.factory<_i35.UserStepsCubit>(
      () => _i35.UserStepsCubit(get<_i16.IStepRepository>()));
  gh.factory<_i36.UserTasksCubit>(
      () => _i36.UserTasksCubit(get<_i18.ITaskRepository>()));
  gh.factory<_i37.AuthStatusBloc>(
      () => _i37.AuthStatusBloc(get<_i10.IAuthFacade>()));
  gh.factory<_i38.ChangePasswordCubit>(
      () => _i38.ChangePasswordCubit(get<_i10.IAuthFacade>()));
  gh.factory<_i39.CommentListCubit>(
      () => _i39.CommentListCubit(get<_i18.ITaskRepository>()));
  gh.factory<_i40.CreateCommentCubit>(
      () => _i40.CreateCommentCubit(get<_i18.ITaskRepository>()));
  gh.factory<_i41.CreateScenarioCubit>(
      () => _i41.CreateScenarioCubit(get<_i14.IScenarioRepository>()));
  gh.factory<_i42.CreateStepCubit>(
      () => _i42.CreateStepCubit(get<_i16.IStepRepository>()));
  gh.factory<_i43.CreateStepsCubit>(
      () => _i43.CreateStepsCubit(get<_i16.IStepRepository>()));
  gh.factory<_i44.CreateTaskCubit>(
      () => _i44.CreateTaskCubit(get<_i18.ITaskRepository>()));
  gh.factory<_i45.CreateTemplateCubit>(
      () => _i45.CreateTemplateCubit(get<_i14.IScenarioRepository>()));
  gh.factory<_i46.DeleteStepCubit>(
      () => _i46.DeleteStepCubit(get<_i16.IStepRepository>()));
  gh.factory<_i47.EditScenarioCubit>(
      () => _i47.EditScenarioCubit(get<_i14.IScenarioRepository>()));
  gh.factory<_i48.EditStepCubit>(
      () => _i48.EditStepCubit(get<_i16.IStepRepository>()));
  gh.factory<_i49.EditTaskCubit>(
      () => _i49.EditTaskCubit(get<_i18.ITaskRepository>()));
  return get;
}

class _$InjectableModule extends _i50.InjectableModule {}

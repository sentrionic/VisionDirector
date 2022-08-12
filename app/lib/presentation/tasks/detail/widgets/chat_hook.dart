import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/application/tasks/comment_list/comment_list_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/infrastructure/common/comment_dto.dart';
import 'package:vision_director/injection.dart';

/// [Hook] to connect to the SignelR server and receive websocket events.
///
/// * [context] is the BuildContext providing [StepListCubit] and [ScenarioListCubit].
/// * [scenarioId] is the id of the scenario which should receive events.
/// * [taskId] is the id of the task which should receive events.
void useChatHook(BuildContext context, String scenarioId, String taskId) {
  return use(_SocketHook(context, scenarioId, taskId));
}

class _SocketHook extends Hook<void> {
  final BuildContext context;
  final String scenarioId;
  final String taskId;
  const _SocketHook(this.context, this.scenarioId, this.taskId);

  @override
  _SocketHookState createState() => _SocketHookState();
}

class _SocketHookState extends HookState<void, _SocketHook> {
  late HubConnection connection;
  final url = getIt<String>(instanceName: "ChatUrl");
  final storage = getIt<FlutterSecureStorage>();

  @override
  Future<void> initHook() async {
    super.initHook();

    final options = HttpConnectionOptions(
      accessTokenFactory: () async =>
          (await storage.read(key: AppConstants.tokenKey))!,
    );

    connection = HubConnectionBuilder()
        .withUrl(
          "$url?scenarioId=${hook.scenarioId}&taskId=${hook.taskId}",
          options: options,
        )
        .withAutomaticReconnect()
        .build();
    await connection.start();

    // Arguments is of form
    // [{CommentDto}]
    connection.on("ReceiveComment", (arguments) {
      if (arguments != null) {
        final json = arguments.first as Map<String, dynamic>;
        final comment = CommentDto.fromJson(json).toDomain();
        context.read<CommentListCubit>().addComment(comment);
      }
    });
  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() {
    connection.onclose(({Exception? error}) => debugPrint("Connection Closed"));
    super.dispose();
  }
}

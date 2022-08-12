import 'package:flutter/material.dart' hide Step;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:vision_director/application/scenarios/scenario_list/scenario_list_cubit.dart';
import 'package:vision_director/application/steps/step_list/step_list_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/domain/steps/step.dart';
import 'package:vision_director/infrastructure/scenarios/scenario_dto.dart';
import 'package:vision_director/infrastructure/steps/step_dto.dart';
import 'package:vision_director/injection.dart';

/// [Hook] to connect to the SignelR server and receive websocket events.
///
/// * [context] is the BuildContext providing [StepListCubit] and [ScenarioListCubit].
/// * [scenarioId] is the id of the scenario which should receive events.
void useSocketHook(BuildContext context, String scenarioId) {
  return use(_SocketHook(context, scenarioId));
}

class _SocketHook extends Hook<void> {
  final BuildContext context;
  final String scenarioId;
  const _SocketHook(this.context, this.scenarioId);

  @override
  _SocketHookState createState() => _SocketHookState();
}

class _SocketHookState extends HookState<void, _SocketHook> {
  late HubConnection connection;
  final url = getIt<String>(instanceName: "WSUrl");
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
          "$url?scenarioId=${hook.scenarioId}",
          options: options,
        )
        .withAutomaticReconnect()
        .build();
    await connection.start();

    // Arguments is of form
    // [{StepDto}]
    connection.on("ChangePosition", (arguments) {
      if (arguments != null) {
        final json = arguments.first as Map<String, dynamic>;
        final step = StepDto.fromJson(json).toDomain();
        context.read<StepListCubit>().updateStepPositions(step);
      }
    });

    // Arguments is of form
    // [[{StepDto}]]
    connection.on("AddSteps", (arguments) {
      if (arguments != null) {
        final results = arguments.first as List<dynamic>;
        final List<Step> list = [];
        for (final step in results) {
          list.add(StepDto.fromJson(step).toDomain());
        }
        context.read<StepListCubit>().addNewSteps(list);
      }
    });

    connection.on("EditStep", (arguments) {
      if (arguments != null) {
        final json = arguments.first as Map<String, dynamic>;
        final step = StepDto.fromJson(json).toDomain();
        context.read<StepListCubit>().updateStep(step);
      }
    });

    connection.on("EditSteps", (arguments) {
      if (arguments != null) {
        final results = arguments.first as List<dynamic>;
        final List<Step> list = [];
        for (final step in results) {
          list.add(StepDto.fromJson(step).toDomain());
        }
        context.read<StepListCubit>().updateSteps(list);
      }
    });

    connection.on("RemoveStep", (arguments) {
      if (arguments != null) {
        final json = arguments.first as Map<String, dynamic>;
        final step = StepDto.fromJson(json).toDomain();
        context.read<StepListCubit>().removeStep(step);
      }
    });

    connection.on("ToggleLock", (arguments) {
      if (arguments != null) {
        final json = arguments.first as Map<String, dynamic>;
        final step = StepDto.fromJson(json).toDomain();
        context
            .read<StepListCubit>()
            .toggleStepLock(step.id, isLocked: step.isLocked);
      }
    });

    connection.on("UpdateScenario", (arguments) {
      if (arguments != null) {
        final json = arguments.first as Map<String, dynamic>;
        final scenario = ScenarioDto.fromJson(json).toDomain();
        context.read<ScenarioListCubit>().updateScenario(scenario);
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

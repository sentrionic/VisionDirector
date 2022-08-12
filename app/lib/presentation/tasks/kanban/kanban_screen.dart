import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/tasks/task_list/task_list_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/tasks/kanban/widgets/kanban_list_body.dart';

class KanbanScreen extends StatefulWidget {
  static const routeName = '/kanban';

  final Scenario scenario;
  const KanbanScreen({super.key, required this.scenario});

  @override
  State<KanbanScreen> createState() => _KanbanScreenState();
}

class _KanbanScreenState extends State<KanbanScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Used to display the tasks
      create: (_) => getIt<TaskListCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Kanban - ${widget.scenario.name.getOrCrash()}"),
        ),
        body: const KanbanListBody(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // Set the screen orientation to landscape for more space
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    // Return to the default orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}

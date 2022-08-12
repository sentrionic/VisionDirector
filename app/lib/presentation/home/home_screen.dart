import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/auth/auth_status/auth_status_bloc.dart';
import 'package:vision_director/application/auth/get_account/get_account_cubit.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/auth/start_up_screen.dart';
import 'package:vision_director/presentation/common/step_widgets/guidelines_screen.dart';
import 'package:vision_director/presentation/common/widgets/card_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/home/screens/tutorials_screen.dart';
import 'package:vision_director/presentation/home/screens/user_steps_screen.dart';
import 'package:vision_director/presentation/home/screens/user_tasks_screen.dart';
import 'package:vision_director/presentation/home/screens/vision_video_screen.dart';
import 'package:vision_director/presentation/home/widgets/home_drawer.dart';
import 'package:vision_director/presentation/projects/overview/project_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // Used for getting the user's account details
          create: (_) => getIt<GetAccountCubit>(),
        ),
        // Used for editing user's tasks and steps
        BlocProvider(create: (_) => getIt<ProjectListCubit>()..getProjects()),
      ],
      child: const _HomeScreenBody(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> drawerKey = GlobalKey();
    return BlocListener<AuthStatusBloc, AuthStatusState>(
      listener: (context, state) {
        state.maybeMap(
          unauthenticated: (_) => Navigator.of(context).pushReplacementNamed(
            StartUpScreen.routeName,
          ),
          orElse: () {},
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: drawerKey,
        appBar: AppBar(
          title: const Text("Home"),
          leading: IconButton(
            tooltip: "Open Drawer",
            icon: const Icon(Icons.menu),
            onPressed: () => drawerKey.currentState!.openDrawer(),
          ),
        ),
        drawer: const HomeDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "My Work",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CardWrapper(
              child: ListTile(
                leading: const Icon(Icons.inbox),
                title: const Text("Projects"),
                onTap: () => Navigator.of(context).pushNamed(
                  ProjectScreen.routeName,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: InfoLabel(label: "Overview"),
            ),
            CardWrapper(
              child: ListTile(
                leading: const Icon(Icons.task),
                title: const Text("Tasks"),
                onTap: () => Navigator.of(context).pushNamed(
                  UserTasksScreen.routeName,
                ),
              ),
            ),
            CardWrapper(
              child: ListTile(
                leading: const Icon(Icons.supervisor_account),
                title: const Text("Assigned Steps"),
                onTap: () => Navigator.of(context).pushNamed(
                  UserStepsScreen.routeName,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: InfoLabel(label: "General Info"),
            ),
            CardWrapper(
              child: ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text("Guidelines"),
                onTap: () => Navigator.of(context).pushNamed(
                  GuidelinesScreen.routeName,
                ),
              ),
            ),
            CardWrapper(
              child: ListTile(
                leading: const Icon(Icons.video_settings),
                title: const Text("Vision Videos"),
                onTap: () => Navigator.of(context).pushNamed(
                  VisionVideoScreen.routeName,
                ),
              ),
            ),
            CardWrapper(
              child: ListTile(
                leading: const Icon(Icons.auto_stories_outlined),
                title: const Text("Tutorials"),
                onTap: () => Navigator.of(context).pushNamed(
                  TutorialsScreen.routeName,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

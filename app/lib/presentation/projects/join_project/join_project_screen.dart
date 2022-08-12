import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/join_project/join_project_cubit.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/projects/join_project/widgets/join_project_form.dart';

class JoinProjectScreen extends StatelessWidget {
  static const routeName = '/join-project';

  const JoinProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for joining a new project
        BlocProvider(create: (_) => getIt<JoinProjectCubit>()),
        // Used for adding the new project to the state
        BlocProvider(create: (_) => getIt<ProjectListCubit>()),
      ],
      child: const JoinProjectForm(),
    );
  }
}

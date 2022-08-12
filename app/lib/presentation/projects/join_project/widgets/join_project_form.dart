import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/join_project/join_project_cubit.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/linear_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/long_button.dart';
import 'package:vision_director/presentation/core/screen_arguments/project_argument.dart';
import 'package:vision_director/presentation/scenarios/overview/scenario_screen.dart';

class JoinProjectForm extends StatelessWidget {
  const JoinProjectForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<JoinProjectCubit, JoinProjectState>(
      listener: (context, state) {
        state.projectFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  notFound: (_) => "No project with that token found",
                  orElse: () => "Server Error. Try again later.",
                ),
              ).show(context);
            },
            (project) {
              // Add the new project to the state by returning it as a result.
              Navigator.of(context).pushReplacementNamed(
                ScenarioScreen.routeName,
                result: project,
                arguments: ProjectArgument(project),
              );
            },
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Join Project"),
          leading: IconButton(
            tooltip: "Close",
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: BlocBuilder<JoinProjectCubit, JoinProjectState>(
          builder: (context, state) => SizedBox.expand(
            child: Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: FormWrapper(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Do you have an invite?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Start collaborating by joining a project",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Invite token',
                    ),
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(fontSize: 18),
                    autocorrect: false,
                    onChanged: (value) =>
                        context.read<JoinProjectCubit>().linkChanged(value),
                    validator: (_) => context
                        .read<JoinProjectCubit>()
                        .state
                        .inviteLink
                        .value
                        .fold(
                          (f) => f.maybeMap(
                            empty: (_) => 'An invite link or code is required',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "INVITES SHOULD LOOK LIKE THIS",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "effa2\n40811\nf3515",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LongButton(
                    onClick: () =>
                        context.read<JoinProjectCubit>().submitJoinProject(),
                    label: "Join",
                  ),
                  if (state.isSubmitting) const LinearLoadingIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/projects/project_list/project_list_cubit.dart';
import 'package:vision_director/presentation/common/widgets/player_wrapper.dart';

/// Displays a preview of how the automatically generated credits will look like in the final video.
class CreditsPreview extends StatelessWidget {
  const CreditsPreview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final collaborators =
        context.read<ProjectListCubit>().getProjectCollaborators();

    return PlayerWrapper(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Text(
              "Produced with the help of:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final collaborator = collaborators[index];
                  return Column(
                    children: [
                      Text(collaborator.username),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  );
                },
                itemCount: collaborators.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

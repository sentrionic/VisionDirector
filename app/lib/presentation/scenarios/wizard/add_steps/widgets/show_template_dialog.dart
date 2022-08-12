import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/projects/template_list/template_list_cubit.dart';
import 'package:vision_director/domain/common/media.dart';
import 'package:vision_director/domain/common/template.dart';
import 'package:vision_director/domain/projects/project.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/step_widgets/icon_label.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';
import 'package:vision_director/presentation/common/widgets/card_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';

class ShowTemplatesDialog extends StatelessWidget {
  final Project project;
  const ShowTemplatesDialog({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TemplateListCubit>()..getTemplates(project.id),
      child: const _ShowTemplatesBody(),
    );
  }
}

class _ShowTemplatesBody extends HookWidget {
  const _ShowTemplatesBody();

  @override
  Widget build(BuildContext context) {
    final template = useState<Template?>(null);
    final isExpanded = useState(false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Templates"),
        actions: [
          IconButton(
            tooltip: "Select",
            onPressed: () => Navigator.of(context).pop(template.value),
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: BlocBuilder<TemplateListCubit, TemplateListState>(
        builder: (context, state) => state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const CenterLoadingIndicator(),
          loadSuccess: (state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const InfoLabel(label: "Select Template"),
                        const SizedBox(
                          height: 5,
                        ),
                        // Edit Status
                        DropdownButtonFormField(
                          hint: const Text("Templates"),
                          items: [
                            ...state.templates
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name.getOrCrash()),
                                  ),
                                )
                                .toList()
                          ],
                          value: template.value,
                          onChanged: (value) =>
                              template.value = value as Template?,
                        ),
                        if (template.value != null) ...[
                          const SizedBox(
                            height: 20,
                          ),
                          const InfoLabel(label: "Description"),
                          const SizedBox(
                            height: 5,
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 500),
                            child: ConstrainedBox(
                              constraints: isExpanded.value
                                  ? const BoxConstraints()
                                  : const BoxConstraints(maxHeight: 50.0),
                              child: Text(
                                template.value!.description
                                    .getValue()
                                    .replaceAll("  ", ""),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                          TextButton(
                            child: Text(
                              isExpanded.value ? "Show Less" : "Show More",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () =>
                                isExpanded.value = !isExpanded.value,
                          ),
                        ],
                        const SpacedDivider(),
                      ],
                    ),
                  ),
                  if (template.value != null) ...[
                    const Text(
                      "Template Steps",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final step = template.value!.steps[index];
                        return CardWrapper(
                          child: ListTile(
                            minLeadingWidth: 0,
                            leading: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "${step.position + 1}.",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            title: Text(step.name),
                            subtitle: Text(
                              getDurationString(step.duration),
                            ),
                            trailing: step.media != null
                                ? IconLabel(
                                    icon: _getMediaIcon(step.media),
                                    isSet: step.media != null,
                                    label: _getMediaLabel(step.media),
                                  )
                                : null,
                          ),
                        );
                      },
                      itemCount: template.value!.steps.length,
                    ),
                  ],
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
          loadFailure: (_) => const ErrorIndicator(),
        ),
      ),
    );
  }

  IconData _getMediaIcon(Media? media) {
    if (media == null) return Icons.attach_file;
    final mimeType = media.mimeType;
    if (mimeType.contains("video")) return Icons.video_collection_rounded;
    if (mimeType.contains("image")) return Icons.image;
    return Icons.question_mark;
  }

  String _getMediaLabel(Media? media) {
    if (media == null) return "Media";
    final mimeType = media.mimeType;
    if (mimeType.contains("video")) return "Video";
    if (mimeType.contains("image")) return "Image";
    return "Unknown";
  }
}

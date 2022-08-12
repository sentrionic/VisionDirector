import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/scenarios/export_scenario/export_scenario/export_scenario_cubit.dart';
import 'package:vision_director/application/scenarios/upload_video/upload_video_cubit.dart';
import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/steps/export/upload/widgets/upload_video_body.dart';

class UploadVideoScreen extends StatelessWidget {
  static const routeName = '/upload-video';

  final Scenario scenario;
  final File video;
  const UploadVideoScreen({
    super.key,
    required this.scenario,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Used for uploading the vision video.
        BlocProvider(create: (_) => getIt<UploadVideoCubit>()),
        // Used to clean up the temp directory.
        BlocProvider(create: (_) => getIt<ExportScenarioCubit>()..initialize()),
      ],
      child: UploadVideoBody(
        scenario: scenario,
        video: video,
      ),
    );
  }
}

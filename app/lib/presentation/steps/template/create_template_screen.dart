import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/scenarios/create_template/create_template_cubit.dart';

import 'package:vision_director/domain/scenarios/scenario.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/steps/template/widgets/create_template_form.dart';

class CreateTemplateScreen extends StatelessWidget {
  static const routeName = "/create-template";

  final Scenario scenario;
  const CreateTemplateScreen({
    super.key,
    required this.scenario,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateTemplateCubit>(),
      child: CreateTemplateForm(scenario: scenario),
    );
  }
}

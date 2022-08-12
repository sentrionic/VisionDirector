import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/utils/setup_hive.dart';
import 'package:vision_director/presentation/core/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection(Environment.prod);

  // Set the default orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  setupHive();

  // Init the cache
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const AppWidget()),
    storage: storage,
  );
}

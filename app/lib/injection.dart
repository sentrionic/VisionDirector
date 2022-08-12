import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vision_director/injection.config.dart';

/// The Singleton instance of GetIt
final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) => $initGetIt(getIt, environment: env);

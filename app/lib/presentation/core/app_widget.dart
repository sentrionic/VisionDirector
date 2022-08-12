import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vision_director/application/auth/auth_status/auth_status_bloc.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/core/app_router.dart';
import 'package:vision_director/presentation/core/app_theme.dart';

/// Entry point to the application. Configures the [MaterialApp].
class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthStatusBloc>()
            ..add(const AuthStatusEvent.authCheckRequested()),
        ),
      ],
      child: MaterialApp(
        title: 'Vision Director',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: appRouter.onGenerateRoute,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          // Locale('de', ''),
        ],
      ),
    );
  }
}

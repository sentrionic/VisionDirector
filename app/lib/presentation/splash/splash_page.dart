import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/auth/auth_status/auth_status_bloc.dart';
import 'package:vision_director/presentation/auth/start_up_screen.dart';
import 'package:vision_director/presentation/home/home_screen.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthStatusBloc, AuthStatusState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
          unauthenticated: (_) {
            Navigator.pushReplacementNamed(context, StartUpScreen.routeName);
          },
        );
      },
      child: const Scaffold(
        body: Center(
          child: Image(
            height: 120,
            image: AssetImage('assets/logo.png'),
          ),
        ),
      ),
    );
  }
}

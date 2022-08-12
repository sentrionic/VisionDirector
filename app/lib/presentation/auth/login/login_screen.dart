import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/auth/get_account/get_account_cubit.dart';
import 'package:vision_director/application/auth/login_form/login_form_cubit.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/auth/login/login_form.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.appBackground,
      ),
      body: MultiBlocProvider(
        providers: [
          // Used to sign in the user
          BlocProvider(create: (_) => getIt<LoginFormCubit>()),
          // Used for storing the user's account info
          BlocProvider(create: (_) => getIt<GetAccountCubit>()),
        ],
        child: const LoginForm(),
      ),
    );
  }
}

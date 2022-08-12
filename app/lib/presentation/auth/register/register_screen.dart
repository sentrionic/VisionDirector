import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/auth/get_account/get_account_cubit.dart';
import 'package:vision_director/application/auth/register_form/register_form_cubit.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/auth/register/register_form.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.appBackground,
      ),
      body: MultiBlocProvider(
        providers: [
          // Used to register the user
          BlocProvider(create: (_) => getIt<RegisterFormCubit>()),
          // Used for storing the user's account info
          BlocProvider(create: (_) => getIt<GetAccountCubit>()),
        ],
        child: const RegisterForm(),
      ),
    );
  }
}

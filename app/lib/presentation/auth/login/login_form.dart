import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/auth/auth_status/auth_status_bloc.dart';
import 'package:vision_director/application/auth/get_account/get_account_cubit.dart';
import 'package:vision_director/application/auth/login_form/login_form_cubit.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/linear_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/long_button.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';
import 'package:vision_director/presentation/home/home_screen.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final showPassword = useState(false);
    return BlocConsumer<LoginFormCubit, LoginFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  invalidCredentials: (_) => l10n.invalidCredentials,
                  orElse: () => l10n.serverError,
                ),
              ).show(context);
            },
            (account) {
              // Store the account and go to the projects page
              context.read<GetAccountCubit>().setAccount(account);
              context
                  .read<AuthStatusBloc>()
                  .add(const AuthStatusEvent.authCheckRequested());
              Navigator.of(context).pushNamedAndRemoveUntil(
                HomeScreen.routeName,
                (p) => false,
              );
            },
          ),
        );
      },
      builder: (context, state) {
        return Container(
          color: ThemeColors.appBackground,
          height: double.infinity,
          child: Form(
            autovalidateMode: state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: FormWrapper(
              children: [
                Text(
                  l10n.welcomeBack,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  l10n.loginHeader,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) =>
                      context.read<LoginFormCubit>().emailChanged(value),
                  validator: (_) => context
                      .read<LoginFormCubit>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (f) => f.maybeMap(
                          invalidEmail: (_) => l10n.invalidEmail,
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: l10n.password,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: GestureDetector(
                        onTap: () => showPassword.value = !showPassword.value,
                        child: Icon(
                          showPassword.value
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                  autocorrect: false,
                  obscureText: !showPassword.value,
                  onChanged: (value) =>
                      context.read<LoginFormCubit>().passwordChanged(value),
                  validator: (_) =>
                      context.read<LoginFormCubit>().state.password.value.fold(
                            (f) => f.maybeMap(
                              shortPassword: (_) => l10n.shortPasswordError,
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                ),
                const SizedBox(
                  height: 20,
                ),
                LongButton(
                  label: "Login",
                  onClick: () => context.read<LoginFormCubit>().loginPressed(),
                ),
                if (state.isSubmitting) const LinearLoadingIndicator()
              ],
            ),
          ),
        );
      },
    );
  }
}

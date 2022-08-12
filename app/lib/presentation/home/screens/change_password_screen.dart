import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vision_director/application/auth/change_password/change_password_cubit.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/saving_progress_overlay.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const routeName = "/change-password";

  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChangePasswordCubit>(),
      child: _ChangePasswordForm(),
    );
  }
}

class _ChangePasswordForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final showCurrentPassword = useState(false);
    final showNewPassword = useState(false);
    final showConfirmNewPassword = useState(false);
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  passwordsDontMatch: (_) => "The new passwords do not match",
                  orElse: () => "Server Error.",
                ),
              ).show(context);
            },
            (_) {
              buildSuccesFlushbar(
                message: "Successfully changed your password",
              ).show(context);
            },
          ),
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text("Change Password"),
                actions: [
                  IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context
                          .read<ChangePasswordCubit>()
                          .submitPasswordChange();
                    },
                    icon: const Icon(Icons.save),
                  ),
                ],
              ),
              body: Form(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: FormWrapper(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Current Password',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: GestureDetector(
                            onTap: () => showCurrentPassword.value =
                                !showCurrentPassword.value,
                            child: Icon(
                              showCurrentPassword.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      autocorrect: false,
                      obscureText: !showCurrentPassword.value,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => context
                          .read<ChangePasswordCubit>()
                          .currentPasswordChanged(value),
                      validator: (_) => context
                          .read<ChangePasswordCubit>()
                          .state
                          .currentPassword
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              shortPassword: (_) => 'Short Password',
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
                        labelText: 'New Password',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: GestureDetector(
                            onTap: () =>
                                showNewPassword.value = !showNewPassword.value,
                            child: Icon(
                              showNewPassword.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                      obscureText: !showNewPassword.value,
                      onChanged: (value) => context
                          .read<ChangePasswordCubit>()
                          .newPasswordChanged(value),
                      validator: (_) => context
                          .read<ChangePasswordCubit>()
                          .state
                          .newPassword
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              shortPassword: (_) => 'Short Password',
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
                        labelText: 'Confirm New Password',
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: GestureDetector(
                            onTap: () => showConfirmNewPassword.value =
                                !showConfirmNewPassword.value,
                            child: Icon(
                              showConfirmNewPassword.value
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      autocorrect: false,
                      obscureText: !showConfirmNewPassword.value,
                      onChanged: (value) => context
                          .read<ChangePasswordCubit>()
                          .confirmNewPasswordChanged(value),
                      validator: (_) => context
                          .read<ChangePasswordCubit>()
                          .state
                          .confirmNewPassword
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              passwordsDontMatch: (_) =>
                                  "Passwords don't match",
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            SavingInProgressOverlay(isSaving: state.isSubmitting),
          ],
        );
      },
    );
  }
}

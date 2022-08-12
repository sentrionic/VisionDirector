import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/auth/get_account/get_account_cubit.dart';
import 'package:vision_director/application/auth/update_account/update_account_cubit.dart';
import 'package:vision_director/domain/auth/account.dart';
import 'package:vision_director/injection.dart';
import 'package:vision_director/presentation/common/utils/flushbar_creator.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';
import 'package:vision_director/presentation/common/widgets/form_wrapper.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/saving_progress_overlay.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';

class UpdateAccountScreen extends StatelessWidget {
  static const routeName = "/update-account";

  final Account account;
  const UpdateAccountScreen({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<GetAccountCubit>()),
        BlocProvider(
          create: (_) => getIt<UpdateAccountCubit>()..initialize(account),
        ),
      ],
      child: const _UpdateAccountForm(),
    );
  }
}

class _UpdateAccountForm extends StatelessWidget {
  const _UpdateAccountForm();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<UpdateAccountCubit, UpdateAccountState>(
      listener: (context, state) {
        state.saveFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              buildErrorFlushbar(
                message: failure.maybeMap(
                  orElse: () => l10n.serverError,
                ),
              ).show(context);
            },
            (account) {
              // Store the account and go to the projects page
              context.read<GetAccountCubit>().setAccount(account);
              buildSuccesFlushbar(
                message: "Successfully updated your account.",
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
                title: const Text("Update Account"),
                actions: [
                  IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      context.read<UpdateAccountCubit>().updateAccount();
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
                      height: 30,
                    ),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: ThemeColors.themeBlue,
                      child: Text(
                        getInitials(state.username.getOrCrash()),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InfoLabel(label: l10n.registerNameLabel),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      initialValue: state.username.getOrCrash(),
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => context
                          .read<UpdateAccountCubit>()
                          .usernameChanged(value),
                      validator: (_) => context
                          .read<UpdateAccountCubit>()
                          .state
                          .username
                          .value
                          .fold(
                            (f) => f.maybeMap(
                              invalidUsername: (_) => l10n.invalidUsernameError,
                              orElse: () => null,
                            ),
                            (_) => null,
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InfoLabel(label: l10n.accountInformationLabel),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      initialValue: state.emailAddress.getOrCrash(),
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => context
                          .read<UpdateAccountCubit>()
                          .emailChanged(value),
                      validator: (_) => context
                          .read<UpdateAccountCubit>()
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
                  ],
                ),
              ),
            ),
            SavingInProgressOverlay(isSaving: state.isSaving),
          ],
        );
      },
    );
  }
}

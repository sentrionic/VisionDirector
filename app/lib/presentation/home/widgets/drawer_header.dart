import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/auth/get_account/get_account_cubit.dart';
import 'package:vision_director/domain/auth/account.dart';
import 'package:vision_director/presentation/common/utils/utils.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

class HomeDrawerHeader extends StatelessWidget {
  const HomeDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAccountCubit, Account>(
      builder: (context, state) {
        final name = state.email.getOrCrash();
        return UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundColor: ThemeColors.themeBlue,
            child: Text(
              getInitials(state.username.getOrCrash()),
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          accountEmail: Text(
            name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          accountName: Text(
            state.username.getOrCrash(),
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        );
      },
    );
  }
}

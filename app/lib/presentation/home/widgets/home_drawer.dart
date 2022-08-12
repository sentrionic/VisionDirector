import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vision_director/application/auth/auth_status/auth_status_bloc.dart';
import 'package:vision_director/application/auth/get_account/get_account_cubit.dart';
import 'package:vision_director/domain/auth/account.dart';
import 'package:vision_director/presentation/core/screen_arguments/account_argument.dart';
import 'package:vision_director/presentation/home/screens/change_password_screen.dart';
import 'package:vision_director/presentation/home/screens/privacy_screen.dart';
import 'package:vision_director/presentation/home/screens/update_account_screen.dart';
import 'package:vision_director/presentation/home/widgets/drawer_header.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const HomeDrawerHeader(),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20,
            ),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Divider(
            height: 10,
            thickness: 1,
          ),
          BlocBuilder<GetAccountCubit, Account>(
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.manage_accounts),
                title: const Text(
                  'Update Account',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed(
                  UpdateAccountScreen.routeName,
                  arguments: AccountArgument(state),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.password),
            title: const Text(
              'Change Password',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed(
              ChangePasswordScreen.routeName,
            ),
          ),
          const Divider(
            height: 10,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text(
              'Privacy',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () => Navigator.of(context).pushNamed(
              PrivacyScreen.routeName,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: const Text(
              'Contact',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () => _launchURL(),
          ),
          const Divider(
            height: 10,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () => context.read<AuthStatusBloc>().add(
                  const AuthStatusEvent.signedOut(),
                ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL() async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: 'vision_directory@support.com',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}

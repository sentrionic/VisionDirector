import 'package:flutter/material.dart';
import 'package:vision_director/presentation/auth/login/login_screen.dart';
import 'package:vision_director/presentation/auth/register/register_screen.dart';
import 'package:vision_director/presentation/common/widgets/long_button.dart';
import 'package:vision_director/presentation/core/app_colors.dart';
import 'package:vision_director/presentation/core/l10n/l10n.dart';

class StartUpScreen extends StatelessWidget {
  static const routeName = '/auth';

  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: ColoredBox(
        color: ThemeColors.appBackground,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const SizedBox(
                  height: 100,
                ),
                const Image(
                  height: 120,
                  image: AssetImage('assets/logo.png'),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Vision Director",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      l10n.startupTitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    LongButton(
                      onClick: () => Navigator.of(context)
                          .pushNamed(RegisterScreen.routeName),
                      label: l10n.registerTitle,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: ThemeColors.buttonGray,
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(LoginScreen.routeName);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

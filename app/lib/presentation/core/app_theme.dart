import 'package:flutter/material.dart';
import 'package:vision_director/presentation/core/app_colors.dart';

final ThemeData theme = ThemeData.dark();

/// Custom Dark Theme
final appTheme = theme.copyWith(
  colorScheme: theme.colorScheme.copyWith(
    secondary: ThemeColors.themeBlue,
    primary: ThemeColors.themeBlue,
  ),
  backgroundColor: ThemeColors.appBackground,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: const AppBarTheme(
    backgroundColor: ThemeColors.appBackground,
    elevation: 0,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide.none,
    ),
    fillColor: ThemeColors.inputBackground,
    labelStyle: const TextStyle(
      color: Colors.white70,
    ),
    filled: true,
    errorStyle: const TextStyle(
      color: ThemeColors.errorRed,
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: ThemeColors.themeBlue,
  ),
  highlightColor: Colors.black12.withOpacity(.5),
  splashColor: Colors.black12,
  dialogTheme: const DialogTheme(
    backgroundColor: ThemeColors.appBackground,
  ),
);

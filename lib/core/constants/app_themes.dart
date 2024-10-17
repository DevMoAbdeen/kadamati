import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppThemes {
  // Light Theme Data
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.mainColorLight,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textColorLight),
      bodyMedium: TextStyle(color: AppColors.unselectedTextColorLight),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.successSnackBarColor,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainColorLight,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColorLight,
    ),
    dividerColor: Colors.grey,
  );

  // Dark Theme Data
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.mainColorDark,
    scaffoldBackgroundColor: AppColors.backgroundColorDark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textColorDark),
      bodyMedium: TextStyle(color: AppColors.unselectedTextColorDark),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColors.successSnackBarColor,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainColorDark,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColorDark,
    ),
    dividerColor: Colors.grey,
  );
}

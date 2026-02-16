import 'package:flutter/material.dart';
import 'package:restaurant_waiters/app/utils/constants/app_colors.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primary,
      background: AppColors.primary,
      error: AppColors.primary,
    ),
  );
}
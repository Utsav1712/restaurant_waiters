import 'package:flutter/material.dart';

import '../utils/constants/app_colors.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.primary,
      background: AppColors.primary,
      error: Colors.redAccent,
    ),
  );
}
import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';
import 'theme_service.dart';

class AppTheme {
  static ThemeData get lightTheme => LightTheme.theme;
  static ThemeData get darkTheme => DarkTheme.theme;
  static ThemeService get themeService => ThemeService();
}
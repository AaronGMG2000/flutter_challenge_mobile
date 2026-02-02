import 'package:flutter/material.dart';

class AppColors {
  final bool isDark;
  final Color primaryColor;

  AppColors._(this.isDark, this.primaryColor);

  factory AppColors({required bool isDark, required Color primaryColor}) {
    return AppColors._(isDark, primaryColor);
  }

  static bool _isDark = false;
  static Color _primaryColor = const Color(0xFFE88B0B);

  static void update({required bool isDark, required Color primaryColor}) {
    _isDark = isDark;
    _primaryColor = primaryColor;
  }

  static AppColors get current => AppColors._(_isDark, _primaryColor);

  static AppColors get dark => AppColors._(true, _primaryColor);
  static AppColors get light => AppColors._(false, _primaryColor);

  Color get primary => primaryColor;

  Color get scafoldColor => isDark ? const Color(0xff121212) : const Color(0xfff6f7f8);

  Color get inputFilled => isDark ? const Color(0xff1e293b) : Colors.white;

  Color get inputIconColor => isDark ? const Color(0xff94a3b8) : const Color(0xff5999f2);

  Color get cardColor => isDark ? const Color(0xff1e293b) : Colors.white;
}

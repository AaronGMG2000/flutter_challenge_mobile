import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppFonts {
  final AppColors colors;
  const AppFonts(this.colors);

  static AppFonts get current => AppFonts(AppColors.current);

  TextStyle get versionNumber => const TextStyle(fontSize: 14);
}

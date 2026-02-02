import 'app_colors.dart';
import 'app_fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    final colors = AppColors.light;
    final fonts = AppFonts(colors);
    final baseTheme = _buildTheme(brightness: Brightness.light, colors: colors, fonts: fonts);

    return baseTheme.copyWith();
  }

  static ThemeData dark() {
    final colors = AppColors.dark;
    final fonts = AppFonts(colors);
    final baseTheme = _buildTheme(brightness: Brightness.dark, colors: colors, fonts: fonts);

    return baseTheme.copyWith();
  }

  static ThemeData _buildTheme({required Brightness brightness, required AppColors colors, required AppFonts fonts}) {
    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      scaffoldBackgroundColor: colors.scafoldColor,
      cardColor: colors.cardColor,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.inputFilled,
        iconColor: colors.inputIconColor,
        prefixIconColor: colors.inputIconColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}

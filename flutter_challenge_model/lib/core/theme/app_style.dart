import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_challenge_model/features/settings/presentation/providers/settings_provider.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyle {
  final AppColors colors;
  final AppFonts fonts;

  AppStyle._({required this.colors, required this.fonts});

  static AppStyle of(WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final provider = ref.read(settingsProvider.notifier);
    final isDark = provider.isDark;

    final colors = AppColors(isDark: isDark, primaryColor: settings.primaryColor);
    final fonts = AppFonts(colors);

    return AppStyle._(colors: colors, fonts: fonts);
  }
}

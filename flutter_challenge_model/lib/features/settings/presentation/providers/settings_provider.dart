import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_challenge_model/core/theme/app_colors.dart';
import 'package:flutter_challenge_model/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:flutter_challenge_model/features/settings/domain/entities/app_settings.dart';
import 'package:flutter_challenge_model/features/settings/domain/repositories/settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_challenge_model/features/settings/domain/use_cases/index.dart';

part 'settings_provider.g.dart';

@riverpod
SettingsRepository settingsRepository(Ref ref) => SettingsRepositoryImpl();

@riverpod
SaveThemeUseCase saveThemeUseCase(Ref ref) => SaveThemeUseCase(repository: ref.read(settingsRepositoryProvider));

@riverpod
SavePrimaryColorUseCase savePrimaryColorUseCase(Ref ref) =>
    SavePrimaryColorUseCase(repository: ref.read(settingsRepositoryProvider));

@riverpod
SaveLanguageUseCase saveLanguageUseCase(Ref ref) =>
    SaveLanguageUseCase(repository: ref.read(settingsRepositoryProvider));

@riverpod
class Settings extends _$Settings with WidgetsBindingObserver {
  Settings() : super() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    if (state.themeMode == ThemeMode.system) {
      _updateAppStyle();
    }
    super.didChangePlatformBrightness();
  }

  @override
  AppSettings build() {
    Future(() => _init());
    return const AppSettings(themeMode: ThemeMode.system, primaryColor: Color(0xFFE88B0B), themeIndex: 0);
  }

  Future<void> _init() async {
    final repo = ref.read(settingsRepositoryProvider);

    final themeRes = await repo.getTheme();
    final colorRes = await repo.getPrimaryColor();
    final langRes = await repo.getLanguage();

    // Actualizamos el estado con los valores recuperados de disco
    themeRes.fold(
      (failure) => null,
      (index) => state = state.copyWith(themeIndex: index, themeMode: ThemeMode.values[index]),
    );

    colorRes.fold((failure) => null, (colorValue) => state = state.copyWith(primaryColor: Color(colorValue)));

    langRes.fold((failure) => null, (langCode) => state = state.copyWith(locale: Locale(langCode)));

    _updateAppStyle();
  }

  Future<void> setTheme(int index) async {
    final result = await ref.read(saveThemeUseCaseProvider)(index);
    result.fold((failure) => null, (successIndex) {
      state = state.copyWith(themeIndex: successIndex, themeMode: ThemeMode.values[successIndex]);
      _updateAppStyle();
    });
  }

  Future<void> setPrimaryColor(Color color) async {
    final result = await ref.read(savePrimaryColorUseCaseProvider)(color.toARGB32());
    result.fold((failure) => null, (colorValue) {
      state = state.copyWith(primaryColor: Color(colorValue));
      _updateAppStyle();
    });
  }

  Future<void> setLanguage(Locale locale) async {
    final result = await ref.read(saveLanguageUseCaseProvider)(locale.languageCode);
    result.fold((failure) => null, (savedLanguageCode) {
      state = state.copyWith(locale: Locale(savedLanguageCode));
      _updateAppStyle();
    });
  }

  void _updateAppStyle() {
    final isDarkTheme = _isDark;
    AppColors.update(isDark: isDarkTheme, primaryColor: state.primaryColor);
  }

  bool get _isDark {
    if (state.themeMode == ThemeMode.dark) return true;
    if (state.themeMode == ThemeMode.light) return false;
    return SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
  }
}

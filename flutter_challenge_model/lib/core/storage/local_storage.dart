import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const themeStatus = "themeStatus";
  static const languageCode = "languageCode";
  static const primaryColor = "app_primary_color";
  static const firstRun = "is_first_run";
  static const token = "token";

  static const _schemaKey = "__prefs_schema_version__";
  static const int schemaVersion = 1;

  LocalStorage._privateConstructor();
  static final LocalStorage shared = LocalStorage._privateConstructor();

  late SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    final storedVersion = _prefs.getInt(_schemaKey) ?? 0;

    if (storedVersion < schemaVersion) {
      // Tu lógica de migración
      int? savedTheme = _prefs.getInt(themeStatus);
      String? savedLang = _prefs.getString(languageCode);

      await _prefs.clear();

      await _prefs.setInt(_schemaKey, schemaVersion);
      if (savedTheme != null) await _prefs.setInt(themeStatus, savedTheme);
      if (savedLang != null) await _prefs.setString(languageCode, savedLang);
    }
  }

  // Métodos más directos
  Future<dynamic> set(String key, dynamic value) async {
    if (value is bool) await _prefs.setBool(key, value);
    if (value is String) await _prefs.setString(key, value);
    if (value is int) await _prefs.setInt(key, value);
    if (value is double) await _prefs.setDouble(key, value);
  }

  int? getInt(String key) => _prefs.getInt(key);
  String? getString(String key) => _prefs.getString(key);
  bool getBool(String key) => _prefs.getBool(key) ?? false;

  Future<void> remove(String key) async => await _prefs.remove(key);
  Future<void> clear() async => await _prefs.clear();
}

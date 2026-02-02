import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyle {
  static final AppStyle _instance = AppStyle._internal();

  AppStyle._internal();

  static AppStyle get instance => _instance;

  AppColors get _color => AppColors.current;
  AppFonts get _font => AppFonts.current;

  static AppColors get colors => _instance._color;
  static AppFonts get fonts => _instance._font;
  static AppFonts get font => _instance._font;
}

import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';

abstract class SettingsRepository {
  Future<Either<Failure, int>> getTheme();
  Future<Either<Failure, int>> saveTheme(int theme);
  Future<Either<Failure, String>> getLanguage();
  Future<Either<Failure, String>> saveLanguage(String language);
  Future<Either<Failure, int>> getPrimaryColor();
  Future<Either<Failure, int>> savePrimaryColor(int colorValue);
}

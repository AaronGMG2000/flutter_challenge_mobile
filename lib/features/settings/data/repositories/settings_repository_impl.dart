import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';
import 'package:flutter_challenge_model/core/storage/local_storage.dart';
import 'package:flutter_challenge_model/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final LocalStorage _storage = LocalStorage.shared;

  @override
  Future<Either<Failure, String>> getLanguage() async {
    try {
      return Right(_storage.getString(LocalStorage.languageCode) ?? "es");
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getPrimaryColor() async {
    try {
      return Right(_storage.getInt(LocalStorage.primaryColor) ?? 0xFFE88B0B);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getTheme() async {
    try {
      return Right(_storage.getInt(LocalStorage.themeStatus) ?? 0);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> saveLanguage(String language) async {
    try {
      await _storage.set(LocalStorage.languageCode, language);
      return Right(language);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> savePrimaryColor(int colorValue) async {
    try {
      await _storage.set(LocalStorage.primaryColor, colorValue);
      return Right(colorValue);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> saveTheme(int theme) async {
    try {
      await _storage.set(LocalStorage.themeStatus, theme);
      return Right(theme);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}

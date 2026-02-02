import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';
import 'package:flutter_challenge_model/features/settings/domain/repositories/settings_repository.dart';

class SaveThemeUseCase {
  final SettingsRepository repository;

  SaveThemeUseCase({required this.repository});

  Future<Either<Failure, int>> call(int theme) async {
    return await repository.saveTheme(theme);
  }
}

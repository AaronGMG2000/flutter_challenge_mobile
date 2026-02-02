import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';
import 'package:flutter_challenge_model/features/settings/domain/repositories/settings_repository.dart';

class SaveLanguageUseCase {
  final SettingsRepository repository;

  SaveLanguageUseCase({required this.repository});

  Future<Either<Failure, String>> call(String language) async {
    return await repository.saveLanguage(language);
  }
}

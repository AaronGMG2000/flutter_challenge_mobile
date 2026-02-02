import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';
import 'package:flutter_challenge_model/features/settings/domain/repositories/settings_repository.dart';

class SavePrimaryColorUseCase {
  final SettingsRepository repository;

  SavePrimaryColorUseCase({required this.repository});

  Future<Either<Failure, int>> call(int colorValue) async {
    return await repository.savePrimaryColor(colorValue);
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/index.dart';
import 'package:flutter_challenge_model/features/user_story/domain/repository/story_repository.dart';

class GetStoriesUseCase {
  final StoryRepository repository;

  GetStoriesUseCase({required this.repository});

  Future<Either<Failure, List<Story>>> call() async {
    return await repository.getStories();
  }
}

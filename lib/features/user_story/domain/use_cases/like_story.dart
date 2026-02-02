import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';
import 'package:flutter_challenge_model/features/user_story/domain/repository/story_repository.dart';

class LikeStoryUseCase {
  final StoryRepository repository;

  LikeStoryUseCase({required this.repository});

  Future<Either<Failure, void>> call(int storyId) async {
    return await repository.likeStory(storyId);
  }
}

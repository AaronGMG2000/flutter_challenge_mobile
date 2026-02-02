import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/index.dart';
import 'package:flutter_challenge_model/features/user_story/domain/repository/story_repository.dart';

class GetCommentsUseCase {
  final StoryRepository repository;

  GetCommentsUseCase({required this.repository});

  Future<Either<Failure, List<Comment>>> call(int storyId) async {
    return await repository.getComments(storyId);
  }
}

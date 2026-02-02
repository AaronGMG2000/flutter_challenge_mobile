import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';
import 'package:flutter_challenge_model/features/user_story/domain/repository/story_repository.dart';

class LikeCommentUseCase {
  final StoryRepository repository;

  LikeCommentUseCase({required this.repository});

  Future<Either<Failure, void>> call(int commentId) async {
    return await repository.likeComment(commentId);
  }
}

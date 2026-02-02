import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/index.dart';

abstract class StoryRepository {
  Future<Either<Failure, List<Story>>> getStories();
  Future<Either<Failure, List<Comment>>> getComments(int storyId);
  Future<Either<Failure, void>> likeStory(int storyId);
  Future<Either<Failure, void>> likeComment(int commentId);
  Future<Either<Failure, void>> unlikeStory(int storyId);
  Future<Either<Failure, void>> unlikeComment(int commentId);
}

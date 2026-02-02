import 'package:dartz/dartz.dart';
import 'package:flutter_challenge_model/core/error/failure.dart';
import 'package:flutter_challenge_model/features/user_story/data/datasource/user_story_local_datasource.dart';
import 'package:flutter_challenge_model/features/user_story/data/datasource/user_story_remote_datasource.dart';
import 'package:flutter_challenge_model/features/user_story/data/models/index.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/index.dart';
import 'package:flutter_challenge_model/features/user_story/domain/repository/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  @override
  Future<Either<Failure, List<Story>>> getStories() async {
    try {
      final remoteDataSource = UserStoryRemoteDatasourceImpl();
      final localDataSource = HiveUserStoryLocalDatasource();
      List<StoryModel> stories = await remoteDataSource.getStories();
      List<Story> storiesList = await Future.wait(
        stories.map((story) async => story.toEntity(isLiked: await localDataSource.isLikedStory(storyId: story.id))),
      );
      return Right(storiesList);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Comment>>> getComments(int storyId) async {
    try {
      final remoteDataSource = UserStoryRemoteDatasourceImpl();
      final localDataSource = HiveUserStoryLocalDatasource();
      List<CommentModel> comments = await remoteDataSource.getComments(postId: storyId);
      List<Comment> commentsList = await Future.wait(
        comments.map(
          (comment) async => comment.toEntity(isLiked: await localDataSource.isLikedCommet(commentId: comment.id)),
        ),
      );
      return Right(commentsList);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> likeStory(int storyId) async {
    try {
      final localDataSource = HiveUserStoryLocalDatasource();
      await localDataSource.likeStory(storyId: storyId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> likeComment(int commentId) async {
    try {
      final localDataSource = HiveUserStoryLocalDatasource();
      await localDataSource.likeComment(commentId: commentId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unlikeComment(int commentId) async {
    try {
      final localDataSource = HiveUserStoryLocalDatasource();
      await localDataSource.unlikeComment(commentId: commentId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unlikeStory(int storyId) async {
    try {
      final localDataSource = HiveUserStoryLocalDatasource();
      await localDataSource.unlikeStory(storyId: storyId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

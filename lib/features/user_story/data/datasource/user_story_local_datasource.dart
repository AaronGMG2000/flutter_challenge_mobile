import 'package:hive_flutter/hive_flutter.dart';

abstract class UserStoryLocalDatasource {
  Future<bool> likeStory({required int storyId});
  Future<bool> unlikeStory({required int storyId});
  Future<bool> likeComment({required int commentId});
  Future<bool> unlikeComment({required int commentId});
  Future<bool> isLikedStory({required int storyId});
  Future<bool> isLikedCommet({required int commentId});
}

class HiveUserStoryLocalDatasource implements UserStoryLocalDatasource {
  HiveUserStoryLocalDatasource() {
    Hive.initFlutter();
  }

  @override
  Future<bool> likeStory({required int storyId}) async {
    try {
      final box = await Hive.openBox('user_story_likes');
      await box.put(storyId, true);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> unlikeStory({required int storyId}) async {
    try {
      final box = await Hive.openBox('user_story_likes');
      await box.delete(storyId);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> likeComment({required int commentId}) async {
    try {
      final box = await Hive.openBox('comments_likes');
      await box.put(commentId, true);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> unlikeComment({required int commentId}) async {
    try {
      final box = await Hive.openBox('comments_likes');
      await box.delete(commentId);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isLikedStory({required int storyId}) async {
    try {
      final box = await Hive.openBox('user_story_likes');
      return box.get(storyId) ?? false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isLikedCommet({required int commentId}) async {
    try {
      final box = await Hive.openBox('comments_likes');
      return box.get(commentId) ?? false;
    } catch (e) {
      return false;
    }
  }
}

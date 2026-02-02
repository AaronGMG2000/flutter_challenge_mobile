import 'package:dio/dio.dart';
import 'package:flutter_challenge_model/core/constants/url_const.dart';
import 'package:flutter_challenge_model/features/user_story/data/models/index.dart';

abstract class UserStoryRemoteDatasource {
  Future<List<StoryModel>> getStories();
  Future<List<CommentModel>> getComments({required int postId});
}

class UserStoryRemoteDatasourceImpl implements UserStoryRemoteDatasource {
  final Dio dio = Dio(BaseOptions(headers: {'Connection': 'keep-alive'}, validateStatus: (status) => true));

  @override
  Future<List<StoryModel>> getStories() async {
    final resp = await dio.get(UrlConst.shared.posts);
    if (resp.statusCode == 200) {
      return StoriesList.fromJson(resp.data as List<dynamic>).items;
    }
    throw Exception('Failed to load stories');
  }

  @override
  Future<List<CommentModel>> getComments({required int postId}) async {
    final resp = await dio.get(UrlConst.shared.comments(postId));
    if (resp.statusCode == 200) {
      return CommentsList.fromJson(resp.data as List<dynamic>).items;
    }
    throw Exception('Failed to load comments');
  }
}

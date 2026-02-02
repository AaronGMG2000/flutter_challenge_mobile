import 'package:flutter_challenge_model/features/user_story/data/repositories/story_repository_impl.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/index.dart';
import 'package:flutter_challenge_model/features/user_story/domain/repository/story_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_challenge_model/src/native_bridge/notification_api.g.dart';

part 'story_provider.g.dart';

@riverpod
StoryRepository storyRepository(Ref ref) => StoryRepositoryImpl();

@riverpod
NativeNotificationApi nativeNotificationApi(Ref ref) => NativeNotificationApi();

@riverpod
class Stories extends _$Stories {
  @override
  Future<List<Story>> build() async {
    final storyProvider = ref.read(storyRepositoryProvider);
    final stories = await storyProvider.getStories();
    return stories.fold((failure) => [], (stories) => stories);
  }

  Future<void> reload() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final storyProvider = ref.read(storyRepositoryProvider);
      final stories = await storyProvider.getStories();
      return stories.fold((failure) => [], (stories) => stories);
    });
  }

  void changeStoryLike(Story story) {
    state = AsyncData(state.value!.map((s) => s.id == story.id ? story : s).toList());
  }

  Future<void> like(Story story) async {
    final storyProvider = ref.read(storyRepositoryProvider);
    if (!story.isLiked) {
      await storyProvider.likeStory(story.id);
      changeStoryLike(story.copyWith(isLiked: true));
      final nativeApi = ref.read(nativeNotificationApiProvider);
      await nativeApi.showLocalNotification(NotificationPayload(id: story.id, title: story.title, body: story.body));
    } else {
      await storyProvider.unlikeStory(story.id);
      changeStoryLike(story.copyWith(isLiked: false));
    }
  }
}

@riverpod
class SearchStory extends _$SearchStory {
  @override
  String build() {
    return '';
  }

  void setSearch(String search) {
    state = search;
  }
}

@riverpod
Future<List<Story>> filterStoriesByName(Ref ref) async {
  final storyProvider = ref.watch(storiesProvider);
  final search = ref.watch(searchStoryProvider);

  return storyProvider.when(
    data: (stories) => stories
        .where(
          (story) =>
              story.title.toLowerCase().contains(search.toLowerCase()) ||
              story.body.toLowerCase().contains(search.toLowerCase()),
        )
        .toList(),
    error: (error, stackTrace) => [],
    loading: () => [],
  );
}

@riverpod
class Comments extends _$Comments {
  @override
  Future<List<Comment>> build(int storyId) async {
    final storyProvider = ref.read(storyRepositoryProvider);
    final comments = await storyProvider.getComments(storyId);
    return comments.fold((failure) => [], (comments) => comments);
  }

  Future<void> reload(int storyId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final storyProvider = ref.read(storyRepositoryProvider);
      final comments = await storyProvider.getComments(storyId);
      return comments.fold((failure) => [], (comments) => comments);
    });
  }

  Future<void> like(Comment comment) async {
    final storyProvider = ref.read(storyRepositoryProvider);
    if (!comment.isLiked) {
      await storyProvider.likeComment(comment.id);
      changeCommentLike(comment.copyWith(isLiked: true));
    } else {
      await storyProvider.unlikeComment(comment.id);
      changeCommentLike(comment.copyWith(isLiked: false));
    }
  }

  void changeCommentLike(Comment comment) {
    state = AsyncData(state.value!.map((c) => c.id == comment.id ? comment : c).toList());
  }
}

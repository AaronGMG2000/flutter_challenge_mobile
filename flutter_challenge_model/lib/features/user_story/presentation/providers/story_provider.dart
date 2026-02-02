import 'package:flutter_challenge_model/features/user_story/data/repositories/story_repository_impl.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/story.dart';
import 'package:flutter_challenge_model/features/user_story/domain/repository/story_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'story_provider.g.dart';

@riverpod
StoryRepository storyRepository(Ref ref) => StoryRepositoryImpl();

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
class LikeStory extends _$LikeStory {
  @override
  Future<void> build() async {}

  Future<void> like(Story story) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final storyProvider = ref.read(storyRepositoryProvider);
      if (!story.isLiked) {
        await storyProvider.likeStory(story.id);
        ref.read(storiesProvider.notifier).changeStoryLike(story.copyWith(isLiked: true));
      } else {
        await storyProvider.unlikeStory(story.id);
        ref.read(storiesProvider.notifier).changeStoryLike(story.copyWith(isLiked: false));
      }
    });
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

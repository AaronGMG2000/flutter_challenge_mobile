import 'package:flutter/material.dart';
import 'package:flutter_challenge_model/core/extensions/widget_extensions.dart';
import 'package:flutter_challenge_model/features/user_story/presentation/providers/story_provider.dart';
import 'package:flutter_challenge_model/features/user_story/presentation/widgets/post_widget.dart';
import 'package:flutter_challenge_model/features/user_story/presentation/widgets/search_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_challenge_model/features/settings/presentation/providers/settings_provider.dart';

class StoryPage extends ConsumerWidget {
  static const String routeName = 'StoryPage';

  const StoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsProvider);
    final stories = ref.watch(filterStoriesByNameProvider);
    final search = ref.watch(searchStoryProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SearchWidget(
                initialValue: search,
                onChanged: (value) => ref.read(searchStoryProvider.notifier).setSearch(value),
              ),
              Expanded(
                child: stories.when(
                  data: (stories) => ListView.builder(
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      return PostWidget(
                        story: stories[index],
                        onLike: () {
                          ref.read(likeStoryProvider.notifier).like(stories[index]);
                        },
                        onComment: () {},
                      );
                    },
                  ),
                  error: (error, stackTrace) => const Center(child: Text('Error')),
                  loading: () => const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    ).withUnfocus(context);
  }
}

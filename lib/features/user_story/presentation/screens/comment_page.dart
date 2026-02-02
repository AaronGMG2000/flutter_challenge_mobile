import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_model/features/settings/presentation/providers/settings_provider.dart';
import 'package:flutter_challenge_model/features/user_story/presentation/providers/story_provider.dart';
import 'package:flutter_challenge_model/features/user_story/presentation/widgets/comment_widget.dart';
import 'package:flutter_challenge_model/features/user_story/presentation/widgets/post_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentPage extends ConsumerWidget {
  static const String routeName = 'CommentPage';

  final int storyId;

  const CommentPage({super.key, required this.storyId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsProvider);
    final stories = ref.watch(storiesProvider);
    final provider = ref.read(settingsProvider.notifier);
    final comments = ref.watch(commentsProvider(storyId));
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(provider.isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              final newIndex = provider.isDark ? 1 : 2;
              provider.setTheme(newIndex);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostWidget(
              story: stories.value!.firstWhere((story) => story.id == storyId),
              onLike: () {
                ref.read(storiesProvider.notifier).like(stories.value!.firstWhere((story) => story.id == storyId));
              },
              onComment: () {},
            ),
            const AutoSizeText(
              'Comments',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: -0.5),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: comments.when(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final comment = data[index];
                      return CommentWidget(
                        comment: comment,
                        onLike: () {
                          ref.read(commentsProvider(storyId).notifier).like(comment);
                        },
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text(error.toString())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

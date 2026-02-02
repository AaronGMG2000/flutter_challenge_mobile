import 'package:flutter/material.dart';
import 'package:flutter_challenge_model/core/theme/app_style.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/story.dart';
import 'package:flutter_challenge_model/features/user_story/presentation/widgets/post_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardPostWidget extends ConsumerWidget {
  final Story story;
  final Function() onLike;
  final Function() onComment;

  static const String routeName = 'PostWidget';

  const CardPostWidget({super.key, required this.story, required this.onLike, required this.onComment});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final style = AppStyle.of(ref);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: style.colors.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: InkWell(
        onTap: () => onComment(),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PostWidget(story: story, onLike: onLike, onComment: onComment),
        ),
      ),
    );
  }
}

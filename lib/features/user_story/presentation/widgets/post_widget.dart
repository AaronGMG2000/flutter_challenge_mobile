import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_model/core/constants/url_const.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/story.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.story, required this.onLike, required this.onComment});

  final Story story;
  final Function() onLike;
  final Function() onComment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey[200],
              backgroundImage: NetworkImage(UrlConst.shared.userImge(story.name)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AutoSizeText(
                story.name, // "Sarah Johnson"
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        AutoSizeText(
          story.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: -0.5),
          maxLines: 2,
        ),
        const SizedBox(height: 8),
        AutoSizeText(
          story.body,
          style: TextStyle(color: Colors.grey[600], height: 1.5),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => onLike(),
              icon: Icon(story.isLiked ? Icons.favorite : Icons.favorite_border, color: Colors.red),
            ),
            IconButton(
              onPressed: () => onComment(),
              icon: const Icon(Icons.chat_bubble_rounded, color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }
}

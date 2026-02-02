import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_model/core/constants/url_const.dart';
import 'package:flutter_challenge_model/core/theme/app_style.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/story.dart';

class PostWidget extends StatelessWidget {
  final Story story;
  final Function() onLike;
  final Function() onComment;

  static const String routeName = 'PostWidget';

  const PostWidget({super.key, required this.story, required this.onLike, required this.onComment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: AppStyle.colors.cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: InkWell(
        onTap: () => onComment(),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
          ),
        ),
      ),
    );
  }
}

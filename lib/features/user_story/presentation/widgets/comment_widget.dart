import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_model/core/constants/url_const.dart';
import 'package:flutter_challenge_model/core/theme/app_style.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/comment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentWidget extends ConsumerWidget {
  static const String routeName = 'CommentWidget';
  final Comment comment;
  final Function onLike;

  const CommentWidget({super.key, required this.comment, required this.onLike});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[800],
            backgroundImage: NetworkImage(UrlConst.shared.userImge(comment.name)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 5, top: 10, bottom: 5),
              decoration: BoxDecoration(
                color: AppStyle.of(ref).colors.cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(comment.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(height: 4),
                  AutoSizeText(comment.body, style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => onLike(),
                        icon: Icon(comment.isLiked ? Icons.favorite : Icons.favorite_border),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
abstract class Comment with _$Comment {
  const factory Comment({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
    required bool isLiked,
  }) = _Comment;
}

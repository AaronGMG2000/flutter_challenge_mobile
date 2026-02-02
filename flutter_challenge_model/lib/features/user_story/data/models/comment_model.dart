import 'package:flutter_challenge_model/features/user_story/domain/entities/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

class CommentsList {
  List<CommentModel> items = [];

  CommentsList();

  CommentsList.fromJson(List<dynamic> jsonList) {
    for (final item in jsonList) {
      items.add(CommentModel.fromJson(item));
    }
  }
}

@freezed
abstract class CommentModel with _$CommentModel {
  const CommentModel._();

  const factory CommentModel({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

  Comment toEntity({required bool isLiked}) {
    return Comment(postId: postId, id: id, name: name, email: email, body: body, isLiked: isLiked);
  }
}

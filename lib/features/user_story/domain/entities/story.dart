import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';

@freezed
abstract class Story with _$Story {
  const factory Story({
    @Default('') String name,
    required int userId,
    required int id,
    required String title,
    required String body,
    required bool isLiked,
  }) = _Story;
}

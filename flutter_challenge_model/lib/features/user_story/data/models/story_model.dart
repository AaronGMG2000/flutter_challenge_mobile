import 'package:flutter_challenge_model/core/services/name_generate.dart';
import 'package:flutter_challenge_model/features/user_story/domain/entities/story.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'story_model.freezed.dart';
part 'story_model.g.dart';

class StoriesList {
  List<StoryModel> items = [];

  StoriesList();

  StoriesList.fromJson(List<dynamic> jsonList) {
    for (final item in jsonList) {
      items.add(StoryModel.fromJson(item));
    }
  }
}

@freezed
abstract class StoryModel with _$StoryModel {
  const StoryModel._();

  const factory StoryModel({required int userId, required int id, required String title, required String body}) =
      _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) => _$StoryModelFromJson(json);

  Story toEntity({required bool isLiked}) {
    return Story(userId: userId, id: id, title: title, body: body, isLiked: isLiked, name: NameGenerator.generate());
  }
}

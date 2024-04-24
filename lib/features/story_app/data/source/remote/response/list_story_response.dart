import 'package:json_annotation/json_annotation.dart';

import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story_response_item.dart';

part 'list_story_response.g.dart';

@JsonSerializable()
class ListStoryResponse {
  final List<StoryResponseItem> listStory;
  final bool error;
  final String message;

  ListStoryResponse({
    required this.listStory,
    required this.error,
    required this.message,
  });

  factory ListStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ListStoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListStoryResponseToJson(this);
}

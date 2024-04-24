import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story_response_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_story_response.g.dart';

@JsonSerializable()
class DetailStoryResponse {
  final bool error;
  final String message;
  final StoryResponseItem story;

  DetailStoryResponse({
    required this.error,
    required this.message,
    required this.story,
  });

  factory DetailStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailStoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailStoryResponseToJson(this);
}

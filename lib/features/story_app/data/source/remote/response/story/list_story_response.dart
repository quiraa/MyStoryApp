import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/story_response_item.dart';

part 'list_story_response.freezed.dart';
part 'list_story_response.g.dart';

@freezed
class ListStoryResponse with _$ListStoryResponse {
  const factory ListStoryResponse({
    required bool error,
    required String message,
    required List<StoryResponseItem> listStory,
  }) = _ListStoryResponse;

  factory ListStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ListStoryResponseFromJson(json);
}

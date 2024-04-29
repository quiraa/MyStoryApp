import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/story_response_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_story_response.freezed.dart';
part 'detail_story_response.g.dart';

@freezed
class DetailStoryResponse with _$DetailStoryResponse {
  const factory DetailStoryResponse({
    required bool error,
    required String message,
    required StoryResponseItem story,
  }) = _DetailStoryResponse;

  factory DetailStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailStoryResponseFromJson(json);
}

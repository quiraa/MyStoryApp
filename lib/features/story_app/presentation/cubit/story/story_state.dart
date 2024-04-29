import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/story_response_item.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_state.freezed.dart';

@freezed
class StoryState with _$StoryState {
  const factory StoryState.init() = _Init;
  const factory StoryState.loading() = _Loading;
  const factory StoryState.success(List<StoryResponseItem> stories) = _Success;
  const factory StoryState.error(DioException error, String message) = _Error;
}

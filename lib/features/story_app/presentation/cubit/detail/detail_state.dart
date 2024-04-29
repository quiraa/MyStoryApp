import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/story_response_item.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_state.freezed.dart';

@freezed
class DetailStoryState with _$DetailStoryState {
  const factory DetailStoryState.init() = _Init;
  const factory DetailStoryState.loading() = _Loading;
  const factory DetailStoryState.success(StoryResponseItem responseData) = _Success;
  const factory DetailStoryState.error(DioException error, String message) = _Error;
}

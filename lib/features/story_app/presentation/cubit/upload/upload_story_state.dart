import 'package:dicoding_story_app/features/story_app/data/source/remote/response/upload/upload_story_response.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_story_state.freezed.dart';

@freezed
class UploadStoryState with _$UploadStoryState {
  const factory UploadStoryState.init() = _Init;
  const factory UploadStoryState.loading() = _Loading;
  const factory UploadStoryState.success(UploadStoryResponse response) = _Success;
  const factory UploadStoryState.error(DioException error, String message) = _Error;
}

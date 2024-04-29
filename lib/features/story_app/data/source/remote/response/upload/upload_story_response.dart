import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_story_response.g.dart';
part 'upload_story_response.freezed.dart';

@freezed
class UploadStoryResponse with _$UploadStoryResponse {
  const factory UploadStoryResponse({
    required bool error,
    required String message,
  }) = _UploadStoryResponse;

  factory UploadStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadStoryResponseFromJson(json);
}

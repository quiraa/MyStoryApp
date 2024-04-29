import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_response_item.g.dart';
part 'story_response_item.freezed.dart';

@freezed
class StoryResponseItem with _$StoryResponseItem {
  const factory StoryResponseItem({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required String createdAt,
    @Default(0.0) double lon,
    @Default(0.0) double lat,
  }) = _StoryResponseItem;

  factory StoryResponseItem.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseItemFromJson(json);
}

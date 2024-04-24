// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_story_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListStoryResponse _$ListStoryResponseFromJson(Map<String, dynamic> json) =>
    ListStoryResponse(
      listStory: (json['listStory'] as List<dynamic>)
          .map((e) => StoryResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      error: json['error'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ListStoryResponseToJson(ListStoryResponse instance) =>
    <String, dynamic>{
      'listStory': instance.listStory,
      'error': instance.error,
      'message': instance.message,
    };

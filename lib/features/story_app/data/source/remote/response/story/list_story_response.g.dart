// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_story_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListStoryResponseImpl _$$ListStoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ListStoryResponseImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
      listStory: (json['listStory'] as List<dynamic>)
          .map((e) => StoryResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ListStoryResponseImplToJson(
        _$ListStoryResponseImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.listStory,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryResponseItemImpl _$$StoryResponseItemImplFromJson(
        Map<String, dynamic> json) =>
    _$StoryResponseItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      photoUrl: json['photoUrl'] as String,
      createdAt: json['createdAt'] as String,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$StoryResponseItemImplToJson(
        _$StoryResponseItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt,
      'lon': instance.lon,
      'lat': instance.lat,
    };

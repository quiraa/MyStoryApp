// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResultResponseImpl _$$LoginResultResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResultResponseImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$LoginResultResponseImplToJson(
        _$LoginResultResponseImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'token': instance.token,
    };

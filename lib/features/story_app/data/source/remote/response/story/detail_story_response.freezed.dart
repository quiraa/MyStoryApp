// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_story_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailStoryResponse _$DetailStoryResponseFromJson(Map<String, dynamic> json) {
  return _DetailStoryResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailStoryResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  StoryResponseItem get story => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailStoryResponseCopyWith<DetailStoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStoryResponseCopyWith<$Res> {
  factory $DetailStoryResponseCopyWith(
          DetailStoryResponse value, $Res Function(DetailStoryResponse) then) =
      _$DetailStoryResponseCopyWithImpl<$Res, DetailStoryResponse>;
  @useResult
  $Res call({bool error, String message, StoryResponseItem story});

  $StoryResponseItemCopyWith<$Res> get story;
}

/// @nodoc
class _$DetailStoryResponseCopyWithImpl<$Res, $Val extends DetailStoryResponse>
    implements $DetailStoryResponseCopyWith<$Res> {
  _$DetailStoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? story = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryResponseItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryResponseItemCopyWith<$Res> get story {
    return $StoryResponseItemCopyWith<$Res>(_value.story, (value) {
      return _then(_value.copyWith(story: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailStoryResponseImplCopyWith<$Res>
    implements $DetailStoryResponseCopyWith<$Res> {
  factory _$$DetailStoryResponseImplCopyWith(_$DetailStoryResponseImpl value,
          $Res Function(_$DetailStoryResponseImpl) then) =
      __$$DetailStoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message, StoryResponseItem story});

  @override
  $StoryResponseItemCopyWith<$Res> get story;
}

/// @nodoc
class __$$DetailStoryResponseImplCopyWithImpl<$Res>
    extends _$DetailStoryResponseCopyWithImpl<$Res, _$DetailStoryResponseImpl>
    implements _$$DetailStoryResponseImplCopyWith<$Res> {
  __$$DetailStoryResponseImplCopyWithImpl(_$DetailStoryResponseImpl _value,
      $Res Function(_$DetailStoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? story = null,
  }) {
    return _then(_$DetailStoryResponseImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryResponseItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailStoryResponseImpl implements _DetailStoryResponse {
  const _$DetailStoryResponseImpl(
      {required this.error, required this.message, required this.story});

  factory _$DetailStoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailStoryResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  @override
  final StoryResponseItem story;

  @override
  String toString() {
    return 'DetailStoryResponse(error: $error, message: $message, story: $story)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoryResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.story, story) || other.story == story));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message, story);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStoryResponseImplCopyWith<_$DetailStoryResponseImpl> get copyWith =>
      __$$DetailStoryResponseImplCopyWithImpl<_$DetailStoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailStoryResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailStoryResponse implements DetailStoryResponse {
  const factory _DetailStoryResponse(
      {required final bool error,
      required final String message,
      required final StoryResponseItem story}) = _$DetailStoryResponseImpl;

  factory _DetailStoryResponse.fromJson(Map<String, dynamic> json) =
      _$DetailStoryResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  StoryResponseItem get story;
  @override
  @JsonKey(ignore: true)
  _$$DetailStoryResponseImplCopyWith<_$DetailStoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

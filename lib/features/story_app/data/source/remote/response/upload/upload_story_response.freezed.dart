// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_story_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadStoryResponse _$UploadStoryResponseFromJson(Map<String, dynamic> json) {
  return _UploadStoryResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadStoryResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadStoryResponseCopyWith<UploadStoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadStoryResponseCopyWith<$Res> {
  factory $UploadStoryResponseCopyWith(
          UploadStoryResponse value, $Res Function(UploadStoryResponse) then) =
      _$UploadStoryResponseCopyWithImpl<$Res, UploadStoryResponse>;
  @useResult
  $Res call({bool error, String message});
}

/// @nodoc
class _$UploadStoryResponseCopyWithImpl<$Res, $Val extends UploadStoryResponse>
    implements $UploadStoryResponseCopyWith<$Res> {
  _$UploadStoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadStoryResponseImplCopyWith<$Res>
    implements $UploadStoryResponseCopyWith<$Res> {
  factory _$$UploadStoryResponseImplCopyWith(_$UploadStoryResponseImpl value,
          $Res Function(_$UploadStoryResponseImpl) then) =
      __$$UploadStoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message});
}

/// @nodoc
class __$$UploadStoryResponseImplCopyWithImpl<$Res>
    extends _$UploadStoryResponseCopyWithImpl<$Res, _$UploadStoryResponseImpl>
    implements _$$UploadStoryResponseImplCopyWith<$Res> {
  __$$UploadStoryResponseImplCopyWithImpl(_$UploadStoryResponseImpl _value,
      $Res Function(_$UploadStoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
  }) {
    return _then(_$UploadStoryResponseImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadStoryResponseImpl implements _UploadStoryResponse {
  const _$UploadStoryResponseImpl({required this.error, required this.message});

  factory _$UploadStoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadStoryResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;

  @override
  String toString() {
    return 'UploadStoryResponse(error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadStoryResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadStoryResponseImplCopyWith<_$UploadStoryResponseImpl> get copyWith =>
      __$$UploadStoryResponseImplCopyWithImpl<_$UploadStoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadStoryResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadStoryResponse implements UploadStoryResponse {
  const factory _UploadStoryResponse(
      {required final bool error,
      required final String message}) = _$UploadStoryResponseImpl;

  factory _UploadStoryResponse.fromJson(Map<String, dynamic> json) =
      _$UploadStoryResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$UploadStoryResponseImplCopyWith<_$UploadStoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

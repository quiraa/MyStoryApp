// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_response_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoryResponseItem _$StoryResponseItemFromJson(Map<String, dynamic> json) {
  return _StoryResponseItem.fromJson(json);
}

/// @nodoc
mixin _$StoryResponseItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryResponseItemCopyWith<StoryResponseItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryResponseItemCopyWith<$Res> {
  factory $StoryResponseItemCopyWith(
          StoryResponseItem value, $Res Function(StoryResponseItem) then) =
      _$StoryResponseItemCopyWithImpl<$Res, StoryResponseItem>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String photoUrl,
      String createdAt,
      double lon,
      double lat});
}

/// @nodoc
class _$StoryResponseItemCopyWithImpl<$Res, $Val extends StoryResponseItem>
    implements $StoryResponseItemCopyWith<$Res> {
  _$StoryResponseItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? lon = null,
    Object? lat = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryResponseItemImplCopyWith<$Res>
    implements $StoryResponseItemCopyWith<$Res> {
  factory _$$StoryResponseItemImplCopyWith(_$StoryResponseItemImpl value,
          $Res Function(_$StoryResponseItemImpl) then) =
      __$$StoryResponseItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String photoUrl,
      String createdAt,
      double lon,
      double lat});
}

/// @nodoc
class __$$StoryResponseItemImplCopyWithImpl<$Res>
    extends _$StoryResponseItemCopyWithImpl<$Res, _$StoryResponseItemImpl>
    implements _$$StoryResponseItemImplCopyWith<$Res> {
  __$$StoryResponseItemImplCopyWithImpl(_$StoryResponseItemImpl _value,
      $Res Function(_$StoryResponseItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? lon = null,
    Object? lat = null,
  }) {
    return _then(_$StoryResponseItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryResponseItemImpl implements _StoryResponseItem {
  const _$StoryResponseItemImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.photoUrl,
      required this.createdAt,
      this.lon = 0.0,
      this.lat = 0.0});

  factory _$StoryResponseItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryResponseItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String photoUrl;
  @override
  final String createdAt;
  @override
  @JsonKey()
  final double lon;
  @override
  @JsonKey()
  final double lat;

  @override
  String toString() {
    return 'StoryResponseItem(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lon: $lon, lat: $lat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryResponseItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.lat, lat) || other.lat == lat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, photoUrl, createdAt, lon, lat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryResponseItemImplCopyWith<_$StoryResponseItemImpl> get copyWith =>
      __$$StoryResponseItemImplCopyWithImpl<_$StoryResponseItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryResponseItemImplToJson(
      this,
    );
  }
}

abstract class _StoryResponseItem implements StoryResponseItem {
  const factory _StoryResponseItem(
      {required final String id,
      required final String name,
      required final String description,
      required final String photoUrl,
      required final String createdAt,
      final double lon,
      final double lat}) = _$StoryResponseItemImpl;

  factory _StoryResponseItem.fromJson(Map<String, dynamic> json) =
      _$StoryResponseItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get photoUrl;
  @override
  String get createdAt;
  @override
  double get lon;
  @override
  double get lat;
  @override
  @JsonKey(ignore: true)
  _$$StoryResponseItemImplCopyWith<_$StoryResponseItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

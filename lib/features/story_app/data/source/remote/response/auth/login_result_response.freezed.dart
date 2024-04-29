// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_result_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResultResponse _$LoginResultResponseFromJson(Map<String, dynamic> json) {
  return _LoginResultResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResultResponse {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResultResponseCopyWith<LoginResultResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResultResponseCopyWith<$Res> {
  factory $LoginResultResponseCopyWith(
          LoginResultResponse value, $Res Function(LoginResultResponse) then) =
      _$LoginResultResponseCopyWithImpl<$Res, LoginResultResponse>;
  @useResult
  $Res call({String userId, String name, String token});
}

/// @nodoc
class _$LoginResultResponseCopyWithImpl<$Res, $Val extends LoginResultResponse>
    implements $LoginResultResponseCopyWith<$Res> {
  _$LoginResultResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginResultResponseImplCopyWith<$Res>
    implements $LoginResultResponseCopyWith<$Res> {
  factory _$$LoginResultResponseImplCopyWith(_$LoginResultResponseImpl value,
          $Res Function(_$LoginResultResponseImpl) then) =
      __$$LoginResultResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String name, String token});
}

/// @nodoc
class __$$LoginResultResponseImplCopyWithImpl<$Res>
    extends _$LoginResultResponseCopyWithImpl<$Res, _$LoginResultResponseImpl>
    implements _$$LoginResultResponseImplCopyWith<$Res> {
  __$$LoginResultResponseImplCopyWithImpl(_$LoginResultResponseImpl _value,
      $Res Function(_$LoginResultResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? token = null,
  }) {
    return _then(_$LoginResultResponseImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResultResponseImpl implements _LoginResultResponse {
  const _$LoginResultResponseImpl(
      {required this.userId, required this.name, required this.token});

  factory _$LoginResultResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResultResponseImplFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final String token;

  @override
  String toString() {
    return 'LoginResultResponse(userId: $userId, name: $name, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResultResponseImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResultResponseImplCopyWith<_$LoginResultResponseImpl> get copyWith =>
      __$$LoginResultResponseImplCopyWithImpl<_$LoginResultResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResultResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResultResponse implements LoginResultResponse {
  const factory _LoginResultResponse(
      {required final String userId,
      required final String name,
      required final String token}) = _$LoginResultResponseImpl;

  factory _LoginResultResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResultResponseImpl.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$LoginResultResponseImplCopyWith<_$LoginResultResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

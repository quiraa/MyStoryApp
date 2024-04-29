import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_result_response.freezed.dart';
part 'login_result_response.g.dart';

@freezed
class LoginResultResponse with _$LoginResultResponse {
  const factory LoginResultResponse({
    required String userId,
    required String name,
    required String token,
  }) = _LoginResultResponse;

  factory LoginResultResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResultResponseFromJson(json);
}

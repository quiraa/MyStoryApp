import 'package:dicoding_story_app/features/story_app/data/source/remote/response/auth/register_response.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.init() = _Init;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success(RegisterResponse response) = _Success;
  const factory RegisterState.error(DioException error, String message) = _Error;
}

// abstract class RegisterState extends Equatable {
//   final RegisterResponse? register;
//   final DioException? error;
//   final String? message;

//   const RegisterState({this.error, this.register, this.message});

//   @override
//   List<Object?> get props => [error, register];
// }

// class RegisterIdleState extends RegisterState {
//   const RegisterIdleState();
// }

// class RegisterLoadingState extends RegisterState {
//   const RegisterLoadingState();
// }

// class RegisterErrorState extends RegisterState {
//   const RegisterErrorState(DioException error, String message)
//       : super(error: error, message: message);
// }

// class RegisterSuccessState extends RegisterState {
//   const RegisterSuccessState({super.register});
// }
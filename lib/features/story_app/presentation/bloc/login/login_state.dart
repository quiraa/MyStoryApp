import 'package:dicoding_story_app/features/story_app/data/source/remote/response/login_response.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final LoginResponse? login;
  final DioException? error;

  const LoginState({this.error, this.login});

  @override
  List<Object?> get props => [error, login];
}

class LoginIdleState extends LoginState {
  const LoginIdleState();
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginErrorState extends LoginState {
  const LoginErrorState(DioException error) : super(error: error);
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState({super.login});
}

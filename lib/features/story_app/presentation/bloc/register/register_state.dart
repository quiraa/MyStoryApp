import 'package:dicoding_story_app/features/story_app/data/source/remote/response/register_response.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  final RegisterResponse? register;
  final DioException? error;

  const RegisterState({this.error, this.register});

  @override
  List<Object?> get props => [error, register];
}

class RegisterIdleState extends RegisterState {
  const RegisterIdleState();
}

class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();
}

class RegisterErrorState extends RegisterState {
  const RegisterErrorState(DioException error) : super(error: error);
}

class RegisterSuccessState extends RegisterState {
  const RegisterSuccessState({super.register});
}

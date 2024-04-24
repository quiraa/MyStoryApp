import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  final String? email;
  final String? password;
  final DioException? error;

  const LoginEvent({this.email, this.password, this.error});

  @override
  List<Object?> get props => [email, password, error];
}

class LoginIdleEvent extends LoginEvent {
  const LoginIdleEvent();
}

class LoginUserEvent extends LoginEvent {
  const LoginUserEvent(
    String email,
    String password,
  ) : super(email: email, password: password);
}

class LoginRetryEvent extends LoginEvent {
  const LoginRetryEvent();
}

class CheckLoginStatusEvent extends LoginEvent {
  const CheckLoginStatusEvent();
}

class LogoutUserEvent extends LoginEvent {
  const LogoutUserEvent();
}

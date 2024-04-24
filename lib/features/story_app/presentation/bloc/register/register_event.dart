import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  final String? email;
  final String? password;
  final String? name;
  final DioException? error;

  const RegisterEvent({this.email, this.password, this.error, this.name});

  @override
  List<Object?> get props => [email, password, error, name];
}

class RegisterIdleEvent extends RegisterEvent {
  const RegisterIdleEvent();
}

class RegisterUserEvent extends RegisterEvent {
  const RegisterUserEvent(
    String name,
    String email,
    String password,
  ) : super(name: name, email: email, password: password);
}

class RegisterRetryEvent extends RegisterEvent {
  const RegisterRetryEvent();
}

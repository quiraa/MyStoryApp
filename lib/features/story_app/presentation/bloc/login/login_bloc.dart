import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/check_login_status_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/login_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/logout_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/login/login_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserUseCase loginUserUseCase;
  final CheckLoginStatusUseCase checkLoginStatusUseCase;
  final LogoutUserUseCase logoutUserUseCase;

  LoginBloc(this.loginUserUseCase, this.logoutUserUseCase, this.checkLoginStatusUseCase)
      : super(const LoginIdleState()) {
    on<LoginUserEvent>(onLoginUserEvent);
    on<LoginRetryEvent>(onRetryEvent);
    on<LoginIdleEvent>(onIdleEvent);
    on<CheckLoginStatusEvent>(onCheckLoginStatus);
    on<LogoutUserEvent>(onLogoutUserEvent);
  }

  void onLoginUserEvent(
    LoginUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoadingState());

    final dataState = await loginUserUseCase(
      params: LoginParams(
        event.email!,
        event.password!,
      ),
    );

    if (dataState is DataSuccess) {
      emit(LoginSuccessState(login: dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(LoginErrorState(dataState.error!));
    }
  }

  void onRetryEvent(
    LoginRetryEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(const LoginIdleState());
  }

  void onIdleEvent(
    LoginIdleEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(const LoginIdleState());
  }

  void onCheckLoginStatus(
    CheckLoginStatusEvent event,
    Emitter<LoginState> emit,
  ) async {
    final isLoggedIn = await checkLoginStatusUseCase();
    if (isLoggedIn == true) {
      emit(const LoginSuccessState());
    } else {
      emit(const LoginIdleState());
    }
  }

  void onLogoutUserEvent(
    LogoutUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    await logoutUserUseCase();
    emit(const LoginIdleState());
  }
}

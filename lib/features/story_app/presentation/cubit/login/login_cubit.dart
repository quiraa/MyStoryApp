import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/check_login_status_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/login_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/logout_user_usecase.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUserUseCase loginUseCase;
  final CheckLoginStatusUseCase checkLoginStatusUseCase;
  final LogoutUserUseCase logoutUserUseCase;

  LoginCubit(
    this.loginUseCase,
    this.checkLoginStatusUseCase,
    this.logoutUserUseCase,
  ) : super(LoginState.init());

  void postLoginUser(String email, String password) async {
    emit(LoginState.loading());

    final result = await loginUseCase(params: LoginParams(email, password));

    if (result is DataSuccess) {
      emit(LoginState.success());
    }

    if (result is DataFailed) {
      emit(LoginState.error(result.error!, result.message!));
    }
  }

  void checkLoginStatus() async {
    final isLoggedIn = await checkLoginStatusUseCase();
    if (isLoggedIn == true) {
      emit(LoginState.success());
    } else {
      emit(LoginState.init());
    }
  }

  void logoutUser() async {
    await logoutUserUseCase();
    emit(LoginState.success());
  }
}

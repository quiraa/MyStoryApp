import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/register_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/register/register_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUserUseCase registerUserUseCase;

  RegisterBloc(this.registerUserUseCase) : super(const RegisterIdleState()) {
    on<RegisterUserEvent>(onRegisterUserEvent);
    on<RegisterRetryEvent>(onRetryEvent);
    on<RegisterIdleEvent>(onIdleEvent);
  }

  void onRegisterUserEvent(
    RegisterUserEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterLoadingState());

    final dataState = await registerUserUseCase(
      params: RegisterParams(
        event.name!,
        event.email!,
        event.password!,
      ),
    );

    if (dataState is DataSuccess) {
      emit(RegisterSuccessState(register: dataState.data));
    }

    if (dataState is DataFailed) {
      emit(RegisterErrorState(dataState.error!));
    }
  }

  void onRetryEvent(
    RegisterRetryEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(const RegisterIdleState());
  }

  void onIdleEvent(
    RegisterIdleEvent event,
    Emitter<RegisterState> emit,
  ) {
    emit(const RegisterIdleState());
  }
}

import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/register_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUserUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterState.init());

  void postUserRegistration(String name, String email, String password) async {
    emit(RegisterState.loading());

    final result = await registerUseCase(params: RegisterParams(name, email, password));

    if (result is DataSuccess) {
      emit(RegisterState.success(result.data!));
    }

    if (result is DataFailed) {
      emit(RegisterState.error(result.error!, result.message!));
    }
  }
}

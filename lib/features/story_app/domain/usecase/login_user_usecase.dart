import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/core/use_case/use_case.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/login_response.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';

class LoginUserUseCase implements UseCase<DataState<LoginResponse>, LoginParams> {
  final StoryRepository repository;

  LoginUserUseCase(this.repository);

  @override
  Future<DataState<LoginResponse>> call({LoginParams? params}) {
    final email = params!.email;
    final password = params.password;
    return repository.loginUser(email, password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams(this.email, this.password);
}

import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/core/use_case/use_case.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/auth/register_response.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';

class RegisterUserUseCase implements UseCase<DataState<RegisterResponse>, RegisterParams> {
  final StoryRepository repository;

  RegisterUserUseCase(this.repository);

  @override
  Future<DataState<RegisterResponse>> call({RegisterParams? params}) {
    final name = params!.name;
    final email = params.email;
    final password = params.password;

    return repository.registerUser(name, email, password);
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;

  RegisterParams(this.name, this.email, this.password);
}

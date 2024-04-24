import 'package:dicoding_story_app/core/use_case/use_case.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';

class LogoutUserUseCase implements UseCase<void, void> {
  final StoryRepository repository;

  LogoutUserUseCase(this.repository);

  @override
  Future<void> call({void params}) {
    return repository.logoutUser();
  }
}

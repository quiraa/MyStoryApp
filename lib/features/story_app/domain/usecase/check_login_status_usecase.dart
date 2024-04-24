import 'package:dicoding_story_app/core/use_case/use_case.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';

class CheckLoginStatusUseCase implements UseCase<bool, void> {
  final StoryRepository repository;

  CheckLoginStatusUseCase(this.repository);

  @override
  Future<bool> call({void params}) {
    return repository.checkLoginStatus();
  }
}

import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/core/use_case/use_case.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/list_story_response.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';

class GetStoriesUseCase implements UseCase<DataState<ListStoryResponse>, void> {
  final StoryRepository repository;

  GetStoriesUseCase(this.repository);

  @override
  Future<DataState<ListStoryResponse>> call({void params}) {
    return repository.getStories();
  }
}

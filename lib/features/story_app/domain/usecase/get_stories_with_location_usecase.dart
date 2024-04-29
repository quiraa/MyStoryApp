import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/core/use_case/use_case.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/list_story_response.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';

class GetStoriesWithLocatonUseCase implements UseCase<DataState<ListStoryResponse>, void> {
  final StoryRepository repository;

  GetStoriesWithLocatonUseCase(this.repository);

  @override
  Future<DataState<ListStoryResponse>> call({void params}) {
    return repository.getAllStoriesWithLocation();
  }
}

import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/core/use_case/use_case.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/list_story_response.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';

class GetStoriesUseCase implements UseCase<DataState<ListStoryResponse>, GetStoriesParams> {
  final StoryRepository repository;

  GetStoriesUseCase(this.repository);

  @override
  Future<DataState<ListStoryResponse>> call({GetStoriesParams? params}) {
    return repository.getAllStories(params!.pageSize, params.pageCount);
  }
}

class GetStoriesParams {
  final int pageSize;
  final int pageCount;

  GetStoriesParams(
    this.pageSize,
    this.pageCount,
  );
}

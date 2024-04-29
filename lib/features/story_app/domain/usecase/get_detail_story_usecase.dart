import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/core/use_case/use_case.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/detail_story_response.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';

class GetDetailStoryUseCase implements UseCase<DataState<DetailStoryResponse>, String> {
  final StoryRepository repository;

  GetDetailStoryUseCase(this.repository);

  @override
  Future<DataState<DetailStoryResponse>> call({String? params}) {
    return repository.getDetailStory(params!);
  }
}

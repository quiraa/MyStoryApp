import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/story_response_item.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/get_stories_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/get_stories_with_location_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/story/story_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryCubit extends Cubit<StoryState> {
  final GetStoriesUseCase getStoriesUseCase;
  final GetStoriesWithLocatonUseCase getStoriesWithLocatonUseCase;

  int pageSize = 1;
  int pageCount = 10;
  bool hasMoreStories = true;
  String? errorMessage;

  final List<StoryResponseItem> allStories = [];
  final List<StoryResponseItem> storiesWithLocation = [];

  StoryCubit(this.getStoriesUseCase, this.getStoriesWithLocatonUseCase)
      : super(const StoryState.init());

  Future<void> fetchAllStories() async {
    final result = await getStoriesUseCase(params: GetStoriesParams(pageSize, pageCount));

    if (result is DataSuccess) {
      final newStories = result.data!.listStory;
      if (pageSize == 1) {
        allStories.addAll(newStories);
      } else {
        allStories.addAll(newStories.skip(pageSize));
      }

      hasMoreStories = newStories.length >= pageCount;

      if (hasMoreStories) {
        emit(StoryState.loading());
        pageSize++;
        print(hasMoreStories);
        emit(StoryState.success(allStories));
      } else {
        print("No More Stories");
      }
    }

    if (result is DataFailed) {
      emit(StoryState.error(result.error!, result.message!));
    }
  }

  Future<void> refreshStories() async {
    hasMoreStories = true;
    errorMessage = null;
    allStories.clear();
    pageSize = 1;
    await fetchAllStories();
  }

  Future<void> fetchStoriesWithLocation() async {
    emit(StoryState.loading());
    final result = await getStoriesWithLocatonUseCase();
    storiesWithLocation.addAll(result.data!.listStory);

    if (result is DataSuccess) {
      emit(StoryState.success(storiesWithLocation));
    }

    if (result is DataFailed) {
      emit(StoryState.error(result.error!, result.message!));
    }
  }
}

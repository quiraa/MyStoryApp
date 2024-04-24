import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/get_stories_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/story/story_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/story/story_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStoriesUseCase getStoriesUseCase;

  StoryBloc(this.getStoriesUseCase) : super(const StoryLoadingState()) {
    on<GetAllStoriesEvent>(onGetAllStoriesEvent);
    on<RefreshStoriesEvent>(onRefreshStoriesEvent);
  }

  void onGetAllStoriesEvent(
    GetAllStoriesEvent event,
    Emitter<StoryState> emit,
  ) async {
    emit(const StoryLoadingState());

    final state = await getStoriesUseCase();

    if (state is DataSuccess) {
      emit(StorySuccessState(state.data!));
    }

    if (state is DataFailed) {
      emit(StoryErrorState(state.error!));
    }
  }

  void onRefreshStoriesEvent(
    RefreshStoriesEvent event,
    Emitter<StoryState> emit,
  ) async {
    emit(const StoryLoadingState());

    await Future.delayed(const Duration(seconds: 2));
    final state = await getStoriesUseCase();

    if (state is DataSuccess) {
      emit(StorySuccessState(state.data!));
    }

    if (state is DataFailed) {
      emit(StoryErrorState(state.error!));
    }
  }
}

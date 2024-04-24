import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/get_detail_story_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/detail/detail_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/detail/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailStoryBloc extends Bloc<DetailStoryEvent, DetailStoryState> {
  final GetDetailStoryUseCase getDetailStoryUseCase;

  DetailStoryBloc(this.getDetailStoryUseCase) : super(const DetailLoadingState()) {
    on<GetDetailStoryEvent>(onGetDetailStoryEvent);
  }

  void onGetDetailStoryEvent(
    GetDetailStoryEvent event,
    Emitter<DetailStoryState> emit,
  ) async {
    final dataState = await getDetailStoryUseCase(params: event.storyId);

    if (dataState is DataSuccess) {
      emit(DetailSuccessState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(DetailErrorState(dataState.error!));
    }
  }
}

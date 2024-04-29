import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/get_detail_story_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/detail/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailStoryCubit extends Cubit<DetailStoryState> {
  final GetDetailStoryUseCase getDetailStoryUseCase;

  DetailStoryCubit(this.getDetailStoryUseCase) : super(DetailStoryState.init());

  void fetchDetailStory(String storyId) async {
    emit(DetailStoryState.loading());

    final result = await getDetailStoryUseCase(params: storyId);

    if (result is DataSuccess) {
      emit(DetailStoryState.success(result.data!.story));
    }

    if (result is DataFailed) {
      emit(DetailStoryState.error(result.error!, result.message!));
    }
  }
}

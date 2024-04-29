import 'dart:io';

import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/upload_story_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/upload/upload_story_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadStoryCubit extends Cubit<UploadStoryState> {
  final UploadStoryUseCase uploadStoryUseCase;

  UploadStoryCubit(this.uploadStoryUseCase) : super(UploadStoryState.init());

  void postStory(File image, String description, double? latitude, double? longitude) async {
    emit(UploadStoryState.loading());
    final result = await uploadStoryUseCase(
      params: UploadStoryParams(description, image, latitude, longitude),
    );

    if (result is DataSuccess) {
      emit(UploadStoryState.success(result.data!));
    }

    if (result is DataFailed) {
      emit(UploadStoryState.error(result.error!, result.message!));
    }
  }
}

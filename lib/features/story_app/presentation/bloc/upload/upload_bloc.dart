import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/upload_story_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/upload/upload_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/upload/upload_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final UploadStoryUseCase uploadStoryUseCase;

  UploadBloc(this.uploadStoryUseCase) : super(const UploadIdleState()) {
    on<UploadStoryEvent>(onUploadStoryEvent);
  }

  void onUploadStoryEvent(UploadStoryEvent event,
      Emitter<UploadState> emit,) async {
    emit(const UploadLoadingState());

    final dataState = await uploadStoryUseCase(
        params: UploadStoryParams(
            event.description!, event.imageFile!, event.latitude,
            event.longitude)
    );

    if(dataState is DataSuccess) {
      emit(UploadSuccessState(dataState.data!));
    }

    if(dataState is DataFailed) {
      emit(UploadErrorState(dataState.error!));
    }
  }
}

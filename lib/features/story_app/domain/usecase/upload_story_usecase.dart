import 'dart:io';

import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/core/use_case/use_case.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/upload/upload_story_response.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';

class UploadStoryUseCase implements UseCase<DataState<UploadStoryResponse>, UploadStoryParams> {
  final StoryRepository repository;

  UploadStoryUseCase(this.repository);

  @override
  Future<DataState<UploadStoryResponse>> call({UploadStoryParams? params}) {
    return repository.uploadStory(
        params!.photo, params.description, params.latitude, params.longitude);
  }
}

class UploadStoryParams {
  final String description;
  final File photo;
  final double? latitude;
  final double? longitude;

  UploadStoryParams(this.description, this.photo, this.latitude, this.longitude);
}

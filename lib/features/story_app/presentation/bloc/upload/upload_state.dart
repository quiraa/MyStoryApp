
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/upload_story_response.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class UploadState extends Equatable {
  final UploadStoryResponse? uploadResponse;
  final DioException? error;

  const UploadState({this.error, this.uploadResponse});

  @override
  List<Object?> get props => [];
}

class UploadLoadingState extends UploadState {
  const UploadLoadingState();
}

class UploadIdleState extends UploadState {
  const UploadIdleState();
}

class UploadSuccessState extends UploadState {
  const UploadSuccessState(UploadStoryResponse response) : super(uploadResponse: response);
}

class UploadErrorState extends UploadState {
  const UploadErrorState(DioException error) : super(error: error);
}
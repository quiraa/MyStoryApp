import 'package:dicoding_story_app/features/story_app/data/source/remote/response/detail_story_response.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class DetailStoryState extends Equatable {
  final DioException? error;
  final DetailStoryResponse? detailStory;

  const DetailStoryState({this.detailStory, this.error});

  @override
  List<Object?> get props => [error, detailStory];
}

class DetailLoadingState extends DetailStoryState {
  const DetailLoadingState();
}

class DetailSuccessState extends DetailStoryState {
  const DetailSuccessState(DetailStoryResponse detail) : super(detailStory: detail);
}

class DetailErrorState extends DetailStoryState {
  const DetailErrorState(DioException error) : super(error: error);
}

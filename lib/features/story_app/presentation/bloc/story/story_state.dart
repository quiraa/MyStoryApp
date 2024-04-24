import 'package:dicoding_story_app/features/story_app/data/source/remote/response/list_story_response.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class StoryState extends Equatable {
  final ListStoryResponse? data;
  final DioException? error;

  const StoryState({this.error, this.data});

  @override
  List<Object?> get props => [data, error];
}

class StoryLoadingState extends StoryState {
  const StoryLoadingState();
}

class StoryErrorState extends StoryState {
  const StoryErrorState(DioException error) : super(error: error);
}

class StorySuccessState extends StoryState {
  const StorySuccessState(ListStoryResponse listStory) : super(data: listStory);
}

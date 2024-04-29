import 'dart:io';

import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/detail_story_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/list_story_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/auth/login_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/auth/register_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/upload/upload_story_response.dart';

abstract class StoryRepository {
  Future<DataState<ListStoryResponse>> getAllStories(int pageSize, int pageCount);

  Future<DataState<ListStoryResponse>> getAllStoriesWithLocation();

  Future<DataState<LoginResponse>> loginUser(String email, String password);

  Future<DataState<RegisterResponse>> registerUser(String username, String email, String password);

  Future<DataState<DetailStoryResponse>> getDetailStory(String storyId);

  Future<DataState<UploadStoryResponse>> uploadStory(
      File photo, String description, double? latitude, double? longitude);

  Future<void> logoutUser();

  Future<bool> checkLoginStatus();
}

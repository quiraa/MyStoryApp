import 'dart:ffi';
import 'dart:io';

import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/detail_story_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/list_story_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/login_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/register_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/upload_story_response.dart';

abstract class StoryRepository {
  Future<DataState<ListStoryResponse>> getStories();

  Future<DataState<LoginResponse>> loginUser(
    String email,
    String password,
  );

  Future<DataState<RegisterResponse>> registerUser(
    String username,
    String email,
    String password,
  );

  Future<DataState<DetailStoryResponse>> getDetailStory(String storyId);

  Future<DataState<UploadStoryResponse>> uploadStory(
    File photo,
    String description,
    Float? latitude,
    Float? longitude,
  );

  Future<void> logoutUser();

  Future<bool> checkLoginStatus();
}

import 'dart:ffi';
import 'dart:io';

import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/core/utils/utils.dart';
import 'package:dicoding_story_app/features/story_app/data/preference/app_preference.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/network/api_service.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/detail_story_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/list_story_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/login_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/register_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/upload_story_response.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';
import 'package:dio/dio.dart';

class StoryRepositoryImpl implements StoryRepository {
  final ApiService apiService;

  StoryRepositoryImpl(this.apiService);

  @override
  Future<DataState<DetailStoryResponse>> getDetailStory(String storyId) async {
    try {
      String? token = await AppPreference.getAuthKey();

      if (token == null) {
        return DataFailed(
          DioException(
            requestOptions: RequestOptions(path: ''),
          ),
        );
      }

      final detail = await apiService.getDetailStory("Bearer $token", storyId);

      if (!detail.data.error) {
        return DataSuccess(detail.data);
      } else {
        return DataFailed(
          DioException(
            error: detail.response.statusMessage,
            type: DioExceptionType.badResponse,
            response: detail.response,
            requestOptions: detail.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<ListStoryResponse>> getStories() async {
    try {
      String? token = await AppPreference.getAuthKey();

      final stories = await apiService.getAllStories("Bearer $token");
      if (!stories.data.error) {
        return DataSuccess(stories.data);
      } else {
        return DataFailed(
          DioException(
            error: stories.response.statusMessage,
            response: stories.response,
            type: DioExceptionType.badResponse,
            requestOptions: stories.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<LoginResponse>> loginUser(String email, String password) async {
    try {
      final login = await apiService.loginUser(email, password);

      if (!login.data.error) {
        await AppPreference.setAuthKey(login.data.loginResult.token);
        return DataSuccess(login.data);
      } else {
        return DataFailed(
          DioException(
            error: login.response.statusMessage,
            response: login.response,
            type: DioExceptionType.badResponse,
            requestOptions: login.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<RegisterResponse>> registerUser(
      String name, String email, String password) async {
    try {
      final register = await apiService.registerUser(name, email, password);

      if (!register.data.error) {
        return DataSuccess(register.data);
      } else {
        return DataFailed(
          DioException(
            error: register.response.statusMessage,
            response: register.response,
            type: DioExceptionType.badResponse,
            requestOptions: register.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UploadStoryResponse>> uploadStory(
      File photo, String description, Float? latitude, Float? longitude) async {
    try {
      String? token = await AppPreference.getAuthKey();
      File compressedPhoto = await Utils.compressImage(photo);

      final upload = await apiService.uploadStory(
        "Bearer $token",
        description,
        compressedPhoto,
        latitude,
        longitude,
      );

      if (!upload.data.error) {
        return DataSuccess(upload.data);
      } else {
        return DataFailed(
          DioException(
            error: upload.response.statusMessage,
            response: upload.response,
            type: DioExceptionType.badResponse,
            requestOptions: upload.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> logoutUser() async {
    await AppPreference.clearAuthKey();
  }

  @override
  Future<bool> checkLoginStatus() async {
    final token = await AppPreference.getAuthKey();
    return token != null;
  }
}

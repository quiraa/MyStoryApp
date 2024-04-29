import 'dart:io';

import 'package:dicoding_story_app/core/resource/data_state.dart';
import 'package:dicoding_story_app/core/utils/utils.dart';
import 'package:dicoding_story_app/features/story_app/data/preference/app_preference.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/network/api_service.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/detail_story_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/story/list_story_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/auth/login_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/auth/register_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/upload/upload_story_response.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';
import 'package:dio/dio.dart';

class StoryRepositoryImpl implements StoryRepository {
  final ApiService apiService;

  StoryRepositoryImpl(this.apiService);

  @override
  Future<DataState<DetailStoryResponse>> getDetailStory(String storyId) async {
    try {
      String? token = await AppPreference.getAuthKey();

      final detail = await apiService.getDetailStory("Bearer $token", storyId);

      if (!detail.data.error) {
        return DataSuccess(detail.data);
      } else {
        return DataFailed(
          error: DioException(
            error: detail.response.statusCode,
            type: DioExceptionType.badResponse,
            response: detail.response,
            requestOptions: detail.response.requestOptions,
          ),
          message: detail.response.statusMessage,
        );
      }
    } on DioException catch (e) {
      return DataFailed(error: e, message: "No Internet Connected");
    }
  }

  @override
  Future<DataState<ListStoryResponse>> getAllStories(int pageSize, int pageCount) async {
    try {
      String? token = await AppPreference.getAuthKey();
      print("Token: $token");
      final stories = await apiService.getAllStories("Bearer $token", pageSize, pageCount, 0);
      if (!stories.data.error) {
        return DataSuccess(stories.data);
      } else {
        print(stories.response.statusMessage);
        return DataFailed(
            error: DioException(
              error: stories.response.statusCode,
              response: stories.response,
              type: DioExceptionType.badResponse,
              requestOptions: stories.response.requestOptions,
            ),
            message: stories.response.statusMessage);
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(error: e, message: "No Internet Connected");
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
          error: DioException(
            error: login.response.statusCode,
            response: login.response,
            type: DioExceptionType.badResponse,
            requestOptions: login.response.requestOptions,
          ),
          message: login.response.statusMessage,
        );
      }
    } on DioException catch (e) {
      return DataFailed(error: e, message: "No Internet Connected");
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
          error: DioException(
            error: register.response.statusCode,
            response: register.response,
            type: DioExceptionType.badResponse,
            requestOptions: register.response.requestOptions,
          ),
          message: register.response.statusMessage,
        );
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(error: e, message: "No Internet Connected");
    }
  }

  @override
  Future<DataState<UploadStoryResponse>> uploadStory(
      File photo, String description, double? latitude, double? longitude) async {
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
          error: DioException(
            error: upload.response.statusCode,
            response: upload.response,
            type: DioExceptionType.badResponse,
            requestOptions: upload.response.requestOptions,
          ),
          message: upload.response.statusMessage,
        );
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(error: e, message: "No Internet Connected");
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

  @override
  Future<DataState<ListStoryResponse>> getAllStoriesWithLocation() async {
    try {
      final token = await AppPreference.getAuthKey();

      final result = await apiService.getAllStories("Bearer $token", 1, 10, 1);
      print("Token: $token");
      if (!result.data.error) {
        return DataSuccess(result.data);
      } else {
        print(result.response.statusMessage);
        return DataFailed(
          error: DioException(
            error: result.response.statusCode,
            response: result.response,
            type: DioExceptionType.badResponse,
            requestOptions: result.response.requestOptions,
          ),
          message: result.response.statusMessage,
        );
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(error: e, message: "No Internet Connected");
    }
  }
}

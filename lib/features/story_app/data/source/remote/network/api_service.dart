import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dicoding_story_app/features/story_app/data/source/remote/response/detail_story_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/list_story_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/login_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/register_response.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/response/upload_story_response.dart';

part "api_service.g.dart";

@RestApi(baseUrl: "https://story-api.dicoding.dev/v1/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @FormUrlEncoded()
  @POST("login")
  Future<HttpResponse<LoginResponse>> loginUser(
    @Field("email") String email,
    @Field("password") String password,
  );

  @FormUrlEncoded()
  @POST("register")
  Future<HttpResponse<RegisterResponse>> registerUser(
    @Field("name") String name,
    @Field("email") String email,
    @Field("password") String password,
  );

  @GET("stories")
  Future<HttpResponse<ListStoryResponse>> getAllStories(
    @Header("Authorization") String authorization,
  );

  @GET("stories/{id}")
  Future<HttpResponse<DetailStoryResponse>> getDetailStory(
    @Header("Authorization") String authorization,
    @Path("id") String storyId,
  );

  @MultiPart()
  @POST("stories")
  Future<HttpResponse<UploadStoryResponse>> uploadStory(
    @Header("Authorization") String authorization,
    @Part(name: "description") String description,
    @Part(name: "photo") File photo,
    @Part(name: "lat") Float? lat,
    @Part(name: "lon") Float? lon,
  );
}

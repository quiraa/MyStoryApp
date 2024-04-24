import 'package:dicoding_story_app/features/story_app/data/repository/story_repository_impl.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/network/api_service.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/check_login_status_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/get_detail_story_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/get_stories_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/login_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/logout_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/register_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/upload_story_usecase.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/login/login_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/detail/detail_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/register/register_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/story/story_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/upload/upload_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<ApiService>(ApiService(sl()));

  sl.registerSingleton<StoryRepository>(StoryRepositoryImpl(sl()));

  sl.registerSingleton<GetStoriesUseCase>(GetStoriesUseCase(sl()));

  sl.registerSingleton<CheckLoginStatusUseCase>(CheckLoginStatusUseCase(sl()));

  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase(sl()));

  sl.registerSingleton<LogoutUserUseCase>(LogoutUserUseCase(sl()));

  sl.registerSingleton<RegisterUserUseCase>(RegisterUserUseCase(sl()));

  sl.registerSingleton<UploadStoryUseCase>(UploadStoryUseCase(sl()));

  sl.registerSingleton<GetDetailStoryUseCase>(GetDetailStoryUseCase(sl()));

  sl.registerFactory<LoginBloc>(() => LoginBloc(sl(), sl(), sl()));

  sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));

  sl.registerFactory<StoryBloc>(() => StoryBloc(sl()));

  sl.registerFactory<DetailStoryBloc>(() => DetailStoryBloc(sl()));

  sl.registerFactory<UploadBloc>(() => UploadBloc(sl()));
}

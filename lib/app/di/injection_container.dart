import 'package:dicoding_story_app/features/story_app/data/repository/story_repository_impl.dart';
import 'package:dicoding_story_app/features/story_app/data/source/remote/network/api_service.dart';
import 'package:dicoding_story_app/features/story_app/domain/repository/story_repository.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/check_login_status_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/get_detail_story_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/get_stories_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/get_stories_with_location_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/login_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/logout_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/register_user_usecase.dart';
import 'package:dicoding_story_app/features/story_app/domain/usecase/upload_story_usecase.dart';

import 'package:dicoding_story_app/features/story_app/presentation/cubit/detail/detail_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/login/login_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/register/register_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/story/story_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/upload/upload_story_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class AppServiceLocator {
  static Future<void> initializeServiceLocator() async {
    //  * Services
    sl.registerSingleton<Dio>(Dio());

    sl.registerSingleton<ApiService>(ApiService(sl()));

    sl.registerSingleton<StoryRepository>(StoryRepositoryImpl(sl()));

    //  * UseCases

    sl.registerSingleton<GetStoriesUseCase>(GetStoriesUseCase(sl()));

    sl.registerSingleton<CheckLoginStatusUseCase>(CheckLoginStatusUseCase(sl()));

    sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase(sl()));

    sl.registerSingleton<LogoutUserUseCase>(LogoutUserUseCase(sl()));

    sl.registerSingleton<RegisterUserUseCase>(RegisterUserUseCase(sl()));

    sl.registerSingleton<UploadStoryUseCase>(UploadStoryUseCase(sl()));

    sl.registerSingleton<GetStoriesWithLocatonUseCase>(GetStoriesWithLocatonUseCase(sl()));

    sl.registerSingleton<GetDetailStoryUseCase>(GetDetailStoryUseCase(sl()));

    //  * BLOC

    sl.registerFactory<LoginCubit>(() => LoginCubit(sl(), sl(), sl()));

    sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl()));

    sl.registerFactory<StoryCubit>(() => StoryCubit(sl(), sl()));

    sl.registerFactory<DetailStoryCubit>(() => DetailStoryCubit(sl()));

    sl.registerFactory<UploadStoryCubit>(() => UploadStoryCubit(sl()));
  }
}

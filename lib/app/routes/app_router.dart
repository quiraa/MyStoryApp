import 'package:dicoding_story_app/features/story_app/presentation/cubit/detail/detail_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/screen/main_screen.dart';
import 'package:dicoding_story_app/features/story_app/presentation/screen/map/maps_page.dart';
import 'package:dicoding_story_app/features/story_app/presentation/screen/map/pick_location_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:dicoding_story_app/app/di/injection_container.dart';
import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/app/routes/screen/not_found_screen.dart';

import 'package:dicoding_story_app/features/story_app/presentation/screen/detail/detail_story_screen.dart';

import 'package:dicoding_story_app/features/story_app/presentation/screen/auth/login/login_screen.dart';
import 'package:dicoding_story_app/features/story_app/presentation/screen/auth/register/register_screen.dart';
import 'package:dicoding_story_app/features/story_app/presentation/screen/settings/settings_page.dart';
import 'package:dicoding_story_app/features/story_app/presentation/screen/splash_screen.dart';
import 'package:dicoding_story_app/features/story_app/presentation/screen/story/story_page.dart';
import 'package:dicoding_story_app/features/story_app/presentation/screen/upload/upload_page.dart';

final GoRouter _router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: PAGES.splash.screenPath,
  routes: <RouteBase>[
    GoRoute(
      name: PAGES.main.screenName,
      path: PAGES.main.screenPath,
      builder: (context, state) {
        return MainScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          name: PAGES.story.screenName,
          path: PAGES.story.screenPath,
          builder: (context, state) {
            return const StoryPage();
          },
          routes: [
            GoRoute(
              name: PAGES.upload.screenName,
              path: PAGES.upload.screenPath,
              builder: (context, state) {
                return UploadStoryPage();
              },
              routes: [
                GoRoute(
                  name: PAGES.location.screenName,
                  path: PAGES.location.screenPath,
                  builder: (context, state) {
                    return PickLocationScreen();
                  },
                )
              ],
            ),
            GoRoute(
              name: PAGES.detail.screenName,
              path: PAGES.detail.screenPath,
              builder: (context, state) {
                final String storyId = state.extra as String;
                return BlocProvider<DetailStoryCubit>(
                  create: (context) => sl()..fetchDetailStory(storyId),
                  child: DetailPage(storyId: storyId),
                );
              },
            ),
          ],
        ),
        GoRoute(
          name: PAGES.setting.screenName,
          path: PAGES.setting.screenPath,
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          name: PAGES.maps.screenName,
          path: PAGES.maps.screenPath,
          builder: (context, state) => const MapsPage(),
        ),
      ],
    ),
    GoRoute(
      name: PAGES.splash.screenName,
      path: PAGES.splash.screenPath,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      name: PAGES.login.screenName,
      path: PAGES.login.screenPath,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      name: PAGES.register.screenName,
      path: PAGES.register.screenPath,
      builder: (context, state) {
        return RegisterScreen();
      },
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);

GoRouter get router => _router;

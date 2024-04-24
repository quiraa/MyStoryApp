import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/app/routes/screen/not_found_screen.dart';
import 'package:dicoding_story_app/features/story_app/presentation/pages/detail_page.dart';
import 'package:dicoding_story_app/features/story_app/presentation/pages/login_page.dart';
import 'package:dicoding_story_app/features/story_app/presentation/pages/register_page.dart';
import 'package:dicoding_story_app/features/story_app/presentation/pages/settings_page.dart';
import 'package:dicoding_story_app/features/story_app/presentation/pages/story_page.dart';
import 'package:dicoding_story_app/features/story_app/presentation/pages/upload_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
          name: PAGES.story.screenName,
          path: PAGES.story.screenPath,
          builder: (context, state) => const StoryPage(),
          routes: [
            GoRoute(
              name: PAGES.upload.screenName,
              path: PAGES.upload.screenPath,
              builder: (context, state) => UploadPage(),
            ),
            GoRoute(
              name: PAGES.detail.screenName,
              path: PAGES.detail.screenPath,
              builder: (context, state) {
                final String storyId = state.extra as String;
                return DetailPage(id: storyId);
              },
            ),
            GoRoute(
              name: PAGES.setting.screenName,
              path: PAGES.setting.screenPath,
              builder: (context, state) => const SettingsPage(),
            ),
          ]),
      GoRoute(
        name: PAGES.login.screenName,
        path: PAGES.login.screenPath,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        name: PAGES.register.screenName,
        path: PAGES.register.screenPath,
        builder: (context, state) => RegisterPage(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );

  static GoRouter get router => _router;
}

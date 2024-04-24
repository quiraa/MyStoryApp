import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/login/login_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/login/login_state.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/detail/detail_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/register/register_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/register/register_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/upload/upload_bloc.dart';
import 'package:dicoding_story_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:dicoding_story_app/app/di/injection_container.dart';
import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/app/themes/story_app_theme.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/story/story_bloc.dart';
import 'package:dicoding_story_app/features/story_app/presentation/bloc/story/story_event.dart';
import 'package:dicoding_story_app/features/story_app/presentation/provider/settings_provider.dart';

import 'features/story_app/presentation/bloc/login/login_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(
    ChangeNotifierProvider<SettingsProvider>(
      create: (_) => SettingsProvider(),
      child: const StoryApp(),
    ),
  );
}

class StoryApp extends StatelessWidget {
  const StoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(create: (_) => sl()..add(const CheckLoginStatusEvent())),
            BlocProvider<RegisterBloc>(create: (_) => sl()..add(const RegisterIdleEvent())),
            BlocProvider<StoryBloc>(create: (_) => sl()..add(const GetAllStoriesEvent())),
            BlocProvider<UploadBloc>(create: (_) => sl()),
            BlocProvider<DetailStoryBloc>(create: (_) => sl()),
          ],
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                AppRouter.router.goNamed(PAGES.story.screenName);
              } else if (state is LoginIdleState) {
                AppRouter.router.goNamed(PAGES.login.screenName);
              }
            },
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Story App',
              themeMode: provider.themeMode,
              theme: StoryAppTheme().lightTheme(),
              darkTheme: StoryAppTheme().darkTheme(),
              locale: provider.locale,
              supportedLocales: L10n.all,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerDelegate: AppRouter.router.routerDelegate,
              routeInformationParser: AppRouter.router.routeInformationParser,
              routeInformationProvider: AppRouter.router.routeInformationProvider,
            ),
          ),
        );
      },
    );
  }
}

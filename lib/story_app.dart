import 'package:dicoding_story_app/app/di/injection_container.dart';
import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/common/config/flavor_config.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/detail/detail_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/login/login_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/register/register_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/story/story_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/upload/upload_story_cubit.dart';
import 'package:dicoding_story_app/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import 'package:dicoding_story_app/app/themes/story_app_theme.dart';
import 'package:dicoding_story_app/features/story_app/presentation/provider/settings_provider.dart';

class StoryApp extends StatelessWidget {
  const StoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, provider, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoginCubit>(create: (_) => sl()),
            BlocProvider<RegisterCubit>(create: (_) => sl()),
            BlocProvider<StoryCubit>(create: (_) => sl()),
            BlocProvider<UploadStoryCubit>(create: (_) => sl()),
            BlocProvider<DetailStoryCubit>(create: (_) => sl()),
          ],
          child: PlatformApp.router(
            debugShowCheckedModeBanner: false,
            title: FlavorConfig.instance.values.appTitle,
            material: (context, platform) {
              return MaterialAppRouterData(
                title: FlavorConfig.instance.values.appTitle,
                themeMode: provider.themeMode,
                theme: StoryAppTheme().androidLightTheme(),
                darkTheme: StoryAppTheme().androidDarkTheme(),
              );
            },
            cupertino: (context, platform) {
              return CupertinoAppRouterData(
                title: 'iOS ${FlavorConfig.instance.values.appTitle}',
                theme: CupertinoThemeData(
                  brightness:
                      provider.themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
                  primaryColor: CupertinoColors.systemTeal,
                ),
              );
            },
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          ),
        );
      },
    );
  }
}

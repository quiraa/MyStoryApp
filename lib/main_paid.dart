import 'dart:async';

import 'package:dicoding_story_app/app/di/injection_container.dart';
import 'package:dicoding_story_app/common/config/flavor_config.dart';
import 'package:dicoding_story_app/common/config/flavor_values.dart';
import 'package:dicoding_story_app/common/enumeration/flavor_type.dart';
import 'package:dicoding_story_app/features/story_app/presentation/provider/settings_provider.dart';
import 'package:dicoding_story_app/story_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServiceLocator.initializeServiceLocator();
  FlavorConfig(flavor: FlavorType.paid, values: FlavorValues(appTitle: "Story App [PAID]"));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  setPathUrlStrategy();
  runApp(
    ChangeNotifierProvider<SettingsProvider>(
      create: (_) => SettingsProvider(),
      child: const StoryApp(),
    ),
  );
}

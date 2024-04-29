import 'dart:io' show Platform;

import 'package:dicoding_story_app/features/story_app/presentation/screen/map/maps_page.dart';
import 'package:dicoding_story_app/features/story_app/presentation/screen/settings/settings_page.dart';
import 'package:dicoding_story_app/features/story_app/presentation/screen/story/story_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../common/config/flavor_config.dart';

class MainScreen extends HookWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageIndex = useState(0);
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(FlavorConfig.instance.values.appTitle),
      ),
      body: screens[pageIndex.value],
      bottomNavBar: PlatformNavBar(
        currentIndex: pageIndex.value,
        itemChanged: (selectedIndex) {
          pageIndex.value = selectedIndex;
        },
        items: navbarItems(context),
      ),
    );
  }

  final List<Widget> screens = [
    StoryPage(),
    MapsPage(),
    SettingsPage(),
  ];

  List<BottomNavigationBarItem> navbarItems(BuildContext context) => [
        BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.home,
          tooltip: AppLocalizations.of(context)!.home,
          activeIcon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
          icon:
              Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.maps,
          tooltip: AppLocalizations.of(context)!.maps,
          activeIcon:
              Icon(Platform.isIOS ? CupertinoIcons.map_fill : Icons.map),
          icon: Icon(Platform.isIOS ? CupertinoIcons.map : Icons.map_outlined),
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.settings,
          tooltip: AppLocalizations.of(context)!.settings,
          activeIcon: Icon(
              Platform.isIOS ? CupertinoIcons.settings_solid : Icons.settings),
          icon: Icon(Platform.isIOS
              ? CupertinoIcons.settings
              : Icons.settings_outlined),
        ),
      ];
}

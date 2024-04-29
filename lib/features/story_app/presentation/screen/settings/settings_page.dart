import 'package:dicoding_story_app/app/routes/app_router.dart';
import 'package:dicoding_story_app/app/routes/route_utils.dart';
import 'package:dicoding_story_app/app/themes/story_app_typography.dart';
import 'package:dicoding_story_app/common/config/flavor_config.dart';
import 'package:dicoding_story_app/features/story_app/presentation/cubit/login/login_cubit.dart';
import 'package:dicoding_story_app/features/story_app/presentation/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<SettingsProvider>(
      builder: (context, provider, _) {
        return PlatformScaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildThemeToggle(context, provider),
                  const SizedBox(height: 16),
                  _buildLanguageDropdown(context, provider),
                  const SizedBox(height: 32),
                  _buildLogoutButton(context, theme),
                  const SizedBox(height: 24),
                  Text(FlavorConfig.instance.values.appTitle)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildThemeToggle(BuildContext context, SettingsProvider provider) {
    return Row(
      children: [
        Expanded(
          child: Text(AppLocalizations.of(context)!.changeTheme,
              style: StoryAppTypography.settingMenuTitle),
        ),
        Switch.adaptive(
          value: provider.themeMode == ThemeMode.dark,
          onChanged: (newValue) {
            provider.toggleTheme(newValue);
          },
        )
      ],
    );
  }

  Widget _buildLanguageDropdown(BuildContext context, SettingsProvider provider) {
    final Map<String, String> languageOptions = {
      "en": AppLocalizations.of(context)!.english,
      "fr": AppLocalizations.of(context)!.french,
      "id": AppLocalizations.of(context)!.indonesia,
    };

    return Row(
      children: [
        Expanded(
          child: Text(
            AppLocalizations.of(context)!.changeLanguage,
            style: StoryAppTypography.settingMenuTitle,
          ),
        ),
        DropdownButton<String>(
          value: provider.locale.languageCode,
          onChanged: (newValue) {
            if (newValue != null) {
              provider.setLocale(Locale(newValue));
            }
          },
          items: languageOptions.keys.map<DropdownMenuItem<String>>((key) {
            return DropdownMenuItem<String>(
              value: key,
              child: Text(languageOptions[key]!),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context, ThemeData theme) {
    return Card(
      color: theme.colorScheme.error,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          logout(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.logout,
                  style: StoryAppTypography.settingMenuTitle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.onError,
                  ),
                ),
              ),
              Icon(
                Icons.logout,
                color: theme.colorScheme.onError,
              )
            ],
          ),
        ),
      ),
    );
  }

  void logout(BuildContext context) async {
    bool? confirmed = await showConfirmationDialog(context);
    if (confirmed == true) {
      router.goNamed(PAGES.login.screenName);
      if (context.mounted) {
        context.read<LoginCubit>().logoutUser();
      }
    }
  }

  Future<bool?> showConfirmationDialog(BuildContext context) async {
    return showPlatformDialog(
      context: context,
      builder: (context) {
        return PlatformAlertDialog(
          title: Text(AppLocalizations.of(context)!.logout),
          content: Text(AppLocalizations.of(context)!.logoutConfirmation),
          actions: [
            TextButton(
              onPressed: () => context.pop(false),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () => context.pop(true),
              child: Text(AppLocalizations.of(context)!.logout),
            ),
          ],
        );
      },
    );
  }
}

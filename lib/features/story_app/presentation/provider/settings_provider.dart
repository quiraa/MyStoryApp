import 'package:dicoding_story_app/features/story_app/data/preference/app_preference.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  SettingsProvider() {
    _loadSettings();
  }

  void _loadSettings() async {
    final bool? isDarkMode = await AppPreference.getTheme();
    if (isDarkMode != null) {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }

    final String? localeCode = await AppPreference.getLanguage();
    if (localeCode != null) {
      _locale = Locale(localeCode);
      notifyListeners();
    }
  }

  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    AppPreference.setTheme(isDarkMode);
    notifyListeners();
  }

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      AppPreference.setLanguage(locale.languageCode);
      notifyListeners();
    }
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static const authKey = "AUTH_KEY";
  static const languageKey = "LANG_KEY";
  static const themeKey = "THEME_KEY";

  static Future<String?> getAuthKey() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(authKey);
  }

  static Future<void> setAuthKey(String newValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(authKey, newValue);
  }

  static Future<void> clearAuthKey() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(authKey);
  }

  static Future<void> setLanguage(String newValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageKey, newValue);
  }

  static Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageKey);
  }

  static Future<bool?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeKey);
  }

  static Future<void> setTheme(bool newValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, newValue);
  }
}

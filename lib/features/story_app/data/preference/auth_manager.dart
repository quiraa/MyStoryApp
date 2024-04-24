import 'package:dicoding_story_app/features/story_app/data/preference/app_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static Future<bool> isLogedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get(AppPreference.authKey);
    return token != null;
  }
}

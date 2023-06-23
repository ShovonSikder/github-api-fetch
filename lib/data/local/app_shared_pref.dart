import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static void setThemeMode(int themeMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('them_mode', themeMode);
  }

  static Future<int> getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('them_mode') ?? 0;
  }
}

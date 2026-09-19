import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static const _keyUserName = "user_name";
  static const _keyIsDarkMode = "is_darK_Mode";
  static const _keyVisitWelcomePage = "visit_welcome_page";

  Future<void> setUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserName, name);
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString(_keyUserName);
  }

  Future<void> setDarkMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsDarkMode, isDark);
  }

  Future<bool?> getDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(_keyIsDarkMode) ?? false;
  }

  Future<void> setVisitWelcome() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyVisitWelcomePage, true);
  }

  Future<bool?> getVisitWelcomePage() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(_keyVisitWelcomePage) ?? false;
  }
}

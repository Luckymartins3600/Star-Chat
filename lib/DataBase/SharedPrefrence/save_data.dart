import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
// SET DATA

  Future setStringDate(String value, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future setBoolData({@required bool value, @required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

// GET DATA

  Future<String> getStringData(
      {@required String key, String defaultValue = ''}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? defaultValue;
  }

  Future<bool> getBoolData({
    @required String key,
    bool defaultValue = false,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? defaultValue;
  }
}

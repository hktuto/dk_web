import 'package:dk_app_flutter/app/utils/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDefault {
  static UserDefault instance = UserDefault._internal();
  factory UserDefault() => instance;

  UserDefault._internal();
  late SharedPreferences _prefs;

  init() async {
    // _prefs = await SharedPreferences.getInstance();
  }

  String get fcmToken {
    return "";
  }

  set fcmToken(String value) {
    // _prefs.setString(ENV.FCM_TOKEN, value);
  }

  // String get accessToken => _prefs.getString(ENV.ACCESS_TOKEN) ?? "";
  set accessToken(String? value) {
    if (value != null) {
      _prefs.setString(ENV.ACCESS_TOKEN, value);
    }
  }

  set userName(String name) => _prefs.setString(ENV.USER_NAME, name);
  String get userName => _prefs.getString(ENV.USER_NAME) ?? "";

  logout() {
    _prefs.clear();
  }
}

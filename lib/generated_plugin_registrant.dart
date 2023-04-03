//
// Generated file. Do not edit.
//

// ignore_for_file: directives_ordering
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: depend_on_referenced_packages

// import 'package:awesome_notifications/awesome_notifications_web.dart';
import 'package:camera_web/camera_web.dart';
import 'package:connectivity_plus_web/connectivity_plus_web.dart';
// import 'package:device_info_plus_web/device_info_plus_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:flutter_keyboard_visibility_web/flutter_keyboard_visibility_web.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:video_player_web/video_player_web.dart';
import 'package:wakelock_web/wakelock_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  // AwesomeNotificationsWeb.registerWith(registrar);
  CameraPlugin.registerWith(registrar);
  ConnectivityPlusPlugin.registerWith(registrar);
  // DeviceInfoPlusPlugin.registerWith(registrar);
  FirebaseCoreWeb.registerWith(registrar);
  FlutterKeyboardVisibilityPlugin.registerWith(registrar);
  // UnityWidgetController.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  VideoPlayerPlugin.registerWith(registrar);
  WakelockWeb.registerWith(registrar);
  registrar.registerMessageHandler();
}
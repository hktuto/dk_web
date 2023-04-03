import 'package:dk_app_flutter/app/controllers/achievement_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/controllers/setting_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/login_model.dart';
import 'package:dk_app_flutter/app/modules/landing/controllers/landing_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingViewController extends GetxController {
  final storage = GetStorage();
  UserController user = Get.find<UserController>();
  RouterController router = Get.find<RouterController>();
  ScoreController score = Get.find<ScoreController>();
  AchievementController achievement = Get.find<AchievementController>();
  SettingController setting = Get.find<SettingController>();
  UnityController unity = Get.find<UnityController>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> saveLanguage(Locale locale) async {
    try {
      await setting.saveSetting(
          user.user.value.userId ?? '', 'language', locale.toString(), null);
      setting.language.value = locale.toString();
      Get.updateLocale(locale);
    } catch ($e) {}
  }

  void logout(BuildContext context) async {
    LandingController? landingController = Get.find<LandingController>();
    storage.remove('cookie');
    user.isLogin.value = false;
    user.user.value = Login();
    score.totalScore.value = 0;
    achievement.userAchievement.value = [];
    unity.sendMessage(method: "logout");
  }
}

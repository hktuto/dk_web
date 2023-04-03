import 'dart:developer';

import 'package:dk_app_flutter/app/controllers/achievement_controller.dart';
import 'package:dk_app_flutter/app/controllers/breathing_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/emotion_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/controllers/setting_controller.dart';
import 'package:dk_app_flutter/app/data/models/emotion_record.dart';
import 'package:dk_app_flutter/app/data/models/login_model.dart';
import 'package:dk_app_flutter/app/data/providers/login_provider.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
// import 'package:dk_app_flutter/app/utils/UserDefault.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../utils/logger.dart';

class UserController extends GetxController {
  final LoginProvider loginProvider = Get.put(LoginProvider());
  BreathingRecordController breathingRecord =
      Get.find<BreathingRecordController>();
  ScoreController score = Get.find<ScoreController>();
  AchievementController achievementController =
      Get.find<AchievementController>();

  EmotionRecordController emotionRecord = Get.find<EmotionRecordController>();

  RouterController router = Get.find<RouterController>();

  SettingController setting = Get.find<SettingController>();

  RxBool loading = false.obs;
  final user = Login().obs;
  RxBool isLogin = false.obs;

  RxInt contiuneLoginCount = 0.obs;

  Future<String?> getUserData() async {
    EasyLoading.show();
    await Future.wait([
      breathingRecord.getUserReocrd(),
      score.getUserTotalScore(),
      achievementController.getOptions(),
      achievementController.getUserAchievement(),
      setting.getSetting(user.value.userId ?? ''),
    ]);
    await emotionRecord.getUserRecoed();
    EmotionRecords? todayRecord = emotionRecord.todayHaveRecords();
    // String fcmToken = UserDefault().fcmToken;
    // if (fcmToken != null) {
    //   if (user.value.notificationToken != null &&
    //       user.value.notificationToken != fcmToken) {
    //     user.value.notificationToken = fcmToken;
    //   }
    // }
    if (todayRecord == null) {
      EasyLoading.dismiss();
      return Routes.CONFRIM_EMOTION;
    }
    EasyLoading.dismiss();
    return null;
  }

  Future<String?> login(Map data) async {
    try {
      final Login res = await loginProvider.postLogin(data);
      logger.i(res);
      user.value = res;
      isLogin.value = true;
      String? destination = await getUserData();
      return destination;
    } catch (e) {
      logger.i(e);
      isLogin.value = false;
      throw Exception(e);
    }
  }

  Future<bool> verify() async {
    try {
      final Login res = await loginProvider.verifyLogin();
      user.value = res;
      isLogin.value = true;
      String? destination = await getUserData();
      if (destination != null) {
        router.changePage(destination);
        return true;
      }
      return false;
    } on Exception catch (e) {
      isLogin.value = false;
      throw Exception(e);
    }
  }

  Future<void> register(Map data) async {
    try {
      logger.i(data);
      final Login res = await loginProvider.register(data);
      logger.i(res);
      return;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> forgetPassword(Map data) async {
    try {
      await loginProvider.forgetPassword(data);
    } catch (e) {
      throw Exception(e);
    }
  }
}

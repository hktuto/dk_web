import 'package:dk_app_flutter/app/controllers/achievement_controller.dart';
import 'package:dk_app_flutter/app/data/models/achievement_item.dart';
import 'package:dk_app_flutter/app/data/providers/score_provider.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:dart_numerics/dart_numerics.dart' as numerics;

class ScoreController extends GetxController {
  ScoreProvider scoreProvider = Get.put(ScoreProvider());
  RxInt totalScore = 0.obs;

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

  int makeBreathingScore(double duration) {
    // TODO: cal curve;
    double score = duration * 100;
    return score.round();
    // return (duration * 100).toStringAsFixed(0);
  }

  Future<void> checkAchiement(String type) async {
    AchievementController controller = Get.find<AchievementController>();
    AchievementItem? newAchievement;
    switch (type) {
      case 'Breathing':
        newAchievement = controller.calBreathingAchievement();
        break;
    }
    if (newAchievement != null) {
    } else {
      return;
    }
  }

  Future<void> saveUserScore(Map data) async {
    await scoreProvider.saveUserScore(data);
    // check ach
  }

  Future<void> getUserTotalScore() async {
    logger.i("getUserTotalScore");
    UserController user = Get.find<UserController>();
    Map data = {"user_id": user.user.value.userId};
    try {
      int s = await scoreProvider.getUserTotalRecord(data);
      totalScore.value = s;
    } catch ($e) {
      logger.e($e);
    }
    update();
  }

  void saveScore(Map data) {}
}

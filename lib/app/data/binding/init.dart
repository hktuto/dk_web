import 'package:dk_app_flutter/app/controllers/achievement_controller.dart';
import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/breathing_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/content_controller.dart';
import 'package:dk_app_flutter/app/controllers/emotion_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/register_flow_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/providers/login_provider.dart';
import 'package:dk_app_flutter/app/controllers/setting_controller.dart';

import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<LoginProvider>(
      () => LoginProvider(),
    );

    Get.put<UnityController>(UnityController(), permanent: true);
    Get.put<SettingController>(SettingController(), permanent: true);
    Get.put<RouterController>(RouterController(), permanent: true);
    Get.put<AchievementController>(AchievementController(), permanent: true);
    Get.put<ScoreController>(ScoreController(), permanent: true);
    Get.put<BreathController>(BreathController(), permanent: true);
    Get.put<BreathingRecordController>(BreathingRecordController(),
        permanent: true);
    Get.put<EmotionRecordController>(EmotionRecordController(),
        permanent: true);
    // finally create user controller
    Get.put<UserController>(UserController(), permanent: true);

    Get.put<ContentController>(ContentController(), permanent: true);
    Get.put<RegisterFLowController>(RegisterFLowController(), permanent: true);
  }
}

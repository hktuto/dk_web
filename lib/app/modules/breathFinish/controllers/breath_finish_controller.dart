import 'dart:developer';

import 'package:dk_app_flutter/app/controllers/achievement_controller.dart';
import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/breathing_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/content_controller.dart';
import 'package:dk_app_flutter/app/controllers/register_flow_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/score_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/achievement_item.dart';
import 'package:dk_app_flutter/app/data/models/content_model.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class BreathFinishController extends GetxController {
  BreathController breath = Get.find<BreathController>();
  UserController user = Get.find<UserController>();
  ScoreController score = Get.find<ScoreController>();
  BreathingRecordController record = Get.find<BreathingRecordController>();
  RouterController router = Get.find<RouterController>();
  ContentController content = Get.find<ContentController>();
  RegisterFLowController flow = Get.find<RegisterFLowController>();

  RxBool loading = false.obs;
  // State
  final feelingOptions = [0, 1, 2, 3];
  final feeling = 3.obs;

  RxInt totalScore = 0.obs;
  RxString duration = "".obs;
  RxInt bouns = 0.obs;

  @override
  void onClose() {}

  @override
  void onInit() {
    super.onInit();
    calScore();
  }

  void calScore() {
    print('calScore');
    totalScore.value = score.makeBreathingScore(breath.timeDuration.value /
        breath.currentOptionsSetting.value.duration);
    duration.value = breath.timeDuration.toStringAsFixed(0);
    bouns.value = record.calJouneryBonus();
    update();
  }

  Future<void> showAchievement() async {
    print('showAchievement');
    AchievementController controller = Get.find<AchievementController>();
    AchievementItem? newAchievement;

    newAchievement = controller.calBreathingAchievement();
    if (newAchievement == null) {
      print('no Achievement');
      return;
    }
    print(newAchievement);
    await controller.saveUserArchievement(newAchievement);
    return await Get.dialog(
      AlertDialog(
          title: Text(LocaleKeys.achievement_title.tr),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Text(newAchievement.name,
                    style: TextStyle(
                        color: HexColor('#65D952'),
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        color: HexColor('#65D952'),
                        borderRadius: BorderRadius.all(Radius.circular(80))),
                    child: Center(
                      child: Image.asset('assets/images/badge_breath.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(newAchievement.name,
                    style: const TextStyle(fontSize: 14.0)),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [HexColor("#92ACA0"), HexColor("#89B2C4")]),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          RouterController router =
                              Get.find<RouterController>();
                          var current = Get.routing.current;
                          router.shouldIgnorePointer(current);
                        },
                        child: Text(
                          LocaleKeys.general_close.tr,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      barrierDismissible: false,
    );
  }

  Future<void> submit() async {
    if (loading.isTrue) return;
    loading.value = true;
    Map data = {
      'user': user.user.value.userId,
      'product': breath.currentOptionsSetting.value.name,
      'duration': duration.value,
      'score': totalScore.value + bouns.value,
      'finishFeeling': feeling.value.toString()
    };
    Map scoreRecord = {
      'user': user.user.value.userId,
      'score': totalScore.value + bouns.value,
      "section": "breath",
    };

    // content query
    await Future.wait([
      record.createRecord(data),
      score.saveUserScore(scoreRecord),
    ]);
    await score.getUserTotalScore();
    print('get achievement');
    await showAchievement();
    print('finish achievement');
    EasyLoading.show();
    try {
      print('get contetn');
      List<Content>? posts = await content.getContent(
          "element", [breath.currentOptionsSetting.value.name], 1, 5);

      if (posts!.isNotEmpty) {
        loading.value = false;
        EasyLoading.dismiss();
        router.offPageWithProps(Routes.CONTENT, {"posts": posts});
      } else {
        loading.value = false;
        EasyLoading.dismiss();
        flow.shouldGoNextStep(Routes.MAIN);
      }
    } catch ($e) {
      logger.i($e);
      loading.value = false;
      EasyLoading.dismiss();
      flow.shouldGoNextStep(Routes.MAIN);
    }
    // get content
    // router.offPageWithProps(Routes.SCORE_RESULT, {
    //   "type": "Breathing",
    //   "score": (totalScore.value + bouns.value).toString(),
    //   "duration": duration.value,
    //   "bonus": bouns.toString(),
    //   "posts": posts
    // });
  }
}

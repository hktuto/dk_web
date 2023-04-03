import 'package:dk_app_flutter/app/controllers/achievement_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/data/models/achievement_item.dart';
import 'package:dk_app_flutter/app/data/models/dream_model.dart';
import 'package:dk_app_flutter/app/data/providers/dream_record_provider.dart';
import 'package:dk_app_flutter/app/modules/dream_list/controllers/dream_list_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class DreamDetailController extends GetxController {
  Rx<DreamItem> item = DreamItem().obs;
  DreamRecordProvider provider = Get.put(DreamRecordProvider());
  RouterController rotuer = Get.find<RouterController>();

  DreamListController listController = Get.find<DreamListController>();
  final dreamText = TextEditingController();
  final specificText = TextEditingController();
  final measurableText = TextEditingController();
  final achievableText = TextEditingController();
  final relevantText = TextEditingController();
  final timeText = TextEditingController();
  RxDouble process = 0.0.obs;
  RxBool loading = false.obs;

  List<String> fieldsType = [
    'health',
    'money',
    'career',
    'social',
    'love',
    'personal',
    'fun',
    'spirituality'
  ];

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> showAchievement() async {
    print('showAchievement');
    AchievementController achievement = Get.find<AchievementController>();
    AchievementItem? newAchievement;

    newAchievement = achievement.calDreamAchievement();
    if (newAchievement == null) {
      print('no Achievement');
      return;
    }

    print(newAchievement);
    await achievement.saveUserArchievement(newAchievement);
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

  void save() async {
    if (loading.isTrue) return;
    EasyLoading.show();
    loading.value = true;
    try {
      Map data = {
        'id': item.value.dreammachineId,
        'target': item.value.target,
        'process': process.value.toInt(),
        'dream': dreamText.text,
        'specific': specificText.text,
        'measurable': measurableText.text,
        'achievable': achievableText.text,
        'relevant': relevantText.text,
        'timeBound': timeText.text,
      };
      await provider.updateDrea(data);

      if (listController != null) {
        listController.getList();
      }
      Get.snackbar(LocaleKeys.general_success.tr, '',
          colorText: Colors.white,
          overlayColor: Colors.black,
          backgroundColor: Colors.black);
      // rotuer.changePage(Routes.DREAM_LIST);
    } catch ($e) {}
    loading.value = false;
    EasyLoading.dismiss();
    await showAchievement();
  }

  void delete() {}

  @override
  void onReady() {
    super.onReady();
    dreamText.text = item.value.dream.toString();
    specificText.text = item.value.specific.toString();
    measurableText.text = item.value.measurable.toString();
    achievableText.text = item.value.achievable.toString();
    relevantText.text = item.value.relevant.toString();
    timeText.text = item.value.timeBound.toString();
    process.value =
        item.value.process != null ? item.value.process!.toDouble() : 0;
  }

  @override
  void onClose() {
    super.onClose();
    dreamText.dispose();
    specificText.dispose();
    measurableText.dispose();
    achievableText.dispose();
    relevantText.dispose();
    timeText.dispose();
  }
}

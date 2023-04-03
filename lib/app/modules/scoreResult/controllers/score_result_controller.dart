import 'package:dk_app_flutter/app/controllers/achievement_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/data/models/achievement_item.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:get/get.dart';

class ScoreResultController extends GetxController {
  RouterController router = Get.find<RouterController>();

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

  Future<void> finish(String type) async {
    AchievementController controller = Get.find<AchievementController>();
    AchievementItem? newAchievement;
    switch (type) {
      case 'Breathing':
        newAchievement = controller.calBreathingAchievement();
        break;
    }
    if (newAchievement != null) {
      // save new archievement
      await controller.saveUserArchievement(newAchievement);
      router.changePageWithProps(Routes.NEW_ACHIEVEMENT, {
        'field': newAchievement.field,
        'value': newAchievement.value.toString(),
        'name': newAchievement.name
      });
    } else {
      router.changePage(Routes.MAIN);
    }
  }
}

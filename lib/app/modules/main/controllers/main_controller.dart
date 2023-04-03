import 'package:dk_app_flutter/app/controllers/achievement_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/achievement_item.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  AchievementController achievementController =
      Get.find<AchievementController>();
  UserController userController = Get.find<UserController>();
  RouterController router = Get.find<RouterController>();
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    AchievementItem? newAchievement = await achievementController
        .calLoginAchievement(userController.user.value.userId ?? '');
    if (newAchievement != null) {
      router.changePageWithProps(Routes.NEW_ACHIEVEMENT, {
        'field': newAchievement.field,
        'value': newAchievement.value.toString(),
        'name': newAchievement.name
      });
    }
  }

  @override
  void onClose() {}
}

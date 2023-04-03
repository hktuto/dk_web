import 'package:get/get.dart';

import '../controllers/new_achievement_controller.dart';

class NewAchievementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewAchievementController>(
      () => NewAchievementController(),
    );
  }
}

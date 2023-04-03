import 'package:get/get.dart';

import '../controllers/achievement_view_controller.dart';

class AchievementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AchievementViewController>(
      () => AchievementViewController(),
    );
  }
}

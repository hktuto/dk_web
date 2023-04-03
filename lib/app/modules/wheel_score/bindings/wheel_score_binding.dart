import 'package:get/get.dart';

import '../controllers/wheel_score_controller.dart';

class WheelScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WheelScoreController>(
      () => WheelScoreController(),
    );
  }
}

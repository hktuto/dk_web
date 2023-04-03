import 'package:get/get.dart';

import '../controllers/wheel_intro_controller.dart';

class WheelIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WheelIntroController>(
      () => WheelIntroController(),
    );
  }
}

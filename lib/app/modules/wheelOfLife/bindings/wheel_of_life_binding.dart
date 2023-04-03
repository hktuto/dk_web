import 'package:get/get.dart';

import '../controllers/wheel_of_life_controller.dart';

class WheelOfLifeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WheelOfLifeController>(
      () => WheelOfLifeController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/breath_finish_controller.dart';

class BreathFinishBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathFinishController>(
      () => BreathFinishController(),
    );
  }
}

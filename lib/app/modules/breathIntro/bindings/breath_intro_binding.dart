import 'package:get/get.dart';

import '../controllers/breath_intro_controller.dart';

class BreathIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathIntroController>(
      () => BreathIntroController(),
    );
  }
}

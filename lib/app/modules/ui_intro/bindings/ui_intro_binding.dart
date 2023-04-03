import 'package:get/get.dart';

import '../controllers/ui_intro_controller.dart';

class UiIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UiIntroController>(
      () => UiIntroController(),
    );
  }
}

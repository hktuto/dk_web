import 'package:get/get.dart';

import '../controllers/strength_intro_controller.dart';

class StrengthIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StrengthIntroController>(
      () => StrengthIntroController(),
    );
  }
}

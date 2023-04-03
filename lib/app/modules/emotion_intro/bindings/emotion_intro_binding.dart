import 'package:get/get.dart';

import '../controllers/emotion_intro_controller.dart';

class EmotionIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmotionIntroController>(
      () => EmotionIntroController(),
    );
  }
}

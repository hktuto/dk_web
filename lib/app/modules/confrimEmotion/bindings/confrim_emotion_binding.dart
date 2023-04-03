import 'package:get/get.dart';

import '../controllers/confrim_emotion_controller.dart';

class ConfrimEmotionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfrimEmotionController>(
      () => ConfrimEmotionController(),
    );
  }
}

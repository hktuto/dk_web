import 'package:get/get.dart';

import '../controllers/breath_video_controller.dart';

class BreathVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathVideoController>(
      () => BreathVideoController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/smile_score_controller.dart';

class SmileScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmileScoreController>(
      () => SmileScoreController(),
    );
  }
}

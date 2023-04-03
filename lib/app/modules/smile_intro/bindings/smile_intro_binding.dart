import 'package:get/get.dart';

import '../controllers/smile_intro_controller.dart';

class SmileIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmileIntroController>(
      () => SmileIntroController(),
    );
  }
}

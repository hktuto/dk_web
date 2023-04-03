import 'package:get/get.dart';

import '../controllers/dream_intro_controller.dart';

class DreamIntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DreamIntroController>(
      () => DreamIntroController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/dream_create_controller.dart';

class DreamCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DreamCreateController>(
      () => DreamCreateController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/dream_total_controller.dart';

class DreamTotalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DreamTotalController>(
      () => DreamTotalController(),
    );
  }
}

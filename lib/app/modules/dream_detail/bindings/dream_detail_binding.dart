import 'package:get/get.dart';

import '../controllers/dream_detail_controller.dart';

class DreamDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DreamDetailController>(
      () => DreamDetailController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/dream_list_controller.dart';

class DreamListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DreamListController>(
      () => DreamListController(),
    );
  }
}

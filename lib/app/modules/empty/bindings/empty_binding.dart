import 'package:get/get.dart';

import '../controllers/empty_controller.dart';

class EmptyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmptyController>(
      () => EmptyController(),
    );
  }
}

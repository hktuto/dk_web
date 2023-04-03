import 'package:get/get.dart';

import '../controllers/load_content_controller.dart';

class LoadContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadContentController>(
      () => LoadContentController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/content_view_controller.dart';

class ContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContentViewController>(
      () => ContentViewController(),
    );
  }
}

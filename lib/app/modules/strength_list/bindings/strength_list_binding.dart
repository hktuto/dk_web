import 'package:get/get.dart';

import '../controllers/strength_list_controller.dart';

class StrengthListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StrengthListController>(
      () => StrengthListController(),
    );
  }
}

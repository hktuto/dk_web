import 'package:get/get.dart';

import '../controllers/strength_create_controller.dart';

class StrengthCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StrengthCreateController>(
      () => StrengthCreateController(),
    );
  }
}

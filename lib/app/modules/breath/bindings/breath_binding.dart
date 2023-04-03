import 'package:dk_app_flutter/app/modules/breath/controllers/breath_controller.dart';
import 'package:get/get.dart';


class BreathBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathViewController>(
      () => BreathViewController(),
    );
  }
}

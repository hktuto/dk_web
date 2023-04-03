import 'package:get/get.dart';

import '../controllers/breath_register_flow_controller.dart';

class BreathRegisterFlowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BreathRegisterFlowController>(
      () => BreathRegisterFlowController(),
    );
  }
}

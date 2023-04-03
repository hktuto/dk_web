import 'package:dk_app_flutter/app/controllers/register_flow_controller.dart';
import 'package:get/get.dart';

class SmileIntroController extends GetxController {
  RegisterFLowController flow = Get.find<RegisterFLowController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void next() {
    flow.nextStep();
  }
}

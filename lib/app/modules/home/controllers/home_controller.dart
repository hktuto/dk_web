import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  BreathController breathController = Get.find<BreathController>();

  UserController userController = Get.find<UserController>();

  RxBool breath = false.obs;

  RxBool ready = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await userController.verify();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

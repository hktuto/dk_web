import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LandingController extends GetxController {
  UserController user = Get.find<UserController>();
  RouterController router = Get.find<RouterController>();
  UnityController unity = Get.find<UnityController>();
  final storage = GetStorage();
  final ready = false.obs;

  @override
  void onReady() {
    super.onReady();
    checkLogin();
  }

  @override
  void onClose() {}

  void checkLogin() async {
    try {
      logger.i(storage.read('cookie'));
      bool redirect = await user.verify();
      if (!redirect) {
        unity.sendMessage(
            message: "", method: "LoginFinish", gameObject: "Flow Controller");
        router.offPage(Routes.MAIN);
      }
    } catch (e) {
      logger.e(e);
      storage.remove('cookie');
      ready.value = true;
    }
  }
}

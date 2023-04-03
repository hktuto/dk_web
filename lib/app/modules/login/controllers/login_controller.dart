import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/login_model.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  UserController userController = Get.find<UserController>();
  RouterController router = Get.find<RouterController>();
  UnityController unity = Get.find<UnityController>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isError = false.obs;
  RxBool loading = false.obs;
  RxBool hidePassword = true.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: 'loginform');

  @override
  void onInit() {
    super.onInit();
    // formKey = formController.loginformKey;
  }

  @override
  void onClose() {
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }

  void togglePassword() {
    hidePassword.toggle();
    update();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'missing';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'missing';
    }
    return null;
  }

  bool formVaild() {
    return true;
  }

  Future<void> login() async {
    final isValid = formKey.currentState?.validate();
    if (isValid == null || loading.isTrue) {
      return;
    }
    isError.value = false;
    Map data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    loading.value = true;
    EasyLoading.show();
    try {
      String? destination = await userController.login(data);
      emailController.clear();
      passwordController.clear();
      Get.snackbar(LocaleKeys.login_success.tr, 'Welcome back',
          colorText: Colors.white,
          overlayColor: Colors.black,
          backgroundColor: Colors.black);
      // unity.sendMessage(
      //     message: "", method: "LoginFinish", gameObject: "Flow Controller");
      if (destination != null) {
        EasyLoading.dismiss();
        router.changePage(destination);
      } else {
        EasyLoading.dismiss();
        router.changePage(Routes.MAIN);
      }
    } catch (e) {
      logger.e(e);
      EasyLoading.dismiss();
      emailController.clear();
      passwordController.clear();
      isError.value = true;
      Get.snackbar(LocaleKeys.login_fail.tr, 'email or password not correct',
          colorText: Colors.white,
          overlayColor: Colors.black,
          backgroundColor: Colors.black);
    }
    loading.value = false;
  }
}

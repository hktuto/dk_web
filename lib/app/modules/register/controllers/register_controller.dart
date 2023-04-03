import 'package:dk_app_flutter/app/controllers/register_flow_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  UserController userController = Get.find<UserController>();
  UnityController unity = Get.find<UnityController>();
  RegisterFLowController flow = Get.find<RegisterFLowController>();
  // form controllers

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final countryCodeControler = TextEditingController(text: "+852");
  final mobileControler = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool hidePassword = true.obs;
  RxBool hideCondirmPassword = true.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: 'register');

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    mobileControler.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    countryCodeControler.dispose();
    super.onClose();
  }

  // toggle password
  void togglePassword() {
    logger.i("togglePassword");
    hidePassword.toggle();
    update();
  }

  void toggleConfirmPassword() {
    hideCondirmPassword.toggle();
    update();
  }

  String? validateRequireField(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.register_missing.tr;
    }
    return null;
  }

  String? checkPasswordMatch(String? confirmPassword) {
    if (confirmPassword != passwordController.text) {
      return LocaleKeys.register_passwordError.tr;
    } else {
      return null;
    }
  }

  Future<void> register() async {
    final isValid = formKey.currentState?.validate();
    if (isValid == null) {
      Get.snackbar('fail', LocaleKeys.register_notValid.tr,
          colorText: Colors.white,
          overlayColor: Colors.black,
          backgroundColor: Colors.black);
      return;
    }
    Map data = {
      "username": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "mobile": mobileControler.text,
      "mobile_country_code": countryCodeControler.text,
      "provider": "email"
    };
    try {
      await userController.register(data);

      // Get.back(id: 1);
      Get.snackbar(
          LocaleKeys.general_success.tr, LocaleKeys.register_success.tr,
          colorText: Colors.white,
          overlayColor: Colors.black,
          backgroundColor: Colors.black);
      // login
      Map loginForm = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      await userController.login(loginForm);
      unity.sendMessage(
          message: "", method: "LoginFinish", gameObject: "Flow Controller");
      flow.startFlow();
    } catch (e) {
      logger.i(e);
      Get.snackbar(LocaleKeys.general_fail.tr, LocaleKeys.register_fail.tr,
          colorText: Colors.white,
          overlayColor: Colors.black,
          backgroundColor: Colors.black);
    }
  }
}

import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ForgetPasswordController extends GetxController {
  UserController userController = Get.find<UserController>();
  RouterController router = Get.find<RouterController>();
  final emailController = TextEditingController();
  RxBool isError = false.obs;
  RxBool loading = false.obs;

  RxBool submited = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: 'forgetPassword');

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    submited.value = false;
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return  LocaleKeys.register_missing.tr;
    }
    return null;
  }

  Future<void> submit() async {
    final isValid = formKey.currentState?.validate();
    if (isValid == null || !isValid) {
      Get.snackbar(LocaleKeys.general_fail.tr, LocaleKeys.forget_password_emailMissing.tr,
          colorText: Colors.white,
          overlayColor: Colors.black,
          backgroundColor: Colors.black);
      return;
    }
    if (loading.isTrue) {
      return;
    }
    isError.value = false;
    Map data = {
      'email': emailController.text,
      'reset_password_text': {
        "title": LocaleKeys.forget_password_title.tr,
        "email_address": LocaleKeys.forget_password_email.tr,
        "password" : LocaleKeys.login_password,
        "retype_password": LocaleKeys.register_password_confirm.tr,
        "password_missmatch": LocaleKeys.register_passwordError.tr,
        "password_updated": LocaleKeys.forget_password_resetSuccess.tr
      }
    };
    loading.value = true;
    try {
      await userController.forgetPassword(data);
      emailController.clear();
      Get.snackbar(LocaleKeys.general_success.tr, '',
          colorText: Colors.white,
          overlayColor: Colors.black,
          backgroundColor: Colors.black);
      submited.value = true;
      update();
    } catch (e) {
      Get.snackbar(LocaleKeys.general_fail.tr, LocaleKeys.forget_password_fail.tr,
          colorText: Colors.white,
          overlayColor: Colors.black,
          backgroundColor: Colors.black);
      emailController.clear();
      submited.value = false;
      update();
    }
    loading.value = false;
  }
}

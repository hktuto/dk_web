import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/text_input_view.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    return DialogScreenView(
      topImage: "assets/images/bg-top-blue-login.png",
      child: Column(
        children: [
          const SizedBox(
            height: 60.0,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            child: SectionHeaderView(
                label: LocaleKeys.landing_login.tr, subtitle: '', showBack: false),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextInputView(
                          controller: controller.emailController,
                          labelText: LocaleKeys.login_email.tr,
                          validator: controller.validateEmail,
                          onEditingComplete: () => FocusScope.of(context).nextFocus(),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Obx(() => TextInputView(
                              controller: controller.passwordController,
                              labelText: LocaleKeys.login_password.tr,
                              validator: controller.validatePassword,
                              suffixIcon: IconButton(
                                onPressed: controller.togglePassword,
                                icon: Icon(
                                  controller.hidePassword.isTrue
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              obscureText: controller.hidePassword.value,
                              
                            )),
                        TextButton(
                            onPressed: () =>
                                router.changePage(Routes.FORGET_PASSWORD),
                            child: Text(LocaleKeys.login_forget_password.tr)),
                      ],
                    ),
                  ),
                )),
          ),
          KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
            return isKeyboardVisible
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                HexColor("#92ACA0"),
                                HexColor("#89B2C4")
                              ]),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: TextButton(
                              onPressed: () => controller.login(),
                              child: Text(
                                LocaleKeys.general_confirm.tr,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () => router.changePage(Routes.REGISTER),
                            child: Text(LocaleKeys.login_register.tr)),
                            SizedBox(
                              height: 60.0,
                            )
                      ],
                    ),
                  );
          }),
        ],
      ),
    );
  }
}

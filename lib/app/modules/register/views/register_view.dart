import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/views/text_input_view.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../views/section_header_view.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
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
                  label: LocaleKeys.register_title.tr,
                  subtitle: '',
                  showBack: false),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        // Email
                        TextInputView(
                          controller: controller.emailController,
                          labelText: LocaleKeys.register_email.tr,
                          validator: controller.validateRequireField,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                        ),
                        Spaces(),
                        // Username
                        TextInputView(
                          controller: controller.usernameController,
                          labelText: LocaleKeys.register_username.tr,
                          validator: controller.validateRequireField,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                        ),
                        Spaces(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: 1,
                                child: TextInputView(
                                  controller: controller.countryCodeControler,
                                  labelText: LocaleKeys.register_county.tr,
                                  maxLength: 4,
                                  onEditingComplete: () =>
                                      FocusScope.of(context).nextFocus(),
                                )),
                            const SizedBox(width: 4),
                            Flexible(
                              flex: 2,
                              child: TextInputView(
                                controller: controller.mobileControler,
                                labelText: LocaleKeys.register_mobile.tr,
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                              ),
                            ),
                          ],
                        ),
                        // Username

                        Spaces(),

                        Obx(() => TextInputView(
                              controller: controller.passwordController,
                              labelText: LocaleKeys.register_password.tr,
                              suffixIcon: IconButton(
                                  onPressed: controller.togglePassword,
                                  icon: Icon(
                                    controller.hidePassword.isTrue
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColor,
                                  )),
                              validator: controller.validateRequireField,
                              obscureText: controller.hidePassword.value,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                            )),
                        Spaces(),
                        Obx(() => TextInputView(
                              controller: controller.confirmPasswordController,
                              labelText:
                                  LocaleKeys.register_password_confirm.tr,
                              suffixIcon: IconButton(
                                  onPressed: controller.togglePassword,
                                  icon: Icon(
                                    controller.hideCondirmPassword.isTrue
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColor,
                                  )),
                              validator: controller.checkPasswordMatch,
                              obscureText: controller.hideCondirmPassword.value,
                            )),
                        Spaces(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
              return isKeyboardVisible
                  ? Container()
                  : Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 40),
                          child: SizedBox(
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
                                onPressed: () => controller.register(),
                                child: Text(
                                  LocaleKeys.general_confirm.tr,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.back(id: 1);
                              RouterController router =
                                  Get.find<RouterController>();
                              var current = Get.routing.current;
                              router.shouldIgnorePointer(current);
                            },
                            child: Text(LocaleKeys.general_back.tr)),
                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    );
            }),
          ],
        ));
  }
}

class Spaces extends StatelessWidget {
  const Spaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 12.0,
    );
  }
}

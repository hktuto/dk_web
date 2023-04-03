import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/views/text_input_view.dart';
import 'package:dk_app_flutter/app/views/dialog_screen_view.dart';
import 'package:dk_app_flutter/app/views/section_header_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
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
                label: "forget_password_title".tr,
                subtitle: '',
                showBack: false),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(() => controller.submited.isFalse
                  ? Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 40),
                      child: Column(
                        children: [
                          Form(
                              key: controller.formKey,
                              child: TextInputView(
                                controller: controller.emailController,
                                labelText: LocaleKeys.forget_password_email.tr,
                                validator: controller.validateEmail,
                              ))
                        ],
                      ),
                    )
                  : Center(
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 40),
                          child: Text(
                            LocaleKeys.forget_password_success_message.tr,
                            style: TextStyle(
                                color: HexColor("#817142"), fontSize: 18.0),
                          )),
                    )),
            ),
          ),
          KeyboardVisibilityBuilder(
            builder: ((p0, isKeyboardVisible) {
              return isKeyboardVisible
                  ? Container()
                  : Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 40),
                          child: Column(
                            children: [
                              Obx(() => controller.submited.isFalse
                                  ? SizedBox(
                                      width: double.infinity,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            HexColor("#92ACA0"),
                                            HexColor("#89B2C4")
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: TextButton(
                                          onPressed: () => controller.submit(),
                                          child: Text(
                                            LocaleKeys.general_confirm.tr,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container()),
                              TextButton(
                                  onPressed: () {
                                    Get.back(id: 1);
                                    RouterController router =
                                        Get.find<RouterController>();
                                    var current = Get.routing.current;
                                    router.shouldIgnorePointer(current);
                                  },
                                  child: Text(LocaleKeys.general_back.tr)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 60.0,
                        ),
                      ],
                    );
            }),
          )
        ],
      ),
    );
  }
}

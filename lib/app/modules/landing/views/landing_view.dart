import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/app/views/app_button_view.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  @override
  Widget build(BuildContext context) {
    UnityController unity = Get.find<UnityController>();
    RouterController router = Get.find<RouterController>();
    return Stack(
      children: [
        Positioned(
            left: 20,
            right: 20,
            bottom: 60,
            child: Obx(() => controller.ready.isTrue
                ? AppButton(
                    label: LocaleKeys.landing_login.tr,
                    action: () => router.changePage(Routes.LOGIN))
                : Container())),
        Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => Get.updateLocale(const Locale('en', 'US')),
                    child: Text(
                      LocaleKeys.language_en.tr,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )),
                const SizedBox(width: 6.0),
                TextButton(
                    onPressed: () => Get.updateLocale(const Locale('zh', 'TW')),
                    child: Text(
                      LocaleKeys.language_hk.tr,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )),
                const SizedBox(width: 6.0),
                TextButton(
                    onPressed: () => Get.updateLocale(const Locale('zh', 'CN')),
                    child: Text(
                      LocaleKeys.language_cn.tr,
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    )),
              ],
            ))
      ],
    );
  }
}

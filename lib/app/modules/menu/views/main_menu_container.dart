import 'package:dk_app_flutter/app/controllers/breath_controller.dart';
import 'package:dk_app_flutter/app/controllers/router_controller.dart';
import 'package:dk_app_flutter/app/modules/menu/views/menu_item_view.dart';
import 'package:dk_app_flutter/app/routes/app_pages.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuContainer extends StatelessWidget {
  const MainMenuContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RouterController router = Get.find<RouterController>();
    BreathController breathController = Get.find<BreathController>();
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuItemView(
              label: LocaleKeys.menu_strength.tr,
              icon: 'assets/images/strength.png',
              action: () => router.changePage(Routes.STRENGTH_LIST)),
        ],
      ),
      const SizedBox(
        height: 24.0,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        MenuItemView(
            label: LocaleKeys.menu_Wheel.tr,
            icon: 'assets/images/wheel.png',
            action: () => router.changePage(Routes.WHEEL_OF_LIFE)),
        // MenuItemView(
        //   label:LocaleKeys.menu_Smile.tr,
        //   icon: 'assets/images/dream.png',
        //   action : () => router.changePage(Routes.FACE_DETECTION)
        // ),
        MenuItemView(
            label: LocaleKeys.menu_Dream.tr,
            icon: 'assets/images/dream.png',
            action: () => router.changePage(Routes.DREAM_LIST)),
        //
      ]),
      const SizedBox(
        height: 24.0,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // MenuItemView(
        //     label: LocaleKeys.menu_breath.tr,
        //     icon: 'assets/images/breath.png',
        //     action: () => breathController.startBreath()),
        MenuItemView(
            label: LocaleKeys.menu_Emotion.tr,
            icon: 'assets/images/emotion.png',
            action: () => router.changePage(Routes.CONFRIM_EMOTION)),
        MenuItemView(
            label: LocaleKeys.menu_achievement.tr,
            icon: 'assets/images/achievement.png',
            action: () => router.changePage(Routes.ACHIEVEMENT)),
      ]),
    ]);
  }
}

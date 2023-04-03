import 'package:dk_app_flutter/app/controllers/setting_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/modules/setting/controllers/setting_view_controller.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BreathSettingView extends GetView {
  const BreathSettingView({Key? key, required this.controller})
      : super(key: key);

  final SettingViewController controller;
  @override
  Widget build(BuildContext context) {
    final SettingController setting = Get.find<SettingController>();
    final UserController userController = Get.find<UserController>();
    return Column(children: [
      Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(LocaleKeys.setting_breathDuration.tr),
                    Text(setting.breathDuration.value.toString()),
                  ],
                ),
                Slider(
                    max: 300,
                    min: 60,
                    divisions: 5,
                    value: setting.breathDuration.value.toDouble(),
                    onChanged: (value) {
                      final int intValue = value.toInt();
                      setting.saveSetting(
                          userController.user.value.userId ?? '',
                          'breathDuration',
                          "",
                          intValue);
                      setting.breathDuration.value = intValue;
                    })
              ])),
      Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(LocaleKeys.setting_breathInterval.tr),
                    Text(setting.breathInterval.value.toString())
                  ],
                ),
                Slider(
                    max: 10,
                    min: 2,
                    divisions: 8,
                    value: setting.breathInterval.value.toDouble(),
                    onChanged: (value) {
                      final int intValue = value.toInt();
                      setting.saveSetting(
                          userController.user.value.userId ?? '',
                          'breathInterval',
                          "",
                          intValue);
                      setting.breathInterval.value = intValue;
                    })
              ]))
    ]);
  }
}

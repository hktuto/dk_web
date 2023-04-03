import 'package:dk_app_flutter/app/modules/setting/controllers/setting_view_controller.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LanguageSettingView extends GetView {
  LanguageSettingView({Key? key, required this.controller}) : super(key: key);

  final SettingViewController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.setting_language.tr),
          DropdownButton(
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down),
            value: Get.locale,
            items: [
              DropdownMenuItem(
                  child: Text(LocaleKeys.language_en.tr),
                  value: Locale('en', "US")),
              DropdownMenuItem(
                  child: Text(LocaleKeys.language_hk.tr),
                  value: Locale('zh', "TW")),
              DropdownMenuItem(
                  child: Text(LocaleKeys.language_cn.tr),
                  value: Locale('zh', "CN")),
            ],
            onChanged: (Locale? val) {
              if (val != null) {
                controller.saveLanguage(val);
              }
            },
          )
        ]);
  }
}

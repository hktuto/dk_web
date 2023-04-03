import 'dart:developer';

import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/setting_model.dart';
import 'package:dk_app_flutter/app/data/providers/setting_provider.dart';
import 'package:dk_app_flutter/app/utils/Debouncer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/logger.dart';

class SettingController extends GetxController {
  final _debouncer = Debouncer(milliseconds: 50);

  // provider
  SettingProvider provider = Get.put(SettingProvider());

  // user setting state
  RxInt skipIntroVideo = 0.obs;
  RxInt musicMute = 0.obs;
  RxInt breathDuration = 300.obs;
  RxInt breathInterval = 10.obs;
  RxString language = 'en_US'.obs;
  // Reminder state

  RxInt dreamRemind = 1.obs;
  RxInt strengthRemind = 14.obs;
  RxInt wheelRemind = 14.obs;
  RxInt breathRemind = 3.obs;

  Future<void> saveAllSetting() async {
    final UserController userController = Get.find<UserController>();
    String user = userController.user.value.userId ?? '';
    List<Map> datas = [
      {
        'user_id': user,
        'value_name': breathDuration,
        'str_value': "",
        'int_value': breathDuration.value
      },
      {
        'user_id': user,
        'value_name': breathInterval,
        'str_value': "",
        'int_value': breathInterval.value
      },
    ];

    datas.map((data) async => await provider.saveItem(data));
    await getSetting(user);
    update();
  }

  Future<void> saveSetting(
      String user, String valueKey, String? strValue, int? intValue) async {
    Map data = {
      'value_name': valueKey,
      'user_id': user,
      "str_value": strValue,
      "int_value": intValue
    };
    try {
      _debouncer.run(() async {
        await provider.saveItem(data);
        getSetting(user);
      });
    } catch ($e) {
      logger.i($e);
    }
  }

  Future<void> getSetting(String userId) async {
    Map data = {"user_id": userId};
    try {
      List<UserSetting> list = await provider.getList(data);
      for (var item in list) {
        switch (item.valueName) {
          case 'skipIntroVideo':
            skipIntroVideo.value = item.intValue!;
            break;
          case 'musicMute':
            musicMute.value = item.intValue!;
            break;
          case 'breathDuration':
            breathDuration.value = item.intValue!;
            break;
          case 'breathInterval':
            breathInterval.value = item.intValue!;
            break;
          case 'language':
            language.value = item.strValue;
            List<String> encode = language.value.split('_');
            Get.updateLocale(Locale(encode[0], encode[1]));
            break;
          case 'dreamRemind':
            dreamRemind.value = item.intValue!;
            break;
          case 'strengthRemind':
            strengthRemind.value = item.intValue!;
            break;
          case 'wheelRemind':
            wheelRemind.value = item.intValue!;
            break;
          case 'breathRemind':
            breathRemind.value = item.intValue!;
            break;
        }
      }
      update();
    } catch ($e) {
      logger.i($e);
    }
  }
}

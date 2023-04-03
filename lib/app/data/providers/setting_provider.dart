import 'dart:convert';
import 'dart:developer';

import 'package:dk_app_flutter/app/data/models/setting_model.dart';
import 'package:dk_app_flutter/app/utils/api.dart';
import 'package:get/get.dart';

class SettingProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> saveItem(Map data) async =>
      await post('customization_set', data).then((res) {
        if (res.statusCode != 200) {
          throw Exception('fail');
        }
      });

  Future<List<UserSetting>> getList(Map data) async =>
      await post('user_customization_list', data).then((res) {
        if (res.statusCode != 200) {
          throw Exception('fail');
        }
        List<UserSetting> items = res.body.map<UserSetting>((item) {
          if (item is String) {
            item = json.decode(item);
          }
          return UserSetting.fromJson(item);
        }).toList();
        return items;
      });
}

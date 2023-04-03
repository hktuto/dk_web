import 'dart:convert';
import 'dart:developer';

import 'package:dk_app_flutter/app/data/models/achievement_item.dart';
import 'package:dk_app_flutter/app/utils/api.dart';
import 'package:get/get.dart';

class AchievementProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> saveUserAchievement(Map data) async =>
      await post('user_achievement_create', data).then((res) {
        return res.statusCode == 200;
      });

  Future<List<AchievementItem>> getUserAchievementList(Map data) async =>
      await post('user_achievements', data).then((res) {
        dynamic body = res.body;
        if (body is String) {
          body = jsonDecode(res.body);
        }

        List<AchievementItem> items = body
            .map<AchievementItem>((item) => AchievementItem.fromJson(item))
            .toList();
        return items;
      });

  Future<List<AchievementItem>> getAchievementList() async =>
      await post('achievement_list', null).then((res) {
        dynamic body = res.body;
        if (body is String) {
          body = jsonDecode(res.body);
        }
        List<AchievementItem> items = body
            .map<AchievementItem>((item) => AchievementItem.fromJson(item))
            .toList();
        return items;
      });

  Future<int> getUserMaxLogin(Map data) async =>
      await post('user_max_consecutive_days', data).then((res) {
        if (res.statusCode != 200) {
          return 0;
        }
        return res.body['max_consecutive_days'];
      });
}

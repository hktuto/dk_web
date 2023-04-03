import 'dart:developer';

import 'package:dk_app_flutter/app/controllers/breathing_record_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/achievement_item.dart';
import 'package:dk_app_flutter/app/data/providers/achievement_provider.dart';
import 'package:dk_app_flutter/app/modules/dream_list/controllers/dream_list_controller.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AchievementController extends GetxController {
  AchievementProvider provider = Get.put(AchievementProvider());

  RxList<AchievementItem> options = [AchievementItem()].obs;

  RxList<AchievementItem> userAchievement = [AchievementItem()].obs;

  final HexColor breathColor = HexColor('#D95252');
  final HexColor loginColor = HexColor('#65D952');

  List<String> loginAchievementType = ["login"];
  List<String> breathingAchievementType = [
    "breathing3aDayCount",
    "breathingTotal"
  ];

  List<String> wheelAchievementType = ["wheelMoreThan8", "wheelTotal"];

  List<String> dreamAchievementType = ["DreamCreateCount", "DreamFinishCount"];

  List<String> strenghtAchievementType = [
    "strengthCount",
  ];

  List<String> emotionAchievementType = [
    "emotionHappyRow",
    "emotionNegToPositive"
  ];

  Future<AchievementItem?> calLoginAchievement(String userId) async {
    try {
      AchievementItem? newAchievement;
      int maxDay = await provider.getUserMaxLogin({"user_id": userId});
      List<AchievementItem> items = filterTaskCatergoty(loginAchievementType)
          .where((element) => !filterUserArchivement(element))
          .toList();
      inspect(items);
      for (var item in items) {
        if (maxDay > item.value) {
          newAchievement = item;
        }
      }
      //
      if (newAchievement != null) {
        // save achiement;
        await saveUserArchievement(newAchievement);
      }
      return newAchievement;
    } catch ($e) {
      logger.i($e);
    }
  }

  // filter all achievement that user do not have
  // return last filtered Achievement
  AchievementItem? calBreathingAchievement() {
    BreathingRecordController record = Get.find<BreathingRecordController>();
    // all breathing archievement not own by user;
    AchievementItem? newAchievement;
    List<AchievementItem> items = filterTaskCatergoty(breathingAchievementType)
        .where((element) => !filterUserArchivement(element))
        .toList();

    int continueDay = record.calCountinesDay();
    int totalBreath = record.userRecords.length;
    print('total length : ' + totalBreath.toString());
    for (var item in items) {
      switch (item.field) {
        case 'breathing3aDayCount':
          if (continueDay >= item.value) {
            newAchievement = item;
          }
          break;
        case 'breathingTotal':
          if (totalBreath >= item.value) {
            newAchievement = item;
          }
          break;
      }
    }
    return newAchievement;
  }

  AchievementItem? calDreamAchievement() {
    DreamListController listController = Get.find<DreamListController>();
    AchievementItem? newAchievement;
    List<AchievementItem> items = filterTaskCatergoty(dreamAchievementType)
        .where((element) => !filterUserArchivement(element))
        .toList();
    int finishCount = listController.getFinishCount();
    for (var item in items) {
      switch (item.field) {
        case 'DreamCreateCount':
          if (listController.list.value.length >= item.value) {
            newAchievement = item;
          }
          break;
        case 'DreamFinishCount':
          if (finishCount >= item.value) {
            newAchievement = item;
          }
          break;
      }
    }
    return newAchievement;
  }

  Future<void> saveUserArchievement(AchievementItem item) async {
    UserController user = Get.find<UserController>();
    try {
      Map data = {
        "achievement": item.id?.oid ?? "",
        "user": user.user.value.userId
      };
      await provider.saveUserAchievement(data);
      getUserAchievement();
    } catch ($e) {
      throw Exception($e);
    }
  }

  List<AchievementItem> filterTaskCatergoty(List<String> categories) {
    List<AchievementItem> result = [];
    for (var item in options) {
      for (var cat in categories) {
        if (cat == item.field) {
          result.add(item);
        }
      }
    }
    return result;
  }

  bool filterUserArchivement(AchievementItem option) {
    bool result = false;
    for (var archievement in userAchievement) {
      if (archievement.field == option.field &&
          archievement.value == option.value) result = true;
    }
    return result;
  }

  Future<void> getUserAchievement() async {
    try {
      UserController user = Get.find<UserController>();
      Map data = {'user_id': user.user.value.userId};
      inspect(data);
      List<AchievementItem> res = await provider.getUserAchievementList(data);
      userAchievement.value = res;
    } catch ($e) {
      userAchievement.value = [];
      logger.i($e);
    }
  }

  Future<void> getOptions() async {
    try {
      List<AchievementItem> res = await provider.getAchievementList();
      options.value = res;
    } catch ($e) {
      options.value = [];
      logger.i($e);
    }
  }
}

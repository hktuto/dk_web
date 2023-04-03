import 'dart:math';

import 'package:dk_app_flutter/app/controllers/unity_controller.dart';
import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/models/breath_record_model.dart';
import 'package:dk_app_flutter/app/data/providers/breath_record_provider.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:dk_app_flutter/generated/locales.g.dart';
import 'package:get/get.dart';

class BreathingRecordController extends GetxController {
  final BreathRecordProvider provider = Get.put(BreathRecordProvider());
  RxInt todayBreathingCount = 0.obs;
  RxList<BreathRecord> userRecords = [BreathRecord()].obs;
  final UnityController unity = Get.find<UnityController>();
  int calCountinesDay() {
    int contiunerDay = 0;
    DateTime now = DateTime.now();
    DateTime lastday = DateTime(now.year, now.month, now.day);
    DateTime currentDate = lastday;
    int currentDateCount = 0;
    int maxDateCount = 0;
    for (var record in userRecords) {
      int recordTimeStamp = record.createdAt?.date ?? 0000000000;

      DateTime recordDate =
          DateTime.fromMillisecondsSinceEpoch(recordTimeStamp).toLocal();
      recordDate = DateTime(recordDate.year, recordDate.month, recordDate.day);

      if (currentDateCount == 0) {
        currentDate = recordDate;
        print('count init');
        currentDateCount++;
      } else {
        int dayDiff = currentDate.compareTo(recordDate);
        print(dayDiff);
        // check is same date
        if (dayDiff == 0) {
          // is same day
          currentDateCount++;
        } else if (dayDiff == 1) {
          // not same date
          if (currentDateCount >= 2) {
            contiunerDay++;
            currentDateCount = 0;
          }
        } else {
          currentDateCount = 0;
        }
      }
    }
    if (currentDateCount >= 3) {
      contiunerDay++;
    }
    return contiunerDay;
  }

  int calJouneryBonus() {
    int contiunerDay = calCountinesDay();
    return min(contiunerDay, 60);
  }

  int calTotalBreathingCountByDate(DateTime date) {
    DateTime targetDate = DateTime(date.year, date.month, date.day);
    // DateTime endTime = DateTime(date.year, date.month, date.day, 23, 59, 59);

    int count = 0;
    userRecords.forEach((element) {
      int date = element.createdAt?.date ?? 0000000000;
      DateTime eventDate = DateTime.fromMillisecondsSinceEpoch(date).toLocal();
      eventDate = DateTime(eventDate.year, eventDate.month, eventDate.day);
      if (eventDate.compareTo(targetDate) == 0) {
        count++;
      }
    });
    return count;
  }

  Future<void> getUserReocrd() async {
    UserController user = Get.find<UserController>();
    try {
      Map data = {"user_id": user.user.value.userId};
      final record = await provider.getRecord(data);
      userRecords.value = record;
      DateTime today = DateTime.now();

      todayBreathingCount.value = calTotalBreathingCountByDate(today);
      if (3 - todayBreathingCount.value > 0) {
        unity.sendMessage(
          method: "UpdateBreathCountText",
          message: LocaleKeys.main_breath_time_before.tr +
              (3 - todayBreathingCount.value).toString() +
              LocaleKeys.main_breath_time_after.tr,
        );
      } else {
        unity.sendMessage(
          method: "UpdateBreathCountText",
          message: LocaleKeys.menu_breath.tr,
        );
      }

      // send breath text to unity

    } catch ($e) {
      logger.e('get record error');
    }
  }

  Future<void> createRecord(Map data) async {
    try {
      await provider.createRecord(data);
      await getUserReocrd();
    } catch ($e) {
      logger.e($e);
    }
  }
}

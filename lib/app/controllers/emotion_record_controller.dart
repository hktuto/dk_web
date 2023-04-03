import 'package:dk_app_flutter/app/controllers/user_controller.dart';
import 'package:dk_app_flutter/app/data/providers/emotion_record_provider%20copy.dart';
import 'package:get/get.dart';

import '../data/models/emotion_record.dart';

class EmotionRecordController extends GetxController {
  EmotionRecordProvider provider = Get.put(EmotionRecordProvider());

  RxList<dynamic> record = List.empty().obs;

  EmotionRecords? todayHaveRecords() {
    if (record.isEmpty) {
      return null;
    }
    DateTime now = DateTime.now();
    DateTime lastday = DateTime(now.year, now.month, now.day);
    DateTime currentDate = lastday;

    int recordTimeStamp = record.last.createdAt?.date ?? 0000000000;
    DateTime recordDate =
        DateTime.fromMillisecondsSinceEpoch(recordTimeStamp).toLocal();
    recordDate = DateTime(recordDate.year, recordDate.month, recordDate.day);

    int dayDiff = currentDate.compareTo(recordDate);

    if (dayDiff == 0) {
      return record.last;
    }
    return null;
  }

  Future<void> getUserRecoed() async {
    UserController user = Get.find<UserController>();
    record.value = await provider.getRecord({
      'user_id': user.user.value.userId,
    });
    update();
  }

  Future<void> updateTodayRecord(EmotionRecords todayRecord, Map data) async {
    update();
  }

  createOrUpdateScore(Map data) async {
    EmotionRecords? todayRecord = todayHaveRecords();
    if (todayRecord != null) {
      await updateTodayRecord(todayRecord, data);
    } else {
      await provider.createRecord(data);
    }
    await getUserRecoed();
  }
}

import 'dart:convert';

import 'package:dk_app_flutter/app/data/models/emotion_record.dart';
import 'package:dk_app_flutter/app/data/models/score_record_model.dart';
import 'package:dk_app_flutter/app/utils/api.dart';
import 'package:dk_app_flutter/app/utils/logger.dart';
import 'package:get/get.dart';

class EmotionRecordProvider extends ApiConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (map) {
      try {
        if (map == null) return throw Exception('error response');
        if (map is String) map = jsonDecode(map);
        if (map is Map<String, dynamic>) return EmotionRecords.fromJson(map);
        if (map is List) {
          return map.map((item) => EmotionRecords.fromJson(item)).toList();
        }
      } catch ($e) {
        logger.i($e);
        return map;
      }
    };
  }

  Future<void> createRecord(Map data) async =>
      await post('emotion_record_create', data);

  Future<List<EmotionRecords>> getRecord(Map data) async =>
      await post('user_emotion_records', data).then((res) => res.body);

  Future<EmotionRecords> getlatestRecord(Map data) async =>
      await post('user_latest_emotion_record', data).then((res) => res.body);
}
